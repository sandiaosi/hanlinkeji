/**
 * Copyright (C), 2018-2018, 北斗翰林
 * FileName: BaseMapper
 * Author:   xuguojun
 * Date:     2018/7/10 下午2:46
 * Description:
 * History:
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.hanlinkeji.edu.comm;

import com.github.pagehelper.ISelect;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections4.MapUtils;
import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;
import java.util.Map;

/**
 * 
 * 〈功能详细描述〉
 *
 * @author xuguojun
 */
public class BaseMapper {

    /**
     * 注入以后就可以直接使用sqlsession
     */
    private SqlSessionTemplate sqlsession;

    public void setSqlsession(SqlSessionTemplate sqlsession) {
        this.sqlsession = sqlsession;
    }

    public <T> T selectOne(String sqlStatement) {
        return sqlsession.selectOne(sqlStatement);
    }

    public <T> T selectOne(String sqlStatement, Object parameter) {
        return sqlsession.selectOne(sqlStatement, parameter);
    }

    public <K, V> Map<K, V> selectMap(String sqlStatement, String mapKey) {
        return sqlsession.selectMap(sqlStatement, mapKey);
    }

    public <K, V> Map<K, V> selectMap(String sqlStatement, Object parameter, String mapKey) {
        return sqlsession.selectMap(sqlStatement, parameter, mapKey);
    }

    public <K, V> Map<K, V> selectMap(String sqlStatement, Object parameter, String mapKey, RowBounds rowBounds) {
        return sqlsession.selectMap(sqlStatement, parameter, mapKey, rowBounds);
    }

    public <T> Cursor<T> selectCursor(String sqlStatement) {
        return sqlsession.selectCursor(sqlStatement);
    }

    public <T> Cursor<T> selectCursor(String sqlStatement, Object parameter) {
        return sqlsession.selectCursor(sqlStatement, parameter);
    }

    public <T> Cursor<T> selectCursor(String sqlStatement, Object parameter, RowBounds rowBounds) {
        return sqlsession.selectCursor(sqlStatement, parameter, rowBounds);
    }

    public <E> List<E> selectList(String sqlStatement) {
        return sqlsession.selectList(sqlStatement);
    }

    public <E> List<E> selectList(String sqlStatement, Object parameter) {
        return sqlsession.selectList(sqlStatement, parameter);
    }

    public <E> List<E> selectList(String sqlStatement, Object parameter, RowBounds rowBounds) {
        return sqlsession.selectList(sqlStatement, parameter, rowBounds);
    }

    public void select(String sqlStatement, ResultHandler handler) {
        sqlsession.select(sqlStatement, handler);
    }

    public void select(String sqlStatement, Object parameter, ResultHandler handler) {
        sqlsession.select(sqlStatement, parameter, handler);
    }

    public void select(String sqlStatement, Object parameter, RowBounds rowBounds, ResultHandler handler) {
        sqlsession.select(sqlStatement, parameter, rowBounds, handler);
    }

    public <T> PageInfo<T> selectPage(final String sqlStatement, final Object parameter, int pageNum, int pageSize) {
        // 也可以直接返回PageInfo，注意doSelectPageInfo方法和doSelectPage
        return PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(new ISelect() {
            @Override
            public void doSelect() {
                selectList(sqlStatement, parameter);
            }
        });
    }

    public <T> PageInfo<T> selectPage(final String sqlStatement, final Map<String, Object> parameter) {
        // 也可以直接返回PageInfo，注意doSelectPageInfo方法和doSelectPage
        int pageNum = MapUtils.getIntValue(parameter, "pageNum", 1);
        int pageSize = MapUtils.getIntValue(parameter, "pageSize", 10);
        return PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(new ISelect() {
            @Override
            public void doSelect() {
                selectList(sqlStatement, parameter);
            }
        });
    }

    public int insert(String sqlStatement) {
        return sqlsession.insert(sqlStatement);
    }

    public int insert(String sqlStatement, Object parameter) {
        return sqlsession.insert(sqlStatement, parameter);
    }

    public int insert4PrimaryKey(String sqlStatement, Object parameter, String primaryKeyId) {
        this.insert(sqlStatement,parameter);
        return MapUtils.getInteger((Map<? super String, ?>) parameter, primaryKeyId);
    }

    public int update(String sqlStatement) {
        return sqlsession.update(sqlStatement);
    }

    public int update(String sqlStatement, Object parameter) {
        return sqlsession.update(sqlStatement, parameter);
    }

    public int delete(String sqlStatement) {
        return sqlsession.delete(sqlStatement);
    }

    public int delete(String sqlStatement, Object parameter) {
        return sqlsession.delete(sqlStatement, parameter);
    }

}
