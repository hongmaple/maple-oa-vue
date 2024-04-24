package com.ruoyi;

import com.ruoyi.common.utils.MyCalendar;
import com.ruoyi.oa.service.IOaHolidayService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;

@SpringBootTest // 此注解只能在 springboot 主包下使用 需包含 main 方法与 yml 配置文件
@DisplayName("单元测试案例")
public class HolidayTest {

    @Autowired
    private IOaHolidayService holidayService;

    @DisplayName("自动导入节假日")
    @Test
    public void autoAdd() {
        holidayService.autoAdd("2025");
    }

    @Test
    public void MyCalendar() {
        MyCalendar mc = new MyCalendar();
        Calendar rightNow = Calendar.getInstance();
        int year = rightNow.get(Calendar.YEAR);// 获取当前年份
        int month = rightNow.get(Calendar.MONTH) + 1;// 获取当前月份
        year = 2024;
        month = 2;
        mc.setyear(year);
        mc.setmonth(month);
        String[] day = mc.getCalendar();// 阳历日期
        String[] chineseday = mc.getchineseCalendar_festival_solarterms();// 农历日期

        // 以下为输出
        System.out.println(mc.getyear() + "年" + mc.getmonth() + "月");
        System.out.println();
        String[] week = { "日", "一", "二", "三", "四", "五", "六" };
        for (String str : week) {
            System.out.printf("%-10s", " " + str);
        }
        System.out.println();
        boolean bool = false;
        int n = 0;
        for (int i = 0; i < day.length; i++) {
            System.out.printf("%-10s", "  " + day[i]);
            n++;
            if (n == 7) {
                System.out.println();
                int k = mc.getweekDay();
                for (int j = 0; j < k; j++) {
                    System.out.printf("%10s", "");
                }
                for (int j = k; j < 7; j++) {
                    System.out.printf("%10s", chineseday[j]);
                }
                System.out.println();
            }
            if (n % 7 == 0 && n != 7) {
                System.out.println();
                bool = true;
            }
            if (bool == true) {
                for (int j = (n - 7); j < n; j++) {
                    System.out.printf("%10s", chineseday[j]);
                }
                if (n != day.length) {
                    System.out.println();
                }
                bool = false;
            }
            if (n == day.length && n % 7 != 0) {
                System.out.println();
                for (int j = (n - n % 7); j < n; j++) {
                    System.out.printf("%10s", chineseday[j]);
                }
            }
        }
        System.out.println();
    }

}
