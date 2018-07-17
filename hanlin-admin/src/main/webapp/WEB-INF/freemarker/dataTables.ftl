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
            var myTable = $('#dynamic-table').pageTable({
                "checkBox":true,
                "sAjaxSource": "${base}/backHomeManage/getData2.action",
                "aoColumns": [
                    {
                        "bSortable": false,
                        "sClass": "center",
                        "sDefaultContent": "",
                        "render": function (data, type, row, meta) {
                            return '<label class="pos-rel"><input type="checkbox" class="ace" value="' + row.userName + '"><span class="lbl"></span></label>';
                        }
                    },
                    {"bSortable": false, "sClass": "center", "mData": "userName", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "userAge", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "userAge", "sDefaultContent": ""}
                ]
            });
        })
    </script>

</@override>
<@extends name="/comm/homeFrame.ftl"/>