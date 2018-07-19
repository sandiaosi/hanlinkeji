(function ($) {
    $.fn.pageTable = function (options) {
        var defaults = {
            "bAutoWidth": false,
            "bProcessing": true,
            "bServerSide": true,
            "sDom": 'rt<"row pageContainer"lip>',
            "aLengthMenu": [10, 20,40], //更改显示记录数选项
            "iDisplayLength":10,
            "aaSorting": [],
            "bSort": false,
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
            },
            "select": {
                "style": 'multi'
            }
        };
        var opts = $.extend({}, defaults, options);
        var myTable = this.DataTable(opts);
        if (opts["checkBox"]) {
            var id = this.attr("id");
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
            //table checkboxes
            $('#' + id + ' > thead > tr > th input[type=checkbox], #' + id + '_wrapper input[type=checkbox]').eq(0).on('click', function () {
                var th_checked = this.checked;//checkbox inside "TH" table header
                $('#' + id).find('tbody > tr').each(function () {
                    var row = this;
                    if (th_checked) myTable.row(row).select();
                    else myTable.row(row).deselect();
                });
            });
            //select/deselect a row when the checkbox is checked/unchecked
            this.on('click', 'td input[type=checkbox]', function () {
                var row = $(this).closest('tr').get(0);
                if (this.checked) myTable.row(row).deselect();
                else myTable.row(row).select();
            });
            $(document).on('click', '#' + id + ' .dropdown-toggle', function (e) {
                e.stopImmediatePropagation();
                e.stopPropagation();
                e.preventDefault();
            });
        }
        return myTable;
    };
})(jQuery);
