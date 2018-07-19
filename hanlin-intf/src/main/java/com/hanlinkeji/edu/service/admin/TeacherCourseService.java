/**
 * Copyright (C), 2002-2018, 北斗翰林
 * FileName: TeacherCourseService
 * Author:   zcxuchd
 * Date:     2018/7/14 23:31
 * Description: //模块目的、功能描述
 * History: //修改记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */

package com.hanlinkeji.edu.service.admin;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉; 〈教师课程管理〉
 *
 * @author zcxuchd
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public interface TeacherCourseService {
    /**
     * 功能描述: <br>
     * 〈获取左侧树〉
     * 
     * @param params
     * @return java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    List<Map<String, Object>> getTeacherCourseTree(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈添加目录信息〉
     * 
     * @param params
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    int insertClassifyInfo(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈更新目录信息〉
     * 
     * @param params
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    String updateClassifyInfo(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈删除目录信息〉
     * 
     * @param params
     * @return java.lang.String
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    String deleteClassifyInfo(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈根据条件分页获取课程列表〉
     * 
     * @param params
     * @return com.github.pagehelper.PageInfo<java.util.Map<java.lang.String,java.lang.Object>>
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    PageInfo<Map<String, Object>> getTeacherCoursePage(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈新增课程信息〉
     * 
     * @param params
     * @return void
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    void saveTeacherCourse(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈更新课程信息〉
     * 
     * @param params
     * @return void
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    void updateTeacherCourse(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈删除课程信息〉
     * 
     * @param params
     * @return void
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    void deleteTeacherCourse(Map<String, Object> params);

    /**
     * 功能描述: <br>
     * 〈更新课程状态〉
     * 
     * @param params
     * @return void
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    void modifyCourseStatus(Map<String, Object> params);
}