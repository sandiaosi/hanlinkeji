
当前页码：${pageInfo.pageNum} <br/>
每页记录数：${pageInfo.pageSize} <br/>
总页数：${pageInfo.pages}<br/>
总记录数：${pageInfo.total}<br/>
<#list pageInfo.list as user>
    ${user.id}==========${user.userName}==============${user.userAge}==========${user.context}<br/>
</#list>