package com.ruoyi.oa.dto.vo;

import com.ruoyi.oa.domain.OaAttendanceRecord;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class AttendanceStatisticsVo {

    private List<OaAttendanceRecord> list;

    private Date startTime;

    private Date endTime;

}
