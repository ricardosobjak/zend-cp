<?php

class App_Repository_Abstract {
	
	protected $db;
	public $modelo;
	
	protected $options = array(
		'host'     => 'localhost',
		'username' => 'root',
		'password' => '',
		'dbname'   => 'mila'
	);
	
	function __construct(){		
		$this->db = Zend_Db::factory("PDO_MYSQL", $this->options);
		Zend_Db_Table_Abstract::setDefaultAdapter($this->db);
	}
	
	public function GetAllByName(){
		if($this->modelo){
			$select = $this->modelo->select();
			$select->order("nome");
			return $this->modelo->fetchAll($select);
		} else {
			throw new Zend_Exception('Modelo não definido');
		}
	}
	
	public function GetAll(){
		if($this->modelo){
			$select = $this->modelo->select();
			return $this->modelo->fetchAll($select);
		} else {
			throw new Zend_Exception('Modelo não definido');
		}
	}
	
	public function GetAllIsNullFimDeProducao(){
		if($this->modelo){
			$select = $this->modelo->select();
			$select->where('data_fim_producao IS NULL');
			return $this->modelo->fetchAll($select);
		} else {
			throw new Zend_Exception('Modelo não definido');
		}
	}
	
}