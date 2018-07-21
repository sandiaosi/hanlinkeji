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
           <!-- PAGE CONTENT BEGINS -->
           <div class="row">
               <div class="col-xs-12">
                   <div class="clearfix">
                       <div class="pull-right tableTools-container"></div>
                   </div>
                   <div class="table-header">
                       Results for "Latest Registered Domains"
                   </div>

                   <!-- div.table-responsive -->

	



                   <!-- div.dataTables_borderWrap -->
                   <div style="position:relative">
                       <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                           <thead>
                           <tr>
                               <th class="center">
                                   <label class="pos-rel">
                                       <input type="checkbox" class="ace"/>
                                       <span class="lbl"></span>
                                   </label>
                               </th>
                               <th>课程编码</th>
                               <th>所属科目</th>
                               <th>课程类型</th>
                               <th>课程标题</th>
                               <th>课程状态</th>
                               <th>讲师</th>
                               <th>课程简介</th>
                               <th>课程大纲</th>
                               <th>课程封面路径</th>
                               <th>是否收费</th>
                               <th>收费标准</th>
                               <th>是否精品课程</th>
                               <th>备注</th>
                               <th>创建时间</th>
                               <th>更新时间</th>
                               <th>操作</th>
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
            var myTable = $('#dynamic-table').pageTable({
                "checkBox":true,
                "sAjaxSource": "${base}/adminManage/queryCoursePage.action",
                "aoColumns": [
                    {
                        "bSortable": false,
                        "sClass": "center",
                        "sDefaultContent": "",
                        "render": function (data, type, row, meta) {
                            return '<label class="pos-rel"><input type="checkbox" class="ace" value="' + row.courseId + '"><span class="lbl"></span></label>';
                        }
                    },
                    
                    {"bSortable": false, "sClass": "center", "mData": "courseId", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "subject", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "courseType", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "courseTitle", "sDefaultContent": ""},
                    {
                        "bSortable": false,
                        "sClass": "center",
                        "sDefaultContent": "",
                        "render": function (data, type, row, meta) {
                        	var statusDesc = '';
                        	<#-- 课程状态：10保存、11发布中、12审核通过、13审核驳回、14下线、15已删除-->
                        	if (row.status == '10'){
                        		statusDesc = '保存';
                        	}else if(row.status == '11'){
                        		statusDesc = '发布中';
                        	}else if(row.status == '12'){
                        	    statusDesc = '审核通过';
                        	}else if(row.status == '13'){
                        	    statusDesc = '审核驳回';
                        	}else if(row.status == '14'){
                        	    statusDesc = '下线';
                        	}else if(row.status == '15'){
                        	    statusDesc = '已删除';
                        	}else{
                        		statusDesc = '其他';
                        	}
                        	return statusDesc;
                        }
                    },                    
                    
                    
                    {"bSortable": false, "sClass": "center", "mData": "userId", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "courseDesc", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "outlineUrl", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "thumbnailUrl", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "isPay", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "feeScale", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "isPerfect", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "notes", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "createTime", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "updateTime", "sDefaultContent": ""},
                    {
                        "bSortable": false,
                        "sClass": "center",
                        "sDefaultContent": "",
                        "render": function (data, type, row, meta) {
                            return '<div class="hidden-sm hidden-xs btn-group"><button class="btn btn-xs btn-success"><i class="ace-icon fa fa-check bigger-120"></i></button><button class="btn btn-xs btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></button><button class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></button><button class="btn btn-xs btn-warning"><i class="ace-icon fa fa-flag bigger-120"></i></button></div>';
                        }
                    }                    
                ]
            });
        })
    </script>

<#-- 

课程编码		course_id		
所属科目		subject			
课程类型		course_type		
课程标题		course_title	
课程状态		status			
讲师id			user_id			
课程简介		course_desc		
课程大纲		outline_url		
课程封面路径	thumbnail_url	
是否收费		is_pay			
收费标准		fee_scale		
是否精品课程	is_perfect		
备注			notes			
创建时间		create_time		
更新时间		update_time	

			course_id      as    "courseId",
			subject        as    "subject",
			course_type    as    "courseType",
			course_title   as    "courseTitle",
			status         as    "status",
			user_id        as    "userId",
			course_desc    as    "courseDesc",
			outline_url    as    "outlineUrl",
			thumbnail_url  as    "thumbnailUrl",
			is_pay         as    "isPay",
			fee_scale      as    "feeScale",
			is_perfect     as    "isPerfect",
			notes          as    "notes",
			create_time    as    "createTime",
			update_time    as    "updateTime"
-->

</@override>
<@extends name="/comm/homeFrame.ftl"/>