<?php

wfLoadExtension( 'AdvancedSearch' );
wfLoadExtension( 'Elastica' );
wfLoadExtension( 'CirrusSearch' );

$wgCirrusSearchServers = [ 'wikisearch'];


$wgDisableSearchUpdate = true;
?>