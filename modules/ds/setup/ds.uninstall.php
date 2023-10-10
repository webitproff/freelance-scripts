<?php
/**
 * Uninstallation handler
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad (http://cmsworks.ru/users/alexvlad)
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('users', 'module');
global $db, $db_users;

if ($db->fieldExists($db_users, "user_lastmsg"))
{
  $db->query("ALTER TABLE $db_users DROP COLUMN `user_lastmsg`");
}