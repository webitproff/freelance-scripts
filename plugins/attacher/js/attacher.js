/*jslint nomen: true, unparam: true, regexp: true */
/*global $, window, document, console */

var dndOffset = 0;
$(function () {
    'use strict';

    var x = $('input[name="x"][type="hidden"]').first().val();

    // Initialize the jQuery File Upload widget:
    $('.fileupload').each(function () {
        var fileInput = $(this);

        var uplId = $(this).attr('id');
        uplId = uplId.replace('fileupload_', '');

        $(this).fileupload({
            dropZone: $(this),
            formData: {
                param: attConfig[uplId].param,
                x: x
            },
            autoUpload: attConfig.autoUpload,
            maxChunkSize: attConfig[uplId]['chunk'],
            sequentialUploads: attConfig.sequential
        });

        // Enable iframe cross-domain access via redirect option:
        $(this).fileupload(
            'option',
            'redirect',
            window.location.href.replace(
                /\/[^\/]*$/,
                'plugins/attacher/lib/upload/cors/result.html?%s'
            )
        );

        // Load existing files:
        fileInput.addClass('fileupload-processing');
        $.ajax({
            // Uncomment the following to send cross-domain cookies:
            //xhrFields: {withCredentials: true},
            url: fileInput.fileupload('option', 'url'),
            dataType: 'json',
            context: $(fileInput)[0]
        }).always(function () {
                $(this).removeClass('fileupload-processing');
            }).done(function (result) {
                $(this).fileupload('option', 'done')
                    .call(this, $.Event('done'), {result: result});

                // Drag&Drop for reordering
                setTimeout(function() {
                    fileInput.find(".attTable").tableDnD({
                        onDragStart: function(table, row){
                            var offset = $(row).offset();
                            dndOffset = offset.top;
                        },
                        onDrop: function(table, row) {

                            var offset = $(row).offset();
                            if(Math.abs(dndOffset - offset.top) < 20 ) return;

                            dndOffset = 0;

                            var orders = [];
                            var i = 0;
                            var rows = table.tBodies[0].rows;
                            $(rows).each(function() {
                                var id = $(this).attr('data-id');
                                orders[i] = id;
                                i++;
                            });

                            var x = $('input[name="x"][type="hidden"]').first().val();
                            var updateUrl = 'index.php?r=attacher&a=reorder&area='+attConfig[uplId].area+'&item='+
                                attConfig[uplId].item+'&field='+attConfig[uplId].field+'&x='+x;

                            var procDiv = $('<div>', { 'id': "task-processing" });
                            $(row).before( procDiv );

                            $.post(updateUrl, {orders: orders}, function(data) {
                                procDiv.remove();
                            });
                        }
                    });
                }, 400);

            });
    });


    if (window.FormData) {
        // Replacement of existing images
        // Supported on moder browsers only
        $('.fileupload').on('change', 'input.att-replace-file', function() {
            var id   = $(this).attr('data-id');
            var filename = $(this).val();
            var pass = true;
            if (attConfig.exts.length > 0) {
                // Examine file extension
                var m = /\.(\w+)$/.exec(filename);
                if (m) {
                    var ext = m[1];
                    pass = attConfig.exts.indexOf(ext.toLowerCase()) != -1;
                } else {
                    pass = false;
                }
            }
            if (pass) {
                $('button.att-replace-button[data-id="'+id+'"]').show();
            } else {
                $('button.att-replace-button[data-id="'+id+'"]').hide();
            }
        });

        $('.fileupload').on('click', 'button.att-replace-button', function() {
            var id   = $(this).attr('data-id');
            var input = document.getElementById("att-file"+id);
            var formdata = new FormData();
            if (input.files.length != 1) {
                return false;
            }
            var file = input.files[0];
            // TODO check file.type against attConfig.accept
            formdata.append('file', file);

            var x = $('input[name="x"][type="hidden"]').first().val();
            var updateUrl = 'index.php?r=attacher&a=replace&id='+id+'&x='+x;

            var procDiv = $('<div>', { 'id': "task-processing" });
            $(this).before( procDiv );

            $.ajax({
                url: updateUrl,
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (res) {
                    $(procDiv).remove();
                    // Reload the frame
                    // todo обойтись без перезагрузки страницы
                    window.location.reload();
                }
            });
            return false;
        });
    }

    // Title editing for uploaded items
    $('.fileupload').on('change', 'input.att-edit-title', function() {
        var that = this;
        var id   = $(this).attr('data-id');
        var x    = $('input[name="x"][type="hidden"]').first().val();

        var updateUrl = 'index.php?r=attacher&a=update_title&id='+id+'&x='+x;

        var value = $(this).val();

        var procDiv = $('<div>', { 'id': "task-processing" });
        $(this).before( procDiv );
        $(this).attr('disabled', true);

        $.post(updateUrl, {title: value}, function() {
            $(that).attr('disabled', false);
            $('.fileupload-loading').hide();
            $(procDiv).remove();
        });

    });

    $(document).bind('dragover', function (e) {
        var dropZone = $('#dropzone'),
            timeout = window.dropZoneTimeout;
        if (!timeout) {
            dropZone.addClass('in');
        } else {
            clearTimeout(timeout);
        }
        var found = false,
            node = e.target;
        do {
            if (node === dropZone[0]) {
                found = true;
                break;
            }
            node = node.parentNode;
        } while (node != null);
        if (found) {
            dropZone.addClass('hover');
        } else {
            dropZone.removeClass('hover');
        }
        window.dropZoneTimeout = setTimeout(function () {
            window.dropZoneTimeout = null;
            dropZone.removeClass('in hover');
        }, 1500);
    });

    $(document).bind('drop dragover', function (e) {
        e.preventDefault();
    });
});
