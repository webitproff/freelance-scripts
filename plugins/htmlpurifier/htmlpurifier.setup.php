<?php
/* ====================
[BEGIN_COT_EXT]
Code=htmlpurifier
Name=HTML Purifier
Category=editor-parser
Description=Makes sure submitted HTML is valid and secure
Version=1.2.1-4.9.3
Date=2017-11-22
Author=Edward Z. Yang, Cotonti plugin by Trustmaster
Copyright=Copyright (c) Edward Z. Yang
Notes=Licensed under GNU LGPL
Auth_guests=RW
Lock_guests=12345A
Auth_members=RW
Lock_members=
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
doctype=01:select:XHTML 1.0 Transitional,XHTML 1.0 Strict,HTML 4.01 Transitional,HTML 4.01 Strict,XHTML 1.1,HTML5:HTML5:Doctype
tidylevel=02:select:none,light,medium,heavy:medium:Tidy level
rel2abs=03:radio::0:Turn relative links into absolute
videoiframe=05:radio::0:Allow video iframes from Youtube/Vimeo
[END_COT_EXT_CONFIG]
==================== */

defined('COT_CODE') or die('Wrong URL');
