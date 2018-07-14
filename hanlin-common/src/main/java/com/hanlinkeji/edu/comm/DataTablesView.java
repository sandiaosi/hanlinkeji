/**
 * Copyright (C), 2018-2018, 北斗翰林
 * FileName: DataTablesUtil
 * Author:   xuguojun
 * Date:     2018/7/14 上午7:56
 * Description: //描述
 * History: //历史记录
 * <author>             <time>            <version>             <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.hanlinkeji.edu.comm;

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

/**
 *
 *〈功能详细描述〉
 *
 * @author xuguojun
 */
public class DataTablesView {
    private String sEcho;
    private long iTotalRecords;
    private long iTotalDisplayRecords;
    private List aaData=new ArrayList();

    public DataTablesView(){

    }
    public DataTablesView(String sEcho, long iTotalRecords, List aaData) {
        this.sEcho = sEcho;
        this.iTotalRecords = iTotalRecords;
        this.aaData = aaData;
        this.iTotalDisplayRecords=iTotalRecords;
    }

    public String getsEcho() {

        return sEcho;
    }

    public void setsEcho(String sEcho) {
        this.sEcho = sEcho;
    }

    public long getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(long iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public long getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(long iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public List getAaData() {
        return aaData;
    }

    public void setAaData(List aaData) {
        this.aaData = aaData;
    }
}
