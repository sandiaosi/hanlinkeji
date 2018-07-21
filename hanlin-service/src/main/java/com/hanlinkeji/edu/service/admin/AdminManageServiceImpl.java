package com.hanlinkeji.edu.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.BaseMapper;

@Service
public class AdminManageServiceImpl implements AdminManageService{
	
	private static final String DB_NAMESPANCE = "adminManageDao.";
	
    @Autowired
    private BaseMapper baseMapper;

	@Override
	public PageInfo<Map<String, Object>> queryCoursePage(Map<String, Object> paramter) {
		return baseMapper.selectPage(DB_NAMESPANCE + "queryCoursePage",paramter);
	}

}
