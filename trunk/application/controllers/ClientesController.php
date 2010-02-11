<?php

class ClientesController extends Zend_Controller_Action
{
	protected $clientes;
    public function init()
    {
        $this->clientes = new App_Repository_Clientes();
    }

    public function indexAction()
    {
        $rowset = $this->clientes->GetAllByName();
        $this->view->clientes = $rowset->toArray();
    }
}

