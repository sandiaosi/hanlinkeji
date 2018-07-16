function dataTable(tableId){
    return $('#dynamic-table').DataTable({
        "bAutoWidth": false,
        "bProcessing": true,
        "bServerSide": true,
        "bStateSave" : true,
        "bFilter" : false, //是否启动过滤、搜索功能
        "bSort" : false, //是否启动各个字段的排序功能
        "sDom":'t<"pageContainer"lip>',
        "aLengthMenu": [10, 15, 20,40], //更改显示记录数选项
        "iDisplayLength": 10,
        "sAjaxSource": "${base}/backHomeManage/getData2.action",
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
            "sProcessing" : "正在获取数据，请稍后...",
            "sLengthMenu" : "每页 _MENU_ 条，",
            "sZeroRecords" : "没有您要搜索的内容",
            "sInfo" : "共 _TOTAL_ 条记录",
            "sInfoEmpty" : "记录数为0",
            "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
            "sInfoPostFix" : "",
            "sSearch" : "搜索",
            "sUrl" : "",
            "oPaginate": {
                "sFirst" : "第一页",
                "sPrevious" : "上一页",
                "sNext" : "下一页",
                "sLast" : "最后一页"
            }
        }
    });
}