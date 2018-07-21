package com.hanlinkeji.edu.service.admin;

import java.util.Map;

import com.github.pagehelper.PageInfo;

public interface AdminManageService {

	// 查询课程基本信息
	PageInfo<Map<String,Object>>  queryCoursePage(Map<String,Object> paramter);
}
