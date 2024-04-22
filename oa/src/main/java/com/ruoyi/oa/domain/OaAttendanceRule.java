package com.ruoyi.oa.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 打卡规则对象 oa_attendance_rule
 * 
 * @author maple
 * @date 2024-04-22
 */
public class OaAttendanceRule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 工作日 */
    @Excel(name = "工作日")
    private String weekday;

    /** 休息日 */
    @Excel(name = "休息日")
    private String restDay;

    /** 上班时间 */
    @JsonFormat(pattern = "hh:mm")
    @Excel(name = "上班时间", width = 30, dateFormat = "hh:mm")
    private Date startTime;

    /** 下班时间 */
    @JsonFormat(pattern = "hh:mm")
    @Excel(name = "下班时间", width = 30, dateFormat = "hh:mm")
    private Date endTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setWeekday(String weekday) 
    {
        this.weekday = weekday;
    }

    public String getWeekday() 
    {
        return weekday;
    }
    public void setRestDay(String restDay) 
    {
        this.restDay = restDay;
    }

    public String getRestDay() 
    {
        return restDay;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("weekday", getWeekday())
            .append("restDay", getRestDay())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("remark", getRemark())
            .toString();
    }
}
