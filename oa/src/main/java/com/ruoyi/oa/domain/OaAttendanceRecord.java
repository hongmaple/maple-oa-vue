package com.ruoyi.oa.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
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
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "打卡时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date attendanceTime;

    /** 上班时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上班时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 下班时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下班时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

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

    public Date getAttendanceTime() 
    {
        return attendanceTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
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
