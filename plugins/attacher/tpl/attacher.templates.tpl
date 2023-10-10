<!-- BEGIN: MAIN -->
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <div class="preview"></div>
            <div class="name">{%=file.name%} (<i class="size small">{PHP.L.files_processing}...</i>)</div>
            <div class="fileupload-progress fade" style="display:none">
                <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                <div class="progress-extended">&nbsp;</div>
            </div>
            <strong class="error text-danger"></strong>

            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn start" disabled>
                    <span>{PHP.L.att_start}</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn cancel">
                    <span>{PHP.L.Cancel}</span>
                </button>
            {% } %}
        </td>
    </tr>
    {% } %}
</script>

<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade" id="file_{%=file.id%}" data-id="{%=file.id%}" data-url="{%=file.url%}"
            data-thumbnail="{%=file.thumbnail%}" data-name="{%=file.name%}">
        <td>
            <div class="preview">
                {% if (file.thumbnailUrl) { %}
                     <a href="{%=file.url%}" title="{%=file.name%}"{% if (file.isImage == 0) { %} download="{%=file.name%}"{% } %}>
                     <img src="{%=file.thumbnailUrl%}" alt="{%=file.name%}" width="150">
                     </a>
                     {% if (file.isImage == 1) { %}
                     {PHP.R.attacher_editor_insert_img_buttons}
                     {% } else { %}
                     {PHP.R.attacher_editor_insert_file_button}
                     {% } %}
                {% } %}
            </div>
           <div class="name">
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } else { %}

                <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}">
                {%=file.shortname%} (<i class="size">{%=o.formatFileSize(file.size)%}</i>)
                </a>
            <br>
            <label>
                <input type="text" name="title" class="att-edit-title form-control" placeholder="{PHP.L.Title}" value="{%=file.title%}" data-id="{%=file.id%}" id="file_title_id-{%=file.id%}">
            </label>

            {% } %}
            </div>
            {% if (file.deleteUrl) { %}
            <span class="actions">
            <label class="styled-input-checkers">
            <input type="checkbox" name="delete" value="1" class="toggle d-block">
            <span>{PHP.L.att_check}</span>
            </label>
            </span>
            <details class="more-setting">
               <summary class="before-none"><span class="ui-icon ui-icon-gear"></span></summary>
               <div class="_details shade pos-abs">

            {% if (window.FormData) { %}
            <p>
            <input type="file" name="replacement" class="att-replace-file" data-id="{%=file.id%}" id="att-file{%=file.id%}">
            </p>
            {% } %}
            <button class="btn delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %} title="{PHP.L.Delete}" data-toggle="tooltip">{PHP.L.Delete}
           </button>

           {% } else { %}
               <button type="button" class="btn cancel">
                   <span>{PHP.L.Cancel}</span>
               </button>
{% } %}

            <button type="button" class="btn att-replace-button replace" data-id="{%=file.id%}" title="{PHP.L.att_replace}" data-toggle="tooltip" style="display:none"><span class="ui-icon ui-icon-transferthick-e-w"></span><span class="ui-button-icon-space"></span>{PHP.L.att_replace}</button>
            </div>
         </details>

        </td>
    </tr>
{% } %}
</script>
<script>function getAlt(id){return document.querySelector('tr[data-id="'+id+'"] input[type=text][data-id="'+id+'"]').value};</script>
{PHP.R.attacher_editor_insert_function}
<!-- END: MAIN -->
