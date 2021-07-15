<?php
/**
 * Attacher plugin: download files
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

$row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array($id))->fetch();
if (!$row)
{
	cot_die_message(404);
}

// Increase downloads counter
att_inc_count($id);

// Detect MIME type if possible
$contenttype = att_get_mime($row['att_path']);
$file = $row['att_path'];

// Avoid sending unexpected errors to the client - we should be serving a file,
// we don't want to corrupt the data we send
@error_reporting(0);

// Clear and disable output buffer
while (ob_get_level() > 0)
{
	ob_end_clean();
}

// Make sure the files exists, otherwise we are wasting our time
if (!file_exists($file))
{
	cot_die_message(404);
}

// Get the 'Range' header if one was sent
if (isset($_SERVER['HTTP_RANGE']))
{
	$range = $_SERVER['HTTP_RANGE']; // IIS/Some Apache versions
}
elseif (function_exists('apache_request_headers') && $apache = apache_request_headers())
{
	// Try Apache again
	$headers = array();
	foreach ($apache as $header => $val) $headers[strtolower($header)] = $val;
	if (isset($headers['range']))
	{
		$range = $headers['range'];
	}
	else
	{
		// We can't get the header/there isn't one set
		$range = FALSE;
	}
}
else
{
	// We can't get the header/there isn't one set
	$range = FALSE;
}

// Get the data range requested (if any)
$filesize = filesize($file);
if ($range)
{
	$partial = true;
	list($param, $range) = explode('=', $range);
	if (strtolower(trim($param)) != 'bytes')
	{
		// Bad request - range unit is not 'bytes'
		cot_die_message(400);
	}
	$range = explode(',', $range);
	$range = explode('-', $range[0]); // We only deal with the first requested range
	if (count($range) != 2)
	{
		// Bad request - 'bytes' parameter is not valid
		cot_die_message(400);
	}
	if ($range[0] === '')
	{
		// First number missing, return last $range[1] bytes
		$end = $filesize - 1;
		$start = $end - intval($range[0]);
	}
	elseif ($range[1] === '')
	{
		// Second number missing, return from byte $range[0] to end
		$start = intval($range[0]);
		$end = $filesize - 1;
	}
	else
	{
		// Both numbers present, return specific range
		$start = intval($range[0]);
		$end = intval($range[1]);
		if ($end >= $filesize || (!$start && (!$end || $end == ($filesize - 1))))
		{
			// Invalid range/whole file specified, return whole file
			$partial = false;
		}
	}
	$length = $end - $start + 1;
}
else
{
	 // No range requested
	$partial = false;
}

// Send standard headers
header("Content-Type: $contenttype");
header("Content-Length: $filesize");
header('Content-Disposition: attachment; filename="'.$row['att_filename'].'"');
header('Accept-Ranges: bytes');

if ($partial)
{
	// if requested, send extra headers and part of file...
	header('HTTP/1.1 206 Partial Content');
	header("Content-Range: bytes $start-$end/$filesize");
	if (!$fp = fopen($file, 'r'))
	{
		// Error out if we can't read the file
		cot_die_message(500);
	}
	if ($start)
	{
		fseek($fp,$start);
	}
	while ($length)
	{
		// Read in blocks of 8KB so we don't chew up memory on the server
		$read = ($length > 8192) ? 8192 : $length;
		$length -= $read;
		echo fread($fp,$read);
	}
	fclose($fp);
}
else
{
	// ...otherwise just send the whole file
	readfile($file);
	exit;
}

/**
 * Detects file MIME type
 *
 * @param  string $path File path
 * @return string       MIME type
 */
function att_get_mime($path)
{
	$mime_types = array(
		'txt'  => 'text/plain',
		'htm'  => 'text/html',
		'html' => 'text/html',
		'php'  => 'text/html',
		'css'  => 'text/css',
		'js'   => 'application/javascript',
		'json' => 'application/json',
		'xml'  => 'application/xml',
		'swf'  => 'application/x-shockwave-flash',
		'flv'  => 'video/x-flv',

		// images
		'png'  => 'image/png',
		'jpe'  => 'image/jpeg',
		'jpeg' => 'image/jpeg',
		'jpg'  => 'image/jpeg',
		'gif'  => 'image/gif',
		'bmp'  => 'image/bmp',
		'ico'  => 'image/vnd.microsoft.icon',
		'tiff' => 'image/tiff',
		'tif'  => 'image/tiff',
		'svg'  => 'image/svg+xml',
		'svgz' => 'image/svg+xml',

		// archives
		'zip' => 'application/zip',
		'rar' => 'application/x-rar-compressed',
		'exe' => 'application/x-msdownload',
		'msi' => 'application/x-msdownload',
		'cab' => 'application/vnd.ms-cab-compressed',
		'7z'  => 'application/x-7z-compressed',

		// audio/video
		'mp3' => 'audio/mpeg',
		'qt'  => 'video/quicktime',
		'mov' => 'video/quicktime',

		// adobe
		'pdf' => 'application/pdf',
		'psd' => 'image/vnd.adobe.photoshop',
		'ai'  => 'application/postscript',
		'eps' => 'application/postscript',
		'ps'  => 'application/postscript',

		// ms office
		'doc'  => 'application/msword',
		'rtf'  => 'application/rtf',
		'xls'  => 'application/vnd.ms-excel',
		'ppt'  => 'application/vnd.ms-powerpoint',
		'docx' => 'application/msword',
		'xlsx' => 'application/vnd.ms-excel',
		'pptx' => 'application/vnd.ms-powerpoint',

		// open office
		'odt' => 'application/vnd.oasis.opendocument.text',
		'ods' => 'application/vnd.oasis.opendocument.spreadsheet'
	);

    $ext = att_get_ext($path);

	if (function_exists('mime_content_type'))
	{
		return mime_content_type($path);
	}
	elseif (function_exists('finfo_open'))
	{
		$finfo = finfo_open(FILEINFO_MIME);
		$mimetype = finfo_file($finfo, $path);
		finfo_close($finfo);
		return $mimetype;
	}
	elseif (isset($mime_types[$ext]))
	{
		return $mime_types[$ext];
	}
	else
	{
		return 'application/octet-stream';
	}
}
