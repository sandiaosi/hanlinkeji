package com.hanlinkeji.edu.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanlinkeji.edu.comm.RequestUtils;
import com.hanlinkeji.edu.service.web.HomePageService;

/**
 * Web 前段首页控制层
 * 
 * @author Chenkai
 * 
 */
@Controller
@RequestMapping("homepage")
public class HomePageController {
	
    @Autowired
    private HomePageService homePageService;

    @RequestMapping("toHome.action")
    private  String toAdminHome(HttpServletRequest request){
        return "/home";
    }
    @RequestMapping("testPage.action")
    private  String testPage(HttpServletRequest request){
        Map<String, Object> paramter = RequestUtils.getRequestParamMap(request);
        paramter.put("pageSize","3");
        request.setAttribute("pageInfo",homePageService.testPage(paramter));
        return "/testPage";
    }

}
