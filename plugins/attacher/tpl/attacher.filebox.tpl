<!-- BEGIN: MAIN -->
<noscript></noscript>

<!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

<div class="fileupload-wrapper">
    <!-- The file upload form used as target for the file upload widget -->
    <div class="col-xs-12 fileupload" id="fileupload_{ATTACHER_AREA}_{ATTACHER_ITEM}_{ATTACHER_FIELD}" data-url="{ATTACHER_ACTION}">
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="fileupload-buttonbar">
            <div class="fileupload-buttons">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <label class="btn fileinput-button">{PHP.L.att_add}
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
        <table id="attTable_" role="presentation" class="attTable"><tbody class="files"></tbody></table>
    </div>
</div>

<!-- Cotonti config -->
<script type="text/javascript">
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

<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="{PHP.cfg.plugins_dir}/attacher/lib/upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<!-- END: MAIN -->
