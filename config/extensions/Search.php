<?php

# Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}


wfLoadExtension( 'AdvancedSearch' );
wfLoadExtension( 'Elastica' );
wfLoadExtension( 'CirrusSearch' );

$wgCirrusSearchServers = [ 'wikisearch'];


$wgDisableSearchUpdate = true;
?>