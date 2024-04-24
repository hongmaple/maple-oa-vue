package com.ruoyi.common.dto;
 
import java.util.List;
 
import lombok.Data;
 
@Data
public class HolidayData {
 
	private Integer month;	//当前月份
	private Integer year;	//当前年份
	private List<HolidayVo> days;
}