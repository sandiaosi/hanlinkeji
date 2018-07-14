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

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.DataTablesView;
import com.hanlinkeji.edu.comm.RequestUtils;
import com.hanlinkeji.edu.service.admin.AdminService;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 *
 * 〈功能详细描述〉
 *
 * @author xuguojun
 */
@Controller
@RequestMapping("backHomeManage")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("toHome.action")
    private String toAdminHome(HttpServletRequest request) {
        return "/home";
    }

    @RequestMapping("jqgrid.action")
    private String testPage(HttpServletRequest request) {
        Map<String, Object> paramter = RequestUtils.getRequestParamMap(request);
        paramter.put("pageSize", "3");
        request.setAttribute("pageInfo", adminService.testPage(paramter));
        return "/jqgrid";
    }

    @RequestMapping("dataTables.action")
    private String dataTables(HttpServletRequest request) {
        return "/dataTables";
    }

    @RequestMapping("getData.action")
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> paramter = RequestUtils.getRequestParamMap(request);
        PageInfo<Map<String, Object>> pageInfo = adminService.testPage(paramter);
        try (PrintWriter out = response.getWriter()) {
            DataTablesView dataTableView = new DataTablesView(MapUtils.getString(paramter, "sEcho", ""),
                    pageInfo.getTotal(), pageInfo.getList());
            out.write(JSONObject.toJSONString(dataTableView));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("getData2.action")
    @ResponseBody
    private DataTablesView getData2(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> paramter = RequestUtils.getRequestParamMap(request);
        PageInfo<Map<String, Object>> pageInfo = adminService.testPage(paramter);
        return new DataTablesView(MapUtils.getString(paramter, "sEcho", ""), pageInfo.getTotal(), pageInfo.getList());
    }
}
