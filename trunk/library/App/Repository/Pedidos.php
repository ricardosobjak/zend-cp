<?php 


class App_Repository_Pedidos extends App_Repository_Abstract {	
	function __construct(){
		
		parent::__construct();
		$this->modelo = new Application_Model_Pedidos();
		
	}
}