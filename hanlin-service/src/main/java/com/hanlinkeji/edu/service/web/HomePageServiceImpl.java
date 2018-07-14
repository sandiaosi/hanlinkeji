package com.hanlinkeji.edu.service.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.hanlinkeji.edu.comm.BaseMapper;

/**
 * 前天首页
 * 
 * @author chenkai
 *
 */
@Service
public class HomePageServiceImpl implements HomePageService{
    @Autowired
    private BaseMapper baseMapper;

    @Override
    public PageInfo<Map<String, Object>> testPage(Map<String, Object> paramter) {
        return baseMapper.selectPage("adminDao.selectUserByMap",paramter);
    }
}
