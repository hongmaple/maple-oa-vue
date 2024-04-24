package com.ruoyi.common.dto;
 
import lombok.Data;

import java.util.Date;

@Data
public class HolidayVo {
 
	private Date date;	//当前日期
	private Integer weekDay;	//当前周第几天 1-周一 2-周二 ... 7-周日
	private String yearTips;	//天干地支纪年法描述 例如：戊戌
	private Integer type;	//类型 0 工作日 1 休息日 2 节假日 如果ignoreHoliday参数为true，这个字段不返回
	private String typeDes;	//类型描述 比如 国庆,休息日,工作日 如果ignoreHoliday参数为true，这个字段不返回
	private String chineseZodiac;	//属相 例如：狗
	private String solarTerms;	//节气描述 例如：小雪
	private String avoid;	//不宜事项
	private String lunarCalendar;	//农历日期
	private String suit;	//宜事项
	private Integer dayOfYear;	//这一年的第几天
	private Integer weekOfYear;	//这一年的第几周
	private String constellation;	//星座
	private Integer indexWorkDayOfMonth;	//如果当前是工作日 则返回是当前月的第几个工作日，否则返回0 如果ignoreHoliday参数为true，这个字段不返回
}