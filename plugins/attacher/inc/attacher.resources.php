<?php
/**
 * Attacher plugin: resources
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL.');

/* FOR HTML PARSER ENABLED */
//cot::$cfg['parser']
if (cot::$cfg['page']['parser'] == 'html') {
    // IF CKEDITOR
    if (cot::$cfg['plugin']['html']['editor'] == 'ckeditor') {
        $R['attacher_editor_insert_img_buttons'] = '<small data-class="insert--buttons"><button type="button" onclick="fInsert(\'{%=file.thumbnail%}\',getAlt({%=file.id%}),\'{%=file.shortname%}\',\'image\')" title="'.$L['att_button_small_title'] .'">' .cot::$cfg['plugin']['attacher']['thumb_x'] . '</button><button type="button" onclick="fInsert(\'{%=file.thumbnailBig%}\',getAlt({%=file.id%}),\'{%=file.shortname%}\',\'image\')" title="'.$L['att_button_big_title'] .'">' . cot::$cfg['plugin']['attacher']['thumb_big_width'] . '</button></small>';

        $R['attacher_editor_insert_file_button'] = '<small data-class="insert--buttons"><button type="button" onclick="fInsert(\'{%=file.downloadUrl%}\',getAlt({%=file.id%}),\'{%=file.name%}\',\'file\')" title="{%=file.name%}">'.cot::$L['Link'].'</button></small>';

        $R['attacher_editor_insert_function'] = '<script>function fInsert(u,a,n,f){var ed=document.querySelector("div[id^=cke_]").id;if(ed && document.querySelector("#"+ed)){var edt=ed.replace("cke_","");var h;var t;var s=CKEDITOR.instances[edt],e=new URL(u);if(a == ""){t=n;}else{t=a;}if(f == "image"){h=\'<img src="\'+e.pathname+\'" alt="\'+t+\'">\';}if(f == "file"){h=\'<a href="\'+e.href+\'">\'+t+\'</a>\';}"wysiwyg"===s.mode?s.insertHtml(h):alert("{PHP.L.visual_only}")}};</script>';
    }
}
