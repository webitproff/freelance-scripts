<?php
/**
 * Update to v. 1.1.5
 *
 * Migrate to MySql collation 'utf8mb4_unicode_ci' from 'utf8_unicode_ci'
 * Will not change collation if user using his own $cfg['mysqlcharset'] and $cfg['mysqlcharset'] settings different
 * from 'utf8mb4'
 *
 * Replace table engine MyISAM to InnoDB
 * Some DB tables updates
 */
defined('COT_CODE') or die('Wrong URL');

global $db_users, $db_forum_topics, $db_forum_posts, $db_forum_stats;

if (empty($db_forum_topics) || empty($db_forum_topics) || empty($db_forum_stats)) {
    // Registering tables
    Cot::$db->registerTable('forum_posts');
    Cot::$db->registerTable('forum_topics');
    Cot::$db->registerTable('forum_stats');
}

if (empty($db_users)) {
    // Registering tables
    Cot::$db->registerTable('users');
}

$changeCollation = false;
if (
    Cot::$cfg['mysqlcharset'] == 'utf8mb4' &&
    (empty(Cot::$cfg['mysqlcollate']) || Cot::$cfg['mysqlcollate'] == 'utf8mb4_unicode_ci')
) {
    $changeCollation = true;
}

$dbres = Cot::$db->query("SHOW COLUMNS FROM `$db_users` WHERE `Field` = 'user_postcount'");
if ($dbres->rowCount() > 0) {
    Cot::$db->query("UPDATE `{$db_users}` SET `user_postcount` = 0 WHERE `user_postcount` IS NULL;
    ALTER TABLE `$db_users` MODIFY `user_postcount` INT UNSIGNED NOT NULL DEFAULT 0");
}



if (Cot::$db->indexExists($db_forum_posts, 'fp_topicid')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_topicid`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_updated')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_updated`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_updated_2')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_updated_2`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_topicid_id_idx')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_topicid_id_idx`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_topicid_idx')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_topicid_idx`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_sectionid')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_sectionid`");
}
if (Cot::$db->indexExists($db_forum_posts, 'fp_cat')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}` DROP INDEX `fp_cat`");
}
Cot::$db->query("UPDATE `{$db_forum_posts}` SET `fp_text`='' WHERE `fp_text` IS NULL;
    UPDATE `{$db_forum_posts}` SET `fp_posterip`='' WHERE `fp_posterip` IS NULL;
    ALTER TABLE `{$db_forum_posts}` 
        MODIFY `fp_id` int UNSIGNED NOT NULL auto_increment,
        MODIFY `fp_topicid` mediumint NOT NULL,
        MODIFY `fp_cat` varchar(255) NOT NULL,
        MODIFY `fp_posterid` int UNSIGNED NOT NULL,
        MODIFY `fp_creation` int UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `fp_updated` int UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `fp_text` mediumtext NOT NULL,
        MODIFY `fp_posterip` varchar(15) NOT NULL DEFAULT '',
        ENGINE=InnoDB;");
if ($changeCollation) {
    Cot::$db->query("ALTER TABLE `{$db_forum_posts}`
        CONVERT TO CHARACTER SET '" . Cot::$cfg['mysqlcharset'] . "' COLLATE '" . Cot::$cfg['mysqlcollate'] . "', 
        DEFAULT CHARACTER SET='" . Cot::$cfg['mysqlcharset'] . "' COLLATE='" . Cot::$cfg['mysqlcollate'] . "'");
}
Cot::$db->query("ALTER TABLE `{$db_forum_posts}`
    ADD UNIQUE `fp_topicid_id_idx` (`fp_topicid`,`fp_id`), 
    ADD INDEX `fp_created_idx` (`fp_creation`),
    ADD INDEX `fp_updated_idx` (`fp_updated`),
    ADD INDEX `fp_topicid_idx` (`fp_topicid`),
    ADD INDEX `fp_cat_idx` (`fp_cat`);");




Cot::$db->query("ALTER TABLE `{$db_forum_stats}` 
    MODIFY `fs_cat` varchar(255) NOT NULL,
    MODIFY `fs_lt_id` int UNSIGNED NOT NULL DEFAULT '0',
    MODIFY `fs_lt_date` int UNSIGNED NOT NULL DEFAULT '0',
    MODIFY `fs_lt_posterid` int UNSIGNED NOT NULL,
    MODIFY `fs_topiccount` mediumint UNSIGNED NOT NULL DEFAULT '0',
    MODIFY `fs_postcount` int UNSIGNED NOT NULL DEFAULT '0',
    MODIFY `fs_viewcount` int UNSIGNED NOT NULL DEFAULT '0',
    ENGINE=InnoDB;");
if ($changeCollation) {
    Cot::$db->query("ALTER TABLE `{$db_forum_stats}`
    CONVERT TO CHARACTER SET '" . Cot::$cfg['mysqlcharset'] . "' COLLATE '" . Cot::$cfg['mysqlcollate'] . "', 
    DEFAULT CHARACTER SET='" . Cot::$cfg['mysqlcharset'] . "' COLLATE='" . Cot::$cfg['mysqlcollate'] . "'");
}


if (Cot::$db->indexExists($db_forum_topics, 'ft_sectionid')) {
    Cot::$db->query("ALTER TABLE `{$db_forum_topics}` DROP INDEX `ft_sectionid`");
}
Cot::$db->query("UPDATE `{$db_forum_topics}` SET `ft_tag`='' WHERE `ft_tag` IS NULL;
    ALTER TABLE `{$db_forum_topics}` 
        MODIFY `ft_id` mediumint UNSIGNED NOT NULL auto_increment,
        MODIFY `ft_mode` tinyint UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_state` tinyint UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_sticky` tinyint UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_tag` varchar(16) NOT NULL DEFAULT '',
        MODIFY `ft_cat` varchar(255) NOT NULL,
        MODIFY `ft_title` varchar(255) NOT NULL,
        MODIFY `ft_creationdate` int UNSIGNED NOT NULL,
        MODIFY `ft_updated` int UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_postcount` mediumint UNSIGNED NOT NULL default '0',
        MODIFY `ft_viewcount` mediumint UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_lastposterid` int UNSIGNED NOT NULL DEFAULT '0',
        MODIFY `ft_lastpostername` varchar(100) NOT NULL DEFAULT '',
        MODIFY `ft_firstposterid` int UNSIGNED NOT NULL,
        MODIFY `ft_firstpostername` varchar(100) NOT NULL,
        MODIFY `ft_poll` int UNSIGNED NULL default '0',
        ENGINE=InnoDB;");
if ($changeCollation) {
    Cot::$db->query("ALTER TABLE `{$db_forum_topics}`
    CONVERT TO CHARACTER SET '" . Cot::$cfg['mysqlcharset'] . "' COLLATE '" . Cot::$cfg['mysqlcollate'] . "', 
    DEFAULT CHARACTER SET='" . Cot::$cfg['mysqlcharset'] . "' COLLATE='" . Cot::$cfg['mysqlcollate'] . "'");
}
