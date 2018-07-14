/**
 * Copyright (C), 2018-2018, 北斗翰林
 * FileName: adminService
 * Author:   xuguojun
 * Date:     2018/7/10 下午9:33
 * Description: //描述
 * History: //历史记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.hanlinkeji.edu.service.web;

import com.github.pagehelper.PageInfo;

import java.util.Map;

/**
 *
 *〈功能详细描述〉
 *
 * @author chenkai
 */
public interface HomePageService {
    PageInfo<Map<String,Object>>  testPage(Map<String,Object> paramter);
}
