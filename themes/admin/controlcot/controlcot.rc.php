<?php
/**
 * ControlCot Admin Theme for Cotonti Siena
 * purpose of this file: Load resources
 * - public repository on GitHub: https://github.com/webitproff/cot-controlcot
 * @package Content Management Framework Cotonti Siena 0.9.23 https://www.cotonti.com
 * @version 1.0.1
 * @date 07.18.2023
 * @author webitproff
 * @copyright Copyright (c) https://github.com/webitproff webitproff@gmail.com https://t.me/webitproff
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL.');

Resources::addFile('themes/admin/controlcot/css/uikit.min.css', 'css', 200);
Resources::addFile(Cot::$cfg['themes_dir'].'/admin/controlcot/fontawesome/css/all.min.css', 'css', 200);

Resources::addFile(Cot::$cfg['themes_dir'].'/admin/controlcot/js/uikit.min.js', 'js', 300);
Resources::linkFileFooter(Cot::$cfg['themes_dir'].'/admin/controlcot/js/uikit-icons.min.js', 'js', 300);
Resources::linkFileFooter(Cot::$cfg['themes_dir'].'/admin/controlcot/fontawesome/js/all.min.js', 'js', 300);


