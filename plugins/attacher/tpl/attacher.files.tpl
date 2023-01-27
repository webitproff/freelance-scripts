<!-- BEGIN: MAIN -->
<!DOCTYPE HTML>
<html lang="en">

<head>
    <!-- Force latest IE rendering engine or ChromeFrame if installed -->
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <meta charset="utf-8">
    <title>{PHP.L.att_attachments}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jQuery UI styles -->
    <link rel="stylesheet" href="{PHP.cfg.plugins_dir}/attacher/lib/Jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="{PHP.cfg.plugins_dir}/attacher/css/fileupload.css?{PHP.cot_plugins_enabled.attacher.version}">
    <style>small[data-class="insert--buttons"]{display:none}</style>
    <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>

<body>

<div class="fileupload-wrapper">
    <!-- The file upload form used as target for the file upload widget -->
    <form class="fileupload" id="fileupload_{ATTACHER_AREA}_{ATTACHER_ITEM}_{ATTACHER_FIELD}" action="{ATTACHER_ACTION}" method="POST" enctype="multipart/form-data" data-url="{ATTACHER_ACTION}">

        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="fileupload-buttonbar">
            <div class="fileupload-buttons">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <label class="btn bg-success fileinput-button">{PHP.L.att_add}
                    <input type="file" name="files[]" <!-- IF {ATTACHER_LIMIT} > 0 -->multiple<!-- ENDIF --> hidden>
                </label>
                <!-- IF !{PHP.cfg.plugin.attacher.autoupload} -->
                <button type="button" class="btn start">{PHP.L.att_start_upload}</button>
                <button type="reset" class="btn cancel">{PHP.L.att_cancel}</button>
                <!-- ENDIF -->
                <button type="button" class="btn delete toggle">{PHP.L.Delete}</button>
                <label class="styled-input-checkers"><input type="checkbox" class="toggle"><span>{PHP.L.att_check_all}</span></label>
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <div id="dropzone" class="dropzone fade well">

                <span class="glyphicon glyphicon-import"></span> {PHP.L.att_drag_here}
                <!-- The global progress state -->
                <div class="fileupload-progress fade" style="display:none">
                    <!-- The global progress bar -->
                    <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    <!-- The extended global progress state -->
                    <div class="progress-extended">&nbsp;</div>

                </div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table id="attTable" role="presentation" class="attTable">
            <tbody class="files"></tbody>
        </table>
    </form>
</div>

    {ATTACHER_TEMPLATES}

    <script src="js/jquery.min.js"></script>
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/Jquery-ui/jquery-ui.min.js"></script>
    <!-- The Templates plugin is included to render the upload/download listings -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/JavaScript-Templates/tmpl.min.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/JavaScript-Load-Image/js/load-image.all.min.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The Canvas to Blob plugin is included for image resizing functionality -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/JavaScript-Canvas-to-Blob/canvas-to-blob.min.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.iframe-transport.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The basic File Upload plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The File Upload processing plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-process.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The File Upload image preview & resize plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-image.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The File Upload audio preview plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-audio.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- IF 0 == 1 -->
    <!-- The File Upload video preview plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-video.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- ENDIF -->
    <!-- The File Upload validation plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-validate.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The File Upload user interface plugin -->
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-ui.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/jquery.fileupload-jquery-ui.js?{PHP.cot_plugins_enabled.attacher.version}"></script>

    <script>
    if (attConfig === undefined) {
        var attConfig = {
            exts: $.map('{ATTACHER_EXTS}'.split(','), $.trim),
            accept: '{ATTACHER_ACCEPT}',
            maxsize: {ATTACHER_MAXSIZE},
            autoUpload: {PHP.cfg.plugin.attacher.autoupload},
            sequential: {PHP.cfg.plugin.attacher.sequential},
            'x':    '{ATTACHER_X}'
        };
    }
    attConfig.{ATTACHER_ID} = {
        area: '{ATTACHER_AREA}',
        item: {ATTACHER_ITEM},
        field: '{ATTACHER_FIELD}',
        limit: {ATTACHER_LIMIT},
        chunk: {ATTACHER_CHUNK},
        param: '{ATTACHER_PARAM}'
    };
    </script>

    <!-- Table Drag&Drop plugin for reordering -->
    <script src="js/jquery.tablednd.min.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The main application script -->
    <script src="{PHP.cfg.plugins_dir}/attacher/js/attacher.js?{PHP.cot_plugins_enabled.attacher.version}"></script>
    <!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
    <!--[if (gte IE 8)&(lt IE 10)]>
<script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->

</body>

</html>
<!-- END: MAIN -->
