<@override name="cssfile">
<link rel="stylesheet" href="${base}/webstatic/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${base}/webstatic/assets/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-datepicker3.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/ui.jqgrid.min.css"/>
</@override>
<@override name="right_breadcrumbs">
<div class="breadcrumbs ace-save-state" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="#">Home</a>
        </li>

        <li>
            <a href="#">UI &amp; Elements</a>
        </li>
        <li class="active">Treeview</li>
    </ul><!-- /.breadcrumb -->
</div>
</@override>
<@override name="right_content">
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Text Field </label>

                <div class="col-sm-9">
                    <input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <div class="row">
            <div class="col-sm-3">
                <div class="widget-box widget-color-blue2">
                    <div class="widget-header">
                        <h4 class="widget-title lighter smaller">课程目录</h4>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main padding-8">
                            <div id="teacherCourseTree" class="ztree"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer"
                           role="grid" aria-describedby="dynamic-table_info">
                        <thead>
                        <tr role="row">
                            <th class="center sorting_disabled" rowspan="1" colspan="1" aria-label="">
                                <label class="pos-rel">
                                    <input class="ace" type="checkbox">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>课程名称</th>
                            <th>课程类型</th>
                            <th>课程目录</th>
                            <th>是否收费</th>
                            <th>收费金额</th>
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
<!-- basic scripts -->
<@override name="jsfile">
<!-- page specific plugin scripts -->
<script type="text/javascript" src="${base}/webstatic/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>

<script type="text/javascript" src="${base}/webstatic/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/buttons.print.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="${base}/webstatic/assets/js/dataTables.select.min.js"></script>
</@override>
<@override name="jstext">
<script type="text/javascript">
    var zTreeNodes = new Array();
    zTreeNodes[0] = {classify_id: 1, parent_id: "", name: "全部", isParent: true, open: true};
    /*******树状图*******/
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            showTitle: true,
            selectedMulti: false,
            addHoverDom: _addHoverDom,
            removeHoverDom: _removeHoverDom
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "classify_id",
                pIdKey: "parent_id",
                rootPId: ""
            }
        },
        edit: {
            enable: true,
            drag: {
                inner: true
            },
            renameTitle: "修改",
            removeTitle: "删除",
            showRemoveBtn: _setShowRemoveBtn,
            showRenameBtn: _setShowRenameBtn
        },
        callback: {
            beforeClick: _zTreeBeforeClick,
            beforeRemove: _zTreeBeforeRemove,
            beforeRename: _zTreeBeforeRename
        }
    };

    $(document).ready(function () {
        <#if classifyList?? && ((classifyList?size)>0)>
            <#list classifyList as temp>
                zTreeNodes.push({
                    classify_id: "${temp.classify_id}",
                    parent_id: "${temp.parent_id}",
                    <#if temp.is_bottom==1>
                        isParent: false,
                    <#else>
                        isParent: true,
                    </#if>
                    name: "${temp.classify_name}"
                });
            </#list>
        </#if>
        $.fn.zTree.init($("#teacherCourseTree"), setting, zTreeNodes);
        $("#dynamic-table").dataTable();
        //var zTree = $.fn.zTree.getZTreeObj("teacherCourseTree");
        //zTree.selectNode(zTree.getNodeByParam("id", '11'));
    });

    // 添加新节点
    function _addHoverDom(treeId, treeNode) {
        if (treeNode.level == 2) {
            return;
        }
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='添加子节点' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_" + treeNode.tId);
        if (btn) {
            btn.unbind("click").bind("click", function () {
                var floorP = treeNode.level;
                var length = 0;
                if (treeNode.isParent) {
                    if (undefined != treeNode.children) {
                        length = treeNode.children.length;
                    }
                }
                // 是否末级节点0-否 1-是
                var is_bottom = 0;
                if (floorP == 1) {
                    is_bottom = 1;
                }
                var zTree = $.fn.zTree.getZTreeObj("teacherCourseTree");
                $.ajax({
                    url: "${base}/teacherCourse/saveClassifyInfo.action",
                    type: "POST",
                    data: {
                        parent_id: treeNode.classify_id,
                        classify_name: "新节点",
                        sort: length + 1,
                        grade: floorP + 1,
                        is_bottom: is_bottom,
                        status: '1'
                    },
                    success: function (data) {
                        var is_parent = false;
                        if (treeNode.level == 0) {
                            is_parent = true;
                        }
                        var newNode = {
                            classify_id: data,
                            name: "新节点",
                            parent_id: treeNode.classify_id,
                            isParent: is_parent
                        };
                        zTree.addNodes(treeNode, newNode);
                        zTree.editName(newNode);
                    },
                    error: function (data) {
                        alert("错误")
                    }
                });
                //var newnade = {classify_id: (100), name: "新节点"};
                //zTree.addNodes(treeNode, newnade);
            });
        }
    }

    // 隐藏新增节点
    function _removeHoverDom(treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
    }

    // 是否展示编辑按钮
    function _setShowRenameBtn(treeId, treeNode) {
        if (treeNode.level == 0) {
            return false;
        }
        return true;
    }
    // 是否展示删除按钮
    function _setShowRemoveBtn(treeId, treeNode) {
        if (treeNode.level == 0) {
            return false;
        }
        return true;
    }

    window.dataTableSettings = {

    }
    var myTable = $('#dynamic-table').DataTable({
        "bAutoWidth": false,
        "bProcessing": true,
        "bServerSide": true,
        "bStateSave": true,
        "bFilter": false, //是否启动过滤、搜索功能
        "bSort": false, //是否启动各个字段的排序功能
        "sDom": 't<"pageContainer"lip>',
        "aLengthMenu": [5, 10, 20], //更改显示记录数选项
        "iDisplayLength": 5,
        "sAjaxSource": "${base}/teacherCourse/getCoursePageInfo.action",
        "aoColumns": [
            {
                "bSortable": false,
                "sClass": "center",
                "sDefaultContent": "",
                render: function (data, type, row, meta) {
                    return meta.row + 1 +
                            meta.settings._iDisplayStart;
                }
            },
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""},
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""},
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""},
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""},
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""},
            {"bSortable": false, "sClass": "center", "mData": "course_title", "sDefaultContent": ""}
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
            "sLengthMenu": "每页 _MENU_ 条，",
            "sZeroRecords": "没有您要搜索的内容",
            "sInfo": "共 _TOTAL_ 条记录",
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

    // 点击事件
    function _zTreeBeforeClick(treeId, treeNode) {
        var treeObj = $.fn.zTree.getZTreeObj("teacherCourseTree");
        if (treeNode.isParent) {
            treeObj.expandNode(treeNode);
            return false;
        } else {
            // 获取课程信息
            return true;
        }
    }

    // 删除操作
    function _zTreeBeforeRemove(treeId, treeNode) {
        $.ajax({
            url: "${base}/teacherCourse/deleteClassifyInfo.action",
            type: "POST",
            data: {classify_id: treeNode.classify_id},
            success: function (data) {
                alert("删除成功")
            }
        });
    }

    // 修改操作
    function _zTreeBeforeRename(treeId, treeNode, newName) {
        $.ajax({
            url: "${base}/teacherCourse/deleteClassifyInfo.action",
            type: "POST",
            data: {classify_id: treeNode.classify_id},
            success: function (data) {
                alert("删除成功")
            }
        });
    }
</script>
</@override>
<@extends name="/comm/homeFrame.ftl"/>