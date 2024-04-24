package com.ruoyi.common.dto;
 
import java.util.List;
 
import lombok.Data;
 
@Data
public class HolidayResult {
 
	private Integer code;	//状态码 1.返回成功 0.返回失败
	private String msg;	//提示信息
	private List<HolidayData> data;
}