<@override name="cssfile">
    <!-- page specific plugin styles -->
<link rel="stylesheet" href="${base}/webstatic/assets/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-datepicker3.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/ui.jqgrid.min.css"/>
</@override>
<@override name="right_breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="#">Home</a>
        </li>

        <li>
            <a href="#">Tables</a>
        </li>
        <li class="active">Simple &amp; Dynamic</li>
    </ul><!-- /.breadcrumb -->
</@override>
<@override name="right_content">
   <div class="row">
       <div class="col-xs-12">
           <div class="page-header">
               <h1>课程管理
               </h1>
           </div>

           <!-- PAGE CONTENT BEGINS -->
           <div class="row">
               <div class="col-xs-12">
                   <form class="form-inline" id="searchForm">
                       <div class="form-group">
                           <label for="exampleInputName2">用户名称</label>
                           <input type="text" name="userName" class="form-control" id="exampleInputName2">
                       </div>
                       <div class="form-group">
                           <label for="exampleInputEmail2">年龄</label>
                           <input type="text" name="userAge" class="form-control" id="exampleInputEmail2">
                       </div>
                       <a href="javascript:void(0);" title="查询" id="searchSubmit" class="btn  btn-sm btn-info"><i
                               class="ace-icon fa fa-search"></i>查询</a>
                   </form>
                   <div class="hr hr-18 dotted"></div>
                   <a href="#" title="新增" class="btn  btn-sm btn-primary "><i
                           class="ace-icon fa fa-plus"></i>新增</a>
                   <a href="#" title="删除" class="btn  btn-sm btn-danger "><i
                           class="ace-icon fa fa-trash"></i>删除</a>
                   <div class="hr hr-18 dotted"></div>
                   <div style="position: relative">
                       <table id="dynamic-table" class="table  table-bordered table-hover">
                           <thead>
                           <tr>
                               <th class="center">
                                   <label class="pos-rel">
                                       <input type="checkbox" class="ace"/>
                                       <span class="lbl"></span>
                                   </label>
                               </th>
                               <th>用户名称</th>
                               <th>年龄</th>
                               <th>描述</th>
                           </tr>
                           </thead>
                           <tbody>
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>
           <!-- PAGE CONTENT ENDS -->
       </div><!-- /.col -->
   </div><!-- /.row -->
</@override>
<@override name="jsfile">
<!-- page specific plugin scripts -->
<script src="${base}/webstatic/assets/js/jquery.dataTables.min.js"></script>
<script src="${base}/webstatic/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="${base}/webstatic/js/page.js"></script>
<script src="${base}/webstatic/assets/js/dataTables.buttons.min.js"></script>
<script src="${base}/webstatic/assets/js/buttons.flash.min.js"></script>
<script src="${base}/webstatic/assets/js/buttons.html5.min.js"></script>
<script src="${base}/webstatic/assets/js/buttons.print.min.js"></script>
<script src="${base}/webstatic/assets/js/buttons.colVis.min.js"></script>
<script src="${base}/webstatic/assets/js/dataTables.select.min.js"></script>
</@override>
<@override name="jstext">
    <!-- inline scripts related to this page -->
	<script type="text/javascript">
        jQuery(function ($) {
            //initiate dataTables plugin
            var mytable = $('#dynamic-table').pageTable({
                "checkBox": true,
                "sAjaxSource": "${base}/backHomeManage/getData2.action",
                "fnServerParams": function (aoData) {
                    var searchParams = $("#searchForm").serializeArray();
                    for (var i = 0; i < searchParams.length; i++) {
                        aoData.push(searchParams[i]);
                    }
                },
                "aoColumns":
                        [
                            {
                                "sClass": "center",
                                "sDefaultContent": "",
                                "render": function (data, type, row, meta) {
                                    return '<label class="pos-rel"><input type="checkbox" class="ace" value="' + row.userName + '"><span class="lbl"></span></label>';
                                }
                            },
                            {"sClass": "center", "mData": "userName", "sDefaultContent": ""},
                            {"sClass": "center", "mData": "userAge", "sDefaultContent": ""},
                            {"sClass": "center", "mData": "context", "sDefaultContent": ""}

                        ]
            });
            $("#searchSubmit").bind("click", function () {
                //mytable.fnDraw();
                mytable.ajax.reload();
            });


        })
    </script>

</@override>
<@extends name="/comm/homeFrame.ftl"/>