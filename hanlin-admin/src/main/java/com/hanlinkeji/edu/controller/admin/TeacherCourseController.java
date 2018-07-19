/**
 * Copyright (C), 2002-2018, 北斗翰林
 * FileName: TeacherCourseController
 * Author:   zcxuchd
 * Date:     2018/7/14 23:24
 * Description: //模块目的、功能描述
 * History: //修改记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */

package com.hanlinkeji.edu.controller.admin;

import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.DataTablesView;
import com.hanlinkeji.edu.comm.RequestUtils;
import com.hanlinkeji.edu.service.admin.TeacherCourseService;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉; 〈教师课程管理〉
 *
 * @author zcxuchd
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
@Controller
@RequestMapping("teacherCourse")
public class TeacherCourseController {

    @Autowired
    private TeacherCourseService teacherCourseService;

    /**
     * 功能描述: <br>
     * 〈跳转至教师课程里列表页〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("courseManage.action")
    public String toTeacherCourse(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        // 获取树形结构
        List<Map<String, Object>> classifyList = teacherCourseService.getTeacherCourseTree(params);
        request.setAttribute("classifyList", classifyList);
        return "/teachercourse/courseManage";
    }

    /**
     * 功能描述: <br>
     * 〈跳转至新增课程页面〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("toAddCourseInfo.action")
    public String toAddCourseInfo(HttpServletRequest request) {

        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        return "/teachercourse/addCourseInfo";
    }

    /**
     * 功能描述: <br>
     * 〈根据目录编码获取课程信息〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("getCoursePageInfo.action")
    @ResponseBody
    public DataTablesView getCoursePageInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        PageInfo pageInfo = teacherCourseService.getTeacherCoursePage(params);
        return new DataTablesView(MapUtils.getString(params, "sEcho", ""), pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 功能描述: <br>
     * 〈保存目录信息〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("saveClassifyInfo.action")
    @ResponseBody
    public String saveClassifyInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        int classifyId = teacherCourseService.insertClassifyInfo(params);
        return String.valueOf(classifyId);
    }

    /**
     * 功能描述: <br>
     * 〈修改目录信息〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("updateClassifyInfo.action")
    @ResponseBody
    public String updateClassifyInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        teacherCourseService.updateClassifyInfo(params);
        return "1";
    }

    /**
     * 功能描述: <br>
     * 〈删除目录〉
     *
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("deleteClassifyInfo.action")
    @ResponseBody
    public String deleteClassifyInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        return teacherCourseService.deleteClassifyInfo(params);
    }

    /**
     * 功能描述: <br>
     * 〈保存课程信息〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("insertTeacherCourseInfo.action")
    @ResponseBody
    public String insertTeacherCourseInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        teacherCourseService.saveTeacherCourse(params);
        return "1";
    }

    /**
     * 功能描述: <br>
     * 〈更新课程信息〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("updateTeacherCourseInfo.action")
    @ResponseBody
    public String updateTeacherCourseInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        teacherCourseService.updateTeacherCourse(params);
        return "1";
    }

    /**
     * 功能描述: <br>
     * 〈删除课程状态〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("deleteTeacherCourseInfo.action")
    @ResponseBody
    public String deleteTeacherCourseInfo(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        teacherCourseService.deleteTeacherCourse(params);
        return "1";
    }

    /**
     * 功能描述: <br>
     * 〈更新课程状态〉
     * 
     * @param request
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("modifyTeacherCourseStatus.action")
    @ResponseBody
    public String modifyTeacherCourseStatus(HttpServletRequest request) {
        Map<String, Object> params = RequestUtils.getRequestParamMap(request);
        teacherCourseService.modifyCourseStatus(params);
        return "1";
    }
}