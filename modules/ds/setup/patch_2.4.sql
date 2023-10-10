
CREATE TABLE IF NOT EXISTS `cot_ds_files` (
  `file_id` int(10) unsigned NOT NULL auto_increment,
  `file_mid` int(11) NOT NULL,
  `file_url` varchar(255) collate utf8_unicode_ci default NULL,
  `file_title` varchar(255) collate utf8_unicode_ci default NULL,
  `file_ext` varchar(4) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;