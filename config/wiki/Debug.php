<?php
# Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}
$wgShowExceptionDetails = true;
$wgShowDebug = true;
$wgDevelopmentWarnings = true;

//Debug settings - REMOVE IN PRODUCTION
$wgShowExceptionDetails = true;
$wgShowDBErrorBacktrace = true;
$wgShowSQLErrors = true;
$wgDebugDumpSql = true;
$wgDebugLogFile = "/var/www/html/debug-{$wgDBname}.log";

//PHP error reporting
error_reporting( -1 );
ini_set( 'display_errors', 1 );
$wgDebugComments = true;

?>
