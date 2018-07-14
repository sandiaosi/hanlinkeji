/**
 * Copyright (C), 2018-2018, 北斗翰林
 * FileName: RequestUtils
 * Author:   xuguojun
 * Date:     2018/7/10 下午10:37
 * Description: //描述
 * History: //历史记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.hanlinkeji.edu.comm;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 *〈功能详细描述〉
 *
 * @author xuguojun
 */
public class RequestUtils {
    public static Map<String,Object> getRequestParamMap(HttpServletRequest request)
    {
        Map<String,Object> map = new HashMap<>();
        //得到枚举类型的参数名称，参数名称若有重复的只能得到第一个
        Enumeration enums = request.getParameterNames();
        int iDisplayStart=0;
        int iDisplayLength=10;
        while (enums.hasMoreElements())
        {
            String paramName = (String) enums.nextElement();
            String paramValue = request.getParameter(paramName);
            if("iDisplayStart".equals(paramName)){
                iDisplayStart=Integer.valueOf(paramValue);
            }
            if("iDisplayLength".equals(paramName)){
                iDisplayLength=Integer.valueOf(paramValue);
            }

            //形成键值对应的map
            map.put(paramName, paramValue);
        }
        map.put("pageNum", iDisplayStart / iDisplayLength + 1);
        map.put("pageSize", iDisplayLength);
        return map;
    }

}
