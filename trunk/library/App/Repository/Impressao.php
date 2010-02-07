<?php 


class App_Repository_Impressao extends App_Repository_Abstract {	
	function __construct(){
		
		parent::__construct();
		$this->modelo = new Application_Model_Impressao();
		
	}
}