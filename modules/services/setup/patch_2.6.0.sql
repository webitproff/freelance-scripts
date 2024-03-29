ALTER TABLE `cot_services`
CHANGE `item_id` `item_id` int(10) unsigned NOT NULL auto_increment,
CHANGE `item_userid` `item_userid` int(11) DEFAULT '0',
CHANGE `item_date` `item_date` int(11) DEFAULT '0',
CHANGE `item_update` `item_update` int(11) DEFAULT '0',
CHANGE `item_parser` `item_parser` VARCHAR(64) DEFAULT '',
CHANGE `item_cat` `item_cat` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_title` `item_title` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_alias` `item_alias` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_desc` `item_desc` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_keywords` `item_keywords` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_metatitle` `item_metatitle` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_metadesc` `item_metadesc` varchar(255) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_text` `item_text` MEDIUMTEXT collate utf8_unicode_ci,
CHANGE `item_cost` `item_cost` float(16,2) DEFAULT '0',
CHANGE `item_count` `item_count` int(11) DEFAULT '0',
CHANGE `item_sort` `item_sort` int(11) DEFAULT '0',
CHANGE `item_state` `item_state` tinyint(4) DEFAULT '0',
CHANGE `item_country` `item_country` varchar(3) collate utf8_unicode_ci DEFAULT '',
CHANGE `item_region` `item_region` INT( 11 ) DEFAULT '0',
CHANGE `item_city` `item_city` INT( 11 ) DEFAULT '0';