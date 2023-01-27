<?php
/**
 * Attacher plugin: english language
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

$L['info_name'] = 'Download images and files';
$L['info_desc'] = 'Attaching files, generating different sizes and processing “on the fly” images in articles, pasting into a visual editor';

/**
* CONFIGURATION
*/
$L['cfg_folder'] = 'Directory for files';
$L['cfg_prefix'] = 'File Name Prefix';
$L['cfg_exts'] = 'Allowed file types (separated by commas, without periods or spaces)';
$L['cfg_items'] =' Max. number of attachments in each message ';
$L['cfg_accept'] = array('Valid MIME types in the file selection window, separated by commas.', 'An empty value allows all types. You can use special types: image / *, audio / *, video / *') ;
$L['cfg_filesize'] = 'Max. file size in bytes';
$L['cfg_chunkSize'] = array('Load files with chunks by (bytes)', 'Large files can be loaded in small parts.
    This allows you to upload files of a larger size than specified in the restrictions on downloading files via $ _POST.
    (Leave blank to disable) ');
$L['cfg_filespace'] = 'Total disk space per user';
$L['cfg_autoupload'] = 'Start downloading automatically';
$L['cfg_sequential'] = 'Serial loading instead of parallel';

/**
* SETTING IMAGE DOWNLOAD
*/
$L['cfg_sep_orig'] = 'IMAGE DOWNLOAD SETTING';
$L['cfg_img_resize'] = array('Reduce uploaded images',' Uploaded images will be proportionally reduced
    in accordance with the following parameters');
$L['cfg_img_maxwidht'] = 'Reduce the image width to';
$L['cfg_img_maxheight'] = 'Reduce image height to';
$L['cfg_imageconvert'] = 'Convert all images to jpg upon upload';
$L['cfg_quality'] = 'JPEG quality in%';

/**
* SETTING UP COPIES (thumbnails)
*/
$L['cfg_sep_thumbs'] = 'SETTING UP COPIES (thumbnails)';
$L['cfg_thumbs'] = 'Show thumbnails of images?';
$L['cfg_upscale'] = 'Enlarge images that are smaller than the thumbnail size';
$L['cfg_thumb_x'] = 'Default thumbnail width';
$L['cfg_thumb_y'] = 'Default thumbnail height';
$L['cfg_thumb_framing'] = 'The default thumbnail cropping mode';
$L['cfg_thumb_framing_params'] = array(
'height' => 'Height',
'width' => 'Width',
'auto' => 'Auto',
'crop' => 'Crop'
);
$L['cfg_thumb_big_width'] = 'Width of the large thumbnail';
$L['cfg_thumb_big_height'] = 'Height of the large thumbnail';
$L['cfg_thumb_big_framing'] = 'Method to crop large thumbnails';

/**
* WATERMARK AND BACKGROUND TEXTURE
*/
$L['cfg_sep_wmark_bg'] = 'WATERMARK AND BACKGROUND TEXTURE';
$L['cfg_thumb_watermark'] = array('Watermark for thumbnails',' Path to the watermark file. PNG is supported with transparency.
    (Leave blank to not watermark) ');
$L['cfg_thumb_wm_x'] = array('Watermark. Min. Width', 'Watermark will be put on the thumbnail only if its width
    more than the given ');
$L['cfg_thumb_wm_y'] = array('Watermark. Min. Height', 'The watermark will be put on the thumbnail only if its height
    more than the given ');
$L['cfg_bg_image'] = 'Path to the background texture file';
$L['cfg_bg_space'] = 'Indent size to fill with texture';
$L['cfg_bg_space_hint'] = '0 to disable';

/**
* PROCESSING “PLAID” IN ARTICLES
*/
$L['cfg_sep_replacement'] = 'PROCESSING “FLIGHT” IN ARTICLES';
$L['cfg_thumb_clickable'] = 'How to display images in articles';
$L['cfg_thumb_clickable_params'] = 'By default, All by reference, All by images';
$L['cfg_thumb_alt_to_title'] = array('Create title for links from content alt', '<i> only works when link output mode is turned on </i>');
$L['cfg_thumb_strip_style'] = 'Cut the style attribute on images';
$L['cfg_thumb_to_picture'] = 'Convert all images to adaptive PICTURE';
$L['cfg_thumb_wrapper'] = 'Create container (span)';
$L['cfg_thumb_wrapper_class'] = 'Class names for the span container';

$L['att_add'] = 'Add Files';
$L['att_attach'] = 'Attach files';
$L['att_attachment'] = 'Attached file';
$L['att_attachments'] = 'Attachments';
$L['att_cancel'] = 'Cancel download';
$L['att_cleanup'] = 'Cleaning';
$L['att_allthumbs_remove'] = 'Delete all thumbnails';
$L['att_cleanup_confirm'] = 'This will delete all files attached to messages that no longer exist. Continue?';
$L['att_allthumbs_remove_confirm'] = 'This will delete all created image thumbnails, they will be automatically generated from the original during the call. Continue?';
$L['att_delete'] = 'Delete';
$L['att_downloads'] = 'Downloads';
$L['att_ensure'] = 'Are you sure?';
$L['att_free'] = 'free';
$L['att_filename'] = 'File Name';
$L['att_gallery'] = 'Gallery';
$L['att_processing'] = 'Processing';
$L['att_info'] = 'Information';
$L['att_item'] = 'Element';
$L['att_items_removed'] = 'Items deleted';
$L['att_thumbs_removed'] = 'Thumbnails deleted';
$L['att_kb'] = 'KB';
$L['att_kb_left_of'] = 'KB left, no more files';
$L['att_maxsize'] = 'max. file size';
$L['att_of'] = 'of';
$L['att_remove_all'] = 'Delete All';
$L['att_replace'] = 'Replace';
$L['att_show_info'] = 'Show item information';
$L['att_size'] = 'Size';
$L['att_slideshow'] = 'Slideshow';
$L['att_start'] = 'Get Started';
$L['att_start_upload'] = 'Start Download';
$L['att_title'] = 'Title';
$L['att_title_here'] = 'Put the name here';
$L['att_total'] = 'total';
$L['att_type'] = 'Type';
$L['att_used'] = 'used';
$L['att_user'] = 'User';
$L['att_your_space'] = 'Your space';
$L['att_drag_here'] = 'Drag and drop files here';
$L['att_check'] = 'Mark';
$L['att_check_all'] = 'Mark all';

// Errors
$L['att_err_db'] = 'Database Error';
$L['att_err_delete'] = 'Unable to delete attachment';
$L['att_err_move'] = 'Unable to move the downloaded file';
$L['att_err_noitems'] = 'No items were found';
$L['att_err_nospace'] = 'Not enough personal disk space';
$L['att_err_perms'] = 'You do not have sufficient rights for this action';
$L['att_err_replace'] = 'Unable to replace file';
$L['att_err_thumb'] = 'Unable to create image preview';
$L['att_err_title'] = 'The file name is left blank';
$L['att_err_toobig'] = 'The file is too large';
$L['att_err_type'] = 'This type of file is not allowed';
$L['att_err_upload'] = 'Could not load file';
$L['att_err_count'] = 'Exceeded maximum number of files';

$L['att_button_small_title'] = cot::$cfg['plugin']['attacher']['thumb_x']. '*'. cot::$cfg['plugin']['attacher']['thumb_y'];
$L['att_button_big_title'] = cot::$cfg['plugin']['attacher']['thumb_big_width']. '*'.cot::$cfg['plugin']['attacher']['thumb_big_height'];
$L['visual_only'] = 'The insert is available in visual mode, exit code mode!';
