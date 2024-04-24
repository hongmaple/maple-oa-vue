package com.ruoyi.common.utils;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.http.server.HttpServerRequest;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.dto.HolidayData;
import com.ruoyi.common.dto.HolidayResult;
import com.ruoyi.common.dto.HolidayVo;
import com.ruoyi.common.utils.http.HttpUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
@Slf4j
public class HolidayUtil {

    public List<HolidayData> getDay(String d) {
        /*
         * 互联网节假日api接口，公安网需要主动导入配置
         * www.mxnzp.com
         * ignoreHoliday: 是否忽略节假日，仅仅获取万年历，默认值false
         */
        String url = "https://www.mxnzp.com/api/holiday/list/year/"+d+"?ignoreHoliday=false&app_id=xomfiloxnrwtzqks&app_secret=Y1h0bU51TnIrSE9xaUZIcVdvekxNZz09";
        String resultStr = HttpUtil.get(url, CharsetUtil.CHARSET_UTF_8);
        HolidayResult result = JSONObject.parseObject(resultStr,HolidayResult.class);
        if(result.getCode() == null && result.getCode() != 1){
            log.debug("请求失败");
        }

        return result.getData();
    }

    public String importDay(HolidayResult result) {
        if(result == null){
            return "不能为空";
        }

        if(result.getCode() != null && result.getCode() == 1){
            //成功: code: 状态码 1.返回成功 0.返回失败
            if(!CollectionUtils.isEmpty(result.getData())){
                for (HolidayData data : result.getData()) {
                    System.out.println("月份: "+data.getMonth());
                    for (HolidayVo day : data.getDays()) {
                        System.out.println(day.getDate()+"\t"+day.getType()+"\t"+day.getTypeDes());
                    }
                    System.out.println("\n");
                }
            }
        }else{
            //失败
        }

        return result.getMsg();
    }

}
