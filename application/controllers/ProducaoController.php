<?php

class ProducaoController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function designAction()
    {
        $repositorio = new App_Repository_Layouts();
        $this->view->layouts = $repositorio->GetAll();
    }

    public function fotolitoAction()
    {
        $repositorio = new App_Repository_Fotolitos();
        $this->view->fotolitos = $repositorio->GetAll();
        $this->view->fotolitos_producao = $repositorio->GetAllIsNullFimDeProducao();
    }

    public function revelacaoAction()
    {
        // action body
    }

    public function impressaoAction()
    {
        // action body
    }

    public function transferenciaAction()
    {
        // action body
    }

    public function cortecosturaAction()
    {
        // action body
    }

    public function acabamentoembalagemAction()
    {
        // action body
    }


}















