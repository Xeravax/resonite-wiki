<?php

namespace Mermaid;

use \Config as MWConfig;

class Config {
	/**
	 * @var MWConfig
	 */
	private $globalConfig;

	public function __construct( MWConfig $globalConfig ) {
		$this->globalConfig = $globalConfig;
	}

	public function getDefaultTheme() {
        // See: https://github.com/SemanticMediaWiki/Mermaid/issues/74
		return 'dark';
	}

}
