<?php
/*=====================
* [BEGIN_COT_EXT]
* Hooks=admin.config.tags
* [END_COT_EXT]
=====================*/

/**
 * boxes plugin
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2015 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

if ($cot_plugins_active['ckeditor'] && $cfg['jquery'])
{
     $out['head_head'] .= ('<script>$(document).ready(function(){$("textarea[name=indextextboxes]").addClass("editor");});</script><script src="' . $cfg['plugins_dir'] .
          '/ckeditor/presets/ckeditor.default.set.js"></script>');
}
