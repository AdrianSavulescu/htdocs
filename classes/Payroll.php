<?php

Class Payroll {

	private $_db;
	

	public function __construct() {
	
		$this->_db = Db::getInstance();

	}


}