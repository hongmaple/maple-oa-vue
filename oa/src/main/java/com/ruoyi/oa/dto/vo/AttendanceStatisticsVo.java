package com.ruoyi.oa.dto.vo;

import com.ruoyi.oa.domain.OaAttendanceRecord;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.List;

public class AttendanceStatisticsVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private List<OaAttendanceRecord> list;

    private LocalTime startTime;

    private LocalTime endTime;

    private Integer year;
    private Integer month;

    public List<OaAttendanceRecord> getList() {
        return list;
    }

    public void setList(List<OaAttendanceRecord> list) {
        this.list = list;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
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
}
