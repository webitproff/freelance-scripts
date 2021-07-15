<!-- BEGIN: MAIN -->
<table class="table cells">
    <!-- BEGIN: ATTACHER_ROW -->
    <tr>
        <td>#{ATTACHER_ROW_NUM}</td>
        <!-- IF {ATTACHER_ROW_IMG} -->
        <td>
            <a href="{ATTACHER_ROW_BIGTHUMB_URL}" title="{ATTACHER_ROW_TITLE}"><img src="{ATTACHER_ROW_THUMB_URL}" alt="{ATTACHER_ROW_SHORTNAME}"></a>
        </td>
        <td>
            <p>{ATTACHER_ROW_TITLE}</p>
            <p>{ATTACHER_ROW_SHORTNAME}</p>
        </td>
        <!-- ELSE -->
        <td>
            <img src="{ATTACHER_ROW_EXT|att_icon($this,48)}" alt="{ATTACHER_ROW_EXT}" width="48" height="48">
        </td>
        <td>
            <p><a href="{ATTACHER_ROW_URL}" title="{ATTACHER_ROW_TITLE}">{ATTACHER_ROW_FILENAME}</a></p>
            <p class="small">{ATTACHER_ROW_SIZE} ({PHP.L.att_downloads}: {ATTACHER_ROW_COUNT})</p>
        </td>
        <!-- ENDIF -->
    </tr>
    <!-- END: ATTACHER_ROW -->
</table>
<!-- END: MAIN -->
