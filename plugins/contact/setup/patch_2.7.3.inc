<?php
/**
 * Update to v. 2.7.3
 *
 * Migrate to MySql collation 'utf8mb4_unicode_ci' from 'utf8_unicode_ci'
 * Will not change collation if user using his own $cfg['mysqlcharset'] and $cfg['mysqlcharset'] settings different
 * from 'utf8mb4'
 *
 * Replace table engine MyISAM to InnoDB
 * Some DB tables updates
 */
defined('COT_CODE') or die('Wrong URL');

global $db_contact;

if (empty($db_contact)) {
    // Registering tables
    Cot::$db->registerTable('contact');
}

$changeCollation = false;
if (
    Cot::$cfg['mysqlcharset'] == 'utf8mb4' &&
    (empty(Cot::$cfg['mysqlcollate']) || Cot::$cfg['mysqlcollate'] == 'utf8mb4_unicode_ci')
) {
    $changeCollation = true;
}

Cot::$db->query("
    UPDATE `{$db_contact}` SET `contact_authorid`='0' WHERE `contact_authorid` IS NULL;
    UPDATE `{$db_contact}` SET `contact_val`='0' WHERE `contact_val` IS NULL;
    ALTER TABLE `{$db_contact}` 
        MODIFY `contact_id` int UNSIGNED NOT NULL auto_increment,
        MODIFY `contact_authorid` int UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `contact_date` int UNSIGNED NOT NULL,
        MODIFY `contact_subject` varchar(255) NULL DEFAULT '',
        MODIFY `contact_val` tinyint UNSIGNED NOT NULL DEFAULT '0',
        ENGINE=InnoDB;");
if ($changeCollation) {
    Cot::$db->query("ALTER TABLE `{$db_contact}`
    CONVERT TO CHARACTER SET '" . Cot::$cfg['mysqlcharset'] . "' COLLATE '" . Cot::$cfg['mysqlcollate'] . "', 
    DEFAULT CHARACTER SET='" . Cot::$cfg['mysqlcharset'] . "' COLLATE='" . Cot::$cfg['mysqlcollate'] . "'");
}
