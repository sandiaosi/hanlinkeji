package com.hanlinkeji.edu.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.DataTablesView;
import com.hanlinkeji.edu.comm.RequestUtils;
import com.hanlinkeji.edu.service.admin.AdminManageService;

/**
 * 
 * 〈后台课程管理控制层〉<br> 
 * 〈管理员后台课程管理控制〉
 *
 * @author 15040805
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
@Controller
@RequestMapping("adminManage")
public class AdminManageController {
	
    @Autowired
    private AdminManageService adminManageService;
    
    @RequestMapping("showCourse.action")
    private String showCourse(HttpServletRequest request) {
        return "/adminManage/showCourse";
    }
    
    @RequestMapping("queryCoursePage.action")
    @ResponseBody
    private DataTablesView queryCoursePage(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        PageInfo<Map<String, Object>> pageInfo = adminManageService.queryCoursePage(params);
        return new DataTablesView(MapUtils.getString(params, "sEcho", ""), pageInfo.getTotal(), pageInfo.getList());
    }    
	

}
