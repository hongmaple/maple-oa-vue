package com.ruoyi;

import com.ruoyi.oa.service.IOaHolidayService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest // 此注解只能在 springboot 主包下使用 需包含 main 方法与 yml 配置文件
@DisplayName("单元测试案例")
public class HolidayTest {

    @Autowired
    private IOaHolidayService holidayService;

    @DisplayName("自动导入节假日")
    @Test
    public void autoAdd() {
        holidayService.autoAdd("2024");
    }

}
