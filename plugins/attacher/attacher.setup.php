<?php
/* ====================
[BEGIN_COT_EXT]
Code=attacher
Name=Attacher
Category=files-media
Description=Attach files to posts and pages
Version=1.0.1
Date=2019-11-31
Author=Roffun
Copyright=Copyright (c) Roffun
Notes=<b style="color: #d217ac!important;">Документация и руководство по плагину <a href="https://github.com/webitproff/cot-Attacher-Roffun">Attacher</a> !!!</b>
Auth_guests=R1
Lock_guests=2345A
Auth_members=RW1
Lock_members=2345
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
folder=01:string::datas/attacher:Directory for files
prefix=02:string::att_:File prefix
exts=03:text::gif,jpg,jpeg,png,zip,rar,7z,gz,bz2,pdf,djvu,mp3,ogg,wma,avi,divx,mpg,mpeg,swf,txt:Allowed extensions (comma separated, no dots and spaces)
items=04:string::8:Default attachments count per post (max.), 0 - unlimited
chunkSize=05:string::2000000:Chunk size (in bytes) (0 - Disable chunked file uploads)
accept=05:text:::Accepted MIME types in file selection dialog, comma separated. Empty means all types.
filesize=06:string::4194304:Max file size in bytes
filespace=07:string::104857600:Total file space per user
autoupload=08:radio::0:Start uploading automatically
sequential=09:radio::0:Sequential uploading instead of concurrent
css=10:radio::1:Styles

sep_orig=50:separator:::
img_resize=51:radio::0:auto:Resize uploaded images
img_maxwidht=52:string::1920:Image max width for resize
img_maxheight=53:string::1080:Image max height for resize
imageconvert=54:radio::0:Convert all images to JPG on upload
quality=55:string::85:JPEG quality in %

sep_thumbs=60:separator:::
thumbs=61:radio::1:Display image thumbnails
upscale=62:radio::0:Upscale images smaller than thumb size
thumb_x=63:string::160:Default thumbnail width
thumb_y=64:string::160:Default thumbnail height
thumb_framing=65:select:height,width,auto,crop:crop:Default thumbnail framing mode
thumb_big_width=67:string::800:
thumb_big_height=68:string::500:
thumb_big_framing=69:select:height,width,auto,crop:auto:

sep_wmark_bg=70:separator:::
thumb_watermark=71:string:::Add watermark for thumbs (Filename. Empty for disable)
thumb_wm_x=72:string::200:Image max width for resize
thumb_wm_y=73:string::200:Image max width for resize
bg_image=74:string:::Add background texture for big image (Filename. Empty for disable).
bg_space=75:custom:_INT():0:Background texture around image space (For disable 0).

sep_replacement=90:separator:::
thumb_clickable=91:select:default,clickable,noclickable:default:
thumb_alt_to_title=92:radio::0:
thumb_strip_style=93:radio::0:
thumb_to_picture=94:radio::0:
thumb_wrapper=95:radio::0:
thumb_wrapper_class=96:string:::
[END_COT_EXT_CONFIG]
==================== */

/**
 * Attacher plugin: setup
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun
 * @license BSD License
 **/
defined('COT_CODE') or die('Wrong URL.');
