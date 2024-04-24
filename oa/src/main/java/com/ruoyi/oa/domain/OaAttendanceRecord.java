package com.ruoyi.oa.domain;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 打卡记录对象 oa_attendance_record
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
public class OaAttendanceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 打卡时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "打卡时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date attendanceTime;

    /** 上班时间 */
    @Excel(name = "上班时间", width = 30)
    private LocalTime  startTime;

    /** 下班时间 */
    @Excel(name = "下班时间", width = 30)
    private LocalTime  endTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date nowDate;

    /**
     * 阳历日期
     */
    private String day;
    /**
     * 农历日期
     */
    private String chineseday;

    private OaHoliday holiday;

    private List<OaAttendanceRecord> list;

    private Integer year;// 获取当前年份

    private Integer month;// 获取当前月份

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAttendanceTime(Date attendanceTime) 
    {
        this.attendanceTime = attendanceTime;
    }

    public Date  getAttendanceTime()
    {
        return attendanceTime;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime  startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime  endTime) {
        this.endTime = endTime;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getChineseday() {
        return chineseday;
    }

    public void setChineseday(String chineseday) {
        this.chineseday = chineseday;
    }

    public OaHoliday getHoliday() {
        return holiday;
    }

    public void setHoliday(OaHoliday holiday) {
        this.holiday = holiday;
    }

    public List<OaAttendanceRecord> getList() {
        return list;
    }

    public void setList(List<OaAttendanceRecord> list) {
        this.list = list;
    }

    public Date getNowDate() {
        return nowDate;
    }

    public void setNowDate(Date nowDate) {
        this.nowDate = nowDate;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("attendanceTime", getAttendanceTime())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
