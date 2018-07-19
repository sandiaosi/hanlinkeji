/**
 * Copyright (C), 2002-2018, 北斗翰林
 * FileName: TeacherCourseServiceImpl
 * Author:   zcxuchd
 * Date:     2018/7/14 23:39
 * Description: //模块目的、功能描述
 * History: //修改记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */

package com.hanlinkeji.edu.service.admin;

import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.BaseMapper;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉; 〈教师课程管理〉
 *
 * @author zcxuchd
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
@Service
public class TeacherCourseServiceImpl implements TeacherCourseService {

    @Autowired
    private BaseMapper baseMapper;

    @Override
    public List<Map<String, Object>> getTeacherCourseTree(Map<String, Object> params) {
        params.put("user_id", 123456);
        // 获取分类list
        List<Map<String, Object>> list = baseMapper.selectList("teacherCourseManage.selectCourseClassifyInfo", params);
        return list;
    }

    @Override
    public PageInfo<Map<String, Object>> getTeacherCoursePage(Map<String, Object> params) {
        // 根据classifyid获取课程信息
        PageInfo<Map<String, Object>> pageInfo = baseMapper.selectPage("teacherCourseManage.selectTeacherCoursePage",
                params);
        return pageInfo;
    }

    @Override
    public int insertClassifyInfo(Map<String, Object> params) {
        int key = baseMapper.insert4PrimaryKey("teacherCourseManage.insertClassifyInfo", params, "classify_id");
        return key;
    }

    @Override
    public String updateClassifyInfo(Map<String, Object> params) {
        baseMapper.update("teacherCourseManage.updateClassifyInfo", params);
        return "1";
    }

    @Override
    public String deleteClassifyInfo(Map<String, Object> params) {
        // 1-删除成功 0-不可删除-提示存在子集或
        String ret = "1";
        // 删除前校验是否有子目录
        Map<String, Object> map = baseMapper.selectMap("teacherCourseManage.queryChildenClassifyCount", params,
                "count");
        int count = MapUtils.getIntValue(map, "count", 0);
        // 查询当前目录是否关联课程
        Map<String, Object> map1 = baseMapper.selectMap("", params, "1");
        if (count > 0) {
            ret = "0";
        } else {
            baseMapper.delete("teacherCourseManage.deleteClassifyInfo", params);
            // 如果为最底层，需删除关联课程信息
            baseMapper.delete("teacherCourseManage.deleteClassifyCourseRela", params);
        }
        return ret;
    }

    @Override
    public void saveTeacherCourse(Map<String, Object> params) {
        // 添加课程信息，添加成功后params会包含course_id
        baseMapper.insert4PrimaryKey("teacherCourseManage.insertTeacherCourseInfo", params, "course_id");
        // 添加课程目录关系
        baseMapper.insert("teacherCourseManage.insertTeacherCourseRela", params);
        // 添加课程管理员目录关系
        baseMapper.insert("teacherCourseManage.insertAdminCourseRela", params);
    }

    @Override
    public void updateTeacherCourse(Map<String, Object> params) {
        // 更新课程信息
        // 更新课程目录关系
        // 更新课程管理员目录关系
    }

    @Override
    public void deleteTeacherCourse(Map<String, Object> params) {
        // 删除课程信息-置为无效
        baseMapper.delete("", params);
    }

    @Override
    public void modifyCourseStatus(Map<String, Object> params) {
        // 更新课程状态
        baseMapper.update("teacherCourseManage.updateCourseStatus", params);
    }
}