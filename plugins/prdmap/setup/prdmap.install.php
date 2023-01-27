<?php
defined('COT_CODE') or die('Wrong URL');

global $db;

/*
$db->query("DROP FUNCTION IF EXISTS prdmapdist");
$db->query("CREATE FUNCTION prdmapdist(lat1 float, lon1 float, lat2 float, lon2 float) RETURNS float
  BEGIN
  declare d_lon float;
  declare x float;
  declare y float;

  set lat1 = lat1 * pi() / 180;
  set lon1 = lon1 * pi() / 180;
  set lat2 = lat2 * pi() / 180;
  set lon2 = lon2 * pi() / 180;
  set d_lon = lon1 - lon2;

  set y = POWER(COS(lat2) * SIN(d_lon), 2) + POWER(COS(lat1) * SIN(lat2) - SIN(lat1) * COS(lat2) * COS(d_lon), 2);
  set x = SIN(lat1) * SIN(lat2) + COS(lat1) * COS(lat2) * COS(d_lon);
  RETURN ROUND( (ATAN2(SQRT(y), x) * 6372.795) , 3);
END;");
*/

global $db_users;

// Add field if missing
if (!$db->fieldExists($db_users, "user_prdmap"))
{
	$dbres = $db->query("ALTER TABLE `$db_users` ADD COLUMN `user_prdmap` text NOT NULL default ''");
}
if (!$db->fieldExists($db_users, "user_prdmaplat"))
{
	$dbres = $db->query("ALTER TABLE `$db_users` ADD COLUMN `user_prdmaplat` FLOAT DEFAULT 0");
}
if (!$db->fieldExists($db_users, "user_prdmaplng"))
{
	$dbres = $db->query("ALTER TABLE `$db_users` ADD COLUMN `user_prdmaplng` FLOAT DEFAULT 0");
}

if(cot_module_active('market')) {
  require_once cot_incfile('market', 'module');

  global $db_market;

  // Add field if missing
  if (!$db->fieldExists($db_market, "item_prdmap"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_market` ADD COLUMN `item_prdmap` text NOT NULL default ''");
  }
  if (!$db->fieldExists($db_market, "item_prdmaplat"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_market` ADD COLUMN `item_prdmaplat` FLOAT DEFAULT 0");
  }
  if (!$db->fieldExists($db_market, "item_prdmaplng"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_market` ADD COLUMN `item_prdmaplng` FLOAT DEFAULT 0");
  }
}

if(cot_module_active('projects')) {
  require_once cot_incfile('projects', 'module');

  global $db_projects;

  // Add field if missing
  if (!$db->fieldExists($db_projects, "item_prdmap"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_projects` ADD COLUMN `item_prdmap` text NOT NULL default ''");
  }
  if (!$db->fieldExists($db_projects, "item_prdmaplat"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_projects` ADD COLUMN `item_prdmaplat` FLOAT DEFAULT 0");
  }
  if (!$db->fieldExists($db_projects, "item_prdmaplng"))
  {
  	$dbres = $db->query("ALTER TABLE `$db_projects` ADD COLUMN `item_prdmaplng` FLOAT DEFAULT 0");
  }
}
