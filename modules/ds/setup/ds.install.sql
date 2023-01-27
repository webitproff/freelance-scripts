 CREATE TABLE IF NOT EXISTS `cot_ds_dialog` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `fromid` int(11) NOT NULL default '0',
  `toid` int(11) NOT NULL default '0',
  `fromstatus` tinyint(1) NOT NULL default '1',
  `tostatus` tinyint(1) NOT NULL default '1',
  `lastmsg` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fromid` (`fromid`),
  KEY `toid` (`toid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `cot_ds_msg` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `date` int(11) NOT NULL default '0',
  `dialog` int(11) NOT NULL default '0',
  `touser` int(11) NOT NULL default '0',
  `text` text collate utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `touser` (`touser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE IF NOT EXISTS `cot_ds_files` (
  `file_id` int(10) unsigned NOT NULL auto_increment,
  `file_mid` int(11) NOT NULL,
  `file_url` varchar(255) collate utf8_unicode_ci default NULL,
  `file_title` varchar(255) collate utf8_unicode_ci default NULL,
  `file_ext` varchar(4) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;