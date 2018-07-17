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
            var myTable = $('#dynamic-table').DataTable({
                "bAutoWidth": false,
                "bProcessing": true,
                "bServerSide": true,
                "bStateSave": true,
                "bFilter": false, //是否启动过滤、搜索功能
                "bSort": false, //是否启动各个字段的排序功能
                "sDom": '<""r>t<"pageContainer"lip>',
                "aLengthMenu": [5, 10, 20], //更改显示记录数选项
                "iDisplayLength": 5,
                "sAjaxSource": "${base}/backHomeManage/getData2.action",
                "aoColumns": [
                    {
                        "bSortable": false,
                        "sClass": "center",
                        "sDefaultContent": "",
                        render: function (data, type, row, meta) {
                            var volText = '<label class="pos-rel"><input type="checkbox" class="ace" value="' + row.userName + '"><span class="lbl"></span></label>';
                            return volText;
                        }
                    },
                    {"bSortable": false, "sClass": "center", "mData": "userName", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "userAge", "sDefaultContent": ""},
                    {"bSortable": false, "sClass": "center", "mData": "userAge", "sDefaultContent": ""}
                ],

                //服务器端，数据回调处理
                "fnServerData": function (sSource, aDataSet, fnCallback) {
                    $.ajax({
                        "dataType": 'json',
                        "type": "POST",
                        "url": sSource,
                        "data": aDataSet,
                        "success": fnCallback
                    });
                },
                select: {
                    style: 'multi'
                },
                "oLanguage": { //国际化配置
                    "sProcessing": "正在获取数据，请稍后...",
                    "sLengthMenu": "每页 _MENU_ 条",
                    "sZeroRecords": "没有您要搜索的内容",
                    "sInfo": "，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "记录数为0",
                    "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "第一页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "最后一页"
                    }
                }
            });
            myTable.on('select', function (e, dt, type, index) {
                if (type === 'row') {
                    $(myTable.row(index).node()).find('input:checkbox').prop('checked', true);
                }
            });
            myTable.on('deselect', function (e, dt, type, index) {
                if (type === 'row') {
                    $(myTable.row(index).node()).find('input:checkbox').prop('checked', false);
                }
            });

            /////////////////////////////////
            //table checkboxes
            $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

            //select/deselect all rows according to table header checkbox
            $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
                var th_checked = this.checked;//checkbox inside "TH" table header

                $('#dynamic-table').find('tbody > tr').each(function () {
                    var row = this;
                    if (th_checked) myTable.row(row).select();
                    else myTable.row(row).deselect();
                });
            });

            //select/deselect a row when the checkbox is checked/unchecked
            $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {
                var row = $(this).closest('tr').get(0);
                if (this.checked) myTable.row(row).deselect();
                else myTable.row(row).select();
            });


            $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
                e.stopImmediatePropagation();
                e.stopPropagation();
                e.preventDefault();
            });


        })
    </script>

</@override>
<@extends name="/comm/homeFrame.ftl"/>