<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected function _initAutoload()
    {
        $autoloader = new Zend_Application_Module_Autoloader(array(
            'namespace' => 'Application',
            'basePath'  => dirname(__FILE__),
        ));
        return $autoloader;
    }
    
    /*protected function _initNavigation(){
    	
    	$this->bootstrap("layout");
    	$layout = $this->getResource('layout');
    	$view = $layout->getView();
    	$config = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'nav-secondary');
    	
    	$navigation = new Zend_Navigation($config);
    	$view->navigation($navigation);
    	
    }*/
    
}

