/**
 * Copyright (C), 2018-2018, 北斗翰林
 * FileName: adminController
 * Author:   xuguojun
 * Date:     2018/7/10 下午5:41
 * Description: //描述
 * History: //历史记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.hanlinkeji.edu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 *
 *〈功能详细描述〉
 *
 * @author xuguojun
 */
@Controller
@RequestMapping("backHomeManage")
public class adminController {
    @RequestMapping("toHome.action")
    private  String toAdminHome(HttpServletRequest request){
        return "/home";
    }
}
