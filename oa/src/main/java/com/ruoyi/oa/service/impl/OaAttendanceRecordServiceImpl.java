package com.ruoyi.oa.service.impl;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.MyCalendar;
import com.ruoyi.oa.domain.OaHoliday;
import com.ruoyi.oa.dto.vo.AttendanceStatisticsVo;
import com.ruoyi.oa.service.IOaHolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.oa.mapper.OaAttendanceRecordMapper;
import com.ruoyi.oa.domain.OaAttendanceRecord;
import com.ruoyi.oa.service.IOaAttendanceRecordService;

/**
 * 打卡记录Service业务层处理
 *
 * @author ruoyi
 * @date 2024-04-22
 */
@Service
public class OaAttendanceRecordServiceImpl implements IOaAttendanceRecordService {
    @Autowired
    private OaAttendanceRecordMapper oaAttendanceRecordMapper;

    @Autowired
    private IOaHolidayService holidayService;

    /**
     * 查询打卡记录
     *
     * @param id 打卡记录主键
     * @return 打卡记录
     */
    @Override
    public OaAttendanceRecord selectOaAttendanceRecordById(Long id) {
        return oaAttendanceRecordMapper.selectOaAttendanceRecordById(id);
    }

    /**
     * 查询打卡记录列表
     *
     * @param oaAttendanceRecord 打卡记录
     * @return 打卡记录
     */
    @Override
    public List<OaAttendanceRecord> selectOaAttendanceRecordList(OaAttendanceRecord oaAttendanceRecord) {
        return oaAttendanceRecordMapper.selectOaAttendanceRecordList(oaAttendanceRecord);
    }

    /**
     * 新增打卡记录
     *
     * @param oaAttendanceRecord 打卡记录
     * @return 结果
     */
    @Override
    public int insertOaAttendanceRecord(OaAttendanceRecord oaAttendanceRecord) {
        Map<String, Object> params = new HashMap<>(2);
        Date nowDate = DateUtils.getNowDate();
        params.put("beginAttendanceTime", DateUtil.format(DateUtil.beginOfDay(nowDate), "yyyy-MM-dd HH:mm:ss"));
        params.put("endAttendanceTime", DateUtil.format(DateUtil.endOfDay(nowDate), "yyyy-MM-dd HH:mm:ss"));
        // 获取当前时间
        LocalTime currentTime = LocalTime.now();
        OaAttendanceRecord query = new OaAttendanceRecord();
        query.setCreateBy(oaAttendanceRecord.getCreateBy());
        query.setParams(params);
        List<OaAttendanceRecord> oaAttendanceRecords = selectOaAttendanceRecordList(query);

        // 从LocalDateTime中提取出LocalTime
        LocalTime startLocalTime = oaAttendanceRecord.getStartTime();

        // 从LocalDateTime中提取出LocalTime
        LocalTime endLocalTime = oaAttendanceRecord.getEndTime();

        // 将Date对象转换为LocalDateTime
        LocalDateTime nowLocalDateTime = LocalDateTime.ofInstant(nowDate.toInstant(), ZoneId.systemDefault());

        // 从LocalDateTime中提取出LocalTime
        LocalTime nowLocalTime = nowLocalDateTime.toLocalTime();

        oaAttendanceRecords.sort(Comparator.comparing(OaAttendanceRecord::getId).reversed());
        if (CollectionUtil.isEmpty(oaAttendanceRecords)) {
            if (startLocalTime.getHour() - nowLocalTime.getHour() > 1) {
                throw new ServiceException("未到打卡时间");
            }
            oaAttendanceRecord.setCreateTime(nowDate);
            oaAttendanceRecord.setAttendanceTime(oaAttendanceRecord.getCreateTime());

            oaAttendanceRecord.setRemark(nowLocalTime.isAfter(startLocalTime) ? "迟到" : "打卡成功");
            return oaAttendanceRecordMapper.insertOaAttendanceRecord(oaAttendanceRecord);
        } else if (oaAttendanceRecords.size() == 1) {
            oaAttendanceRecord.setCreateTime(DateUtils.getNowDate());
            oaAttendanceRecord.setAttendanceTime(oaAttendanceRecord.getCreateTime());
            oaAttendanceRecord.setRemark(nowLocalTime.isBefore(endLocalTime) ? "早退" : "打卡成功");
            return oaAttendanceRecordMapper.insertOaAttendanceRecord(oaAttendanceRecord);
        } else if (oaAttendanceRecords.size() == 2) {
            oaAttendanceRecord.setRemark(nowLocalTime.isBefore(endLocalTime) ? "早退" : "打卡成功");
            OaAttendanceRecord attendanceRecord = oaAttendanceRecords.stream().max(Comparator.comparingLong(OaAttendanceRecord::getId))
                    .orElse(new OaAttendanceRecord());
            oaAttendanceRecord.setId(attendanceRecord.getId());
            return updateOaAttendanceRecord(oaAttendanceRecord);
        }
        return 1;
    }

    /**
     * 修改打卡记录
     *
     * @param oaAttendanceRecord 打卡记录
     * @return 结果
     */
    @Override
    public int updateOaAttendanceRecord(OaAttendanceRecord oaAttendanceRecord) {
        oaAttendanceRecord.setUpdateTime(DateUtils.getNowDate());
        oaAttendanceRecord.setAttendanceTime(oaAttendanceRecord.getUpdateTime());
        return oaAttendanceRecordMapper.updateOaAttendanceRecord(oaAttendanceRecord);
    }

    /**
     * 批量删除打卡记录
     *
     * @param ids 需要删除的打卡记录主键
     * @return 结果
     */
    @Override
    public int deleteOaAttendanceRecordByIds(Long[] ids) {
        return oaAttendanceRecordMapper.deleteOaAttendanceRecordByIds(ids);
    }

    /**
     * 删除打卡记录信息
     *
     * @param id 打卡记录主键
     * @return 结果
     */
    @Override
    public int deleteOaAttendanceRecordById(Long id) {
        return oaAttendanceRecordMapper.deleteOaAttendanceRecordById(id);
    }

    @Override
    public AttendanceStatisticsVo attendanceStatistics(OaAttendanceRecord oaAttendanceRecord) {
        AttendanceStatisticsVo attendanceStatisticsVo = new AttendanceStatisticsVo();
        attendanceStatisticsVo.setStartTime(oaAttendanceRecord.getStartTime());
        attendanceStatisticsVo.setEndTime(oaAttendanceRecord.getEndTime());
        MyCalendar mc = new MyCalendar();
        Calendar rightNow = Calendar.getInstance();
        int year = rightNow.get(Calendar.YEAR);// 获取当前年份
        int month = rightNow.get(Calendar.MONTH) + 1;// 获取当前月份
        if (oaAttendanceRecord.getParams() != null) {
            if (oaAttendanceRecord.getParams().get("year") != null && oaAttendanceRecord.getParams().get("month") != null) {
                year = Integer.parseInt(oaAttendanceRecord.getParams().get("year").toString());
                month = Integer.parseInt(oaAttendanceRecord.getParams().get("month").toString());
            }
        }
        attendanceStatisticsVo.setYear(year);
        attendanceStatisticsVo.setMonth(month);
        mc.setyear(year);
        mc.setmonth(month);
        String[] day = mc.getCalendar();// 阳历日期
        String[] chineseday = mc.getchineseCalendar_festival_solarterms();// 农历日期

        String dateStr = year + "-" + month + "-01 00:00:00";
        Date startDate = DateUtil.parse(dateStr);
        Date endDate = new Date();
        if (month >= 1) {
            dateStr = year + "-" + (month + 1) + "-01 00:00:00";
            endDate = DateUtil.parse(dateStr);
        } else if (month == 12) {
            dateStr = (year + 1) + "-01" + "-01 00:00:00";
            endDate = DateUtil.parse(dateStr);
        }
        //查询节假日
        OaHoliday oaHoliday = new OaHoliday();
        HashMap<String, Object> holidayParams = new HashMap<>();
        holidayParams.put("beginDate", startDate);
        holidayParams.put("endDate", endDate);
        oaHoliday.setParams(holidayParams);
        List<OaHoliday> oaHolidays = holidayService.selectOaHolidayList(oaHoliday);

        oaAttendanceRecord.getParams().put("beginAttendanceTime", startDate);
        oaAttendanceRecord.getParams().put("endAttendanceTime", endDate);
        List<OaAttendanceRecord> oaAttendanceRecords = selectOaAttendanceRecordList(oaAttendanceRecord);
        List<OaAttendanceRecord> resultList = new LinkedList<>();
        for (int i = 0; i < day.length; i++) {
            String dayStr = day[i];
            if (!dayStr.equals("")) {
                OaAttendanceRecord record = new OaAttendanceRecord();
                record.setYear(year);
                record.setMonth(month);
                record.setDay(dayStr);
                record.setChineseday(chineseday[i]);
                int finalMonth = month;
                record.setHoliday(oaHolidays.stream().filter(h -> Integer.parseInt(dayStr) == DateUtil.toLocalDateTime(h.getDate()).getDayOfMonth()
                        && finalMonth == DateUtil.toLocalDateTime(h.getDate()).getMonthValue()).findAny().orElse(null));
                List<OaAttendanceRecord> list = oaAttendanceRecords.stream().filter(a -> DateUtil.toLocalDateTime(a.getAttendanceTime()).getDayOfMonth()
                        == Integer.parseInt(dayStr) && finalMonth == DateUtil.toLocalDateTime(a.getAttendanceTime()).getMonthValue()).collect(Collectors.toList());
                record.setList(list);
                resultList.add(record);
            } else {
                resultList.add(new OaAttendanceRecord());
            }
        }

        attendanceStatisticsVo.setList(resultList);
        return attendanceStatisticsVo;

    }
}
