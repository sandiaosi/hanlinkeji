<@override name="cssfile">
<link rel="stylesheet" href="${base}/webstatic/assets/css/jquery-ui.custom.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/chosen.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-datepicker3.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/daterangepicker.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="${base}/webstatic/assets/css/bootstrap-colorpicker.min.css"/>
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
<div class="page-header">
    <h1>新增课程</h1>
</div><!-- /.page-header -->
<div class="row">
<div class="col-xs-12">
    <!-- PAGE CONTENT BEGINS -->
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所属科目</label>
            <div class="col-sm-3">
                <select class="form-control col-xs-6 col-sm-2" id="form-field-select-1">
                    <option value="" selected="selected">请选择</option>
                    <option value="00">语文</option>
                    <option value="01">数学</option>
                    <option value="02">英语</option>
                    <option value="03">物理</option>
                    <option value="04">化学</option>
                    <option value="05">生物</option>
                    <option value="99">其它</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">适用范围</label>
            <div class="checkbox">
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">初一</span>
                </label>
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">初二</span>
                </label>
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">初三</span>
                </label>
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">高一</span>
                </label>
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">高二</span>
                </label>
                <label>
                    <input name="form-field-checkbox" class="ace" type="checkbox">
                    <span class="lbl">高三</span>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否收费</label>
            <div class="radio">
                <label>
                    <input name="form-field-radio" class="ace" type="radio">
                    <span class="lbl">是</span>
                </label>
                <label>
                    <input name="form-field-radio" class="ace" type="radio">
                    <span class="lbl">否</span>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">收费标准</label>
            <div class="col-sm-9">
                <input type="text" id="form-field-1" placeholder="收费标准" class="col-xs-10 col-sm-5"/><label>元</label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">课程名称</label>
            <div class="col-sm-9">
                <input type="text" id="form-field-1" placeholder="课程名称" class="col-xs-10 col-sm-5"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">课程简介</label>
            <div class="col-sm-9">
            <textarea class="form-control limited" id="form-field-9" maxlength="100"
                      style="width: 313px; height: 42px;"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">课程封面</label>
            <div class="col-sm-3">
                <label class="ace-file-input ace-file-multiple"><input multiple="" id="id-input-file-3"
                                                                       type="file">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">课程大纲</label>
            <div class="col-sm-9">
                <div class="wysiwyg-editor" id="editor1"></div>
            </div>
        </div>
        <div class="clearfix form-actions">
            <div class="col-md-offset-3 col-md-9">
                <button class="btn btn-info" type="button">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                    提交
                </button>
                &nbsp; &nbsp; &nbsp;
                <button class="btn" type="reset">
                    <i class="ace-icon fa fa-undo bigger-110"></i>
                    取消
                </button>
            </div>
        </div>
    </form>
</@override>
    <!-- basic scripts -->
<@override name="jsfile">
    <!-- page specific plugin scripts -->
    <script type="text/javascript" src="${base}/webstatic/assets/js/spinbox.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/autosize.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/jquery.inputlimiter.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/jquery.maskedinput.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/bootstrap-tag.min.js"></script>

    <script type="text/javascript" src="${base}/webstatic/assets/js/markdown.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/bootstrap-markdown.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/jquery.hotkeys.index.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/bootstrap-wysiwyg.min.js"></script>
    <script type="text/javascript" src="${base}/webstatic/assets/js/bootbox.js"></script>
</@override>
<@override name="jstext">
    <script type="text/javascript">
        jQuery(function ($) {
            $('[data-rel=tooltip]').tooltip({container: 'body'});
            $('[data-rel=popover]').popover({container: 'body'});

            autosize($('textarea[class*=autosize]'));

            $('textarea.limited').inputlimiter({
                remText: '剩余 %n 个字符，',
                limitText: '最大允许 : %n.'
            });

            $('#id-input-file-3').ace_file_input({
                style: 'well',
                btn_choose: '请上传图片',
                btn_change: null,
                no_icon: 'ace-icon fa fa-cloud-upload',
                droppable: true,
                thumbnail: 'large'//large | fit
                //,icon_remove:null//set null, to hide remove/reset button
                /**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
                /**,before_remove : function() {
						return true;
					}*/
                ,
                preview_error: function (filename, error_code) {
                    //name of the file that failed
                    //error_code values
                    //1 = 'FILE_LOAD_FAILED',
                    //2 = 'IMAGE_LOAD_FAILED',
                    //3 = 'THUMBNAIL_FAILED'
                    //alert(error_code);
                }

            }).on('change', function () {
                //console.log($(this).data('ace_input_files'));
                //console.log($(this).data('ace_input_method'));
            });


            $('textarea[data-provide="markdown"]').each(function () {
                var $this = $(this);
                if ($this.data('markdown')) {
                    $this.data('markdown').showEditor();
                } else {
                    $this.markdown()
                }
                $this.parent().find('.btn').addClass('btn-white');
            })

            function showErrorAlert(reason, detail) {
                var msg = '';
                if (reason === 'unsupported-file-type') {
                    msg = "Unsupported format " + detail;
                }
                else {
                    //console.log("error uploading file", reason, detail);
                }
                $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                        '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
            }

            $('#editor1').ace_wysiwyg({
                toolbar: [
                    'font',
                    null,
                    'fontSize',
                    null,
                    {name: 'bold', className: 'btn-info'},
                    {name: 'italic', className: 'btn-info'},
                    {name: 'strikethrough', className: 'btn-info'},
                    {name: 'underline', className: 'btn-info'},
                    null,
                    {name: 'insertunorderedlist', className: 'btn-success'},
                    {name: 'insertorderedlist', className: 'btn-success'},
                    {name: 'outdent', className: 'btn-purple'},
                    {name: 'indent', className: 'btn-purple'},
                    null,
                    {name: 'justifyleft', className: 'btn-primary'},
                    {name: 'justifycenter', className: 'btn-primary'},
                    {name: 'justifyright', className: 'btn-primary'},
                    {name: 'justifyfull', className: 'btn-inverse'},
                    null,
                    {name: 'createLink', className: 'btn-pink'},
                    {name: 'unlink', className: 'btn-pink'},
                    null,
                    {name: 'insertImage', className: 'btn-success'},
                    null,
                    'foreColor',
                    null,
                    {name: 'undo', className: 'btn-grey'},
                    {name: 'redo', className: 'btn-grey'}
                ],
                'wysiwyg': {
                    fileUploadError: showErrorAlert
                }
            }).prev().addClass('wysiwyg-style2');
        });
    </script>
</@override>
<@extends name="/comm/homeFrame.ftl"/>