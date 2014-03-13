<?php

class DB {
	private static $_instance = null;
	private $_pdo, 
	$_query, 
	$_error = false, 
	$_results, 
	$_count = 0;

	private function __construct (){
		try {
			$this->_pdo = new PDO('mysql:host='. Config::get('mysql/host') . ';dbname=' . Config::get('mysql/db'), Config::get('mysql/username'), Config::get('mysql/password'));

		} catch (PDOException $e) {
			die($e->getMessage());
		}
	}

	public static function getInstance(){
		if (!isset(self::$_instance)) {
			self::$_instance = new DB();
		}
		return self::$_instance;
	}

	public function query($sql, $params = array()) {

		$this->_error = false;
		if($this->_query = $this->_pdo->prepare($sql)) {
			$x = 1;
			if(count($params)) {
				foreach ($params as $param) {
					$this->_query->bindValue($x, $param);
					$x++;
				}
			}

			if($this->_query->execute()){
				$this->_results = $this->_query->fetchAll(PDO::FETCH_OBJ);
				$this->_count = $this->_query->rowCount();
			} else {
				$this->_error = true;
			}
		}
		return $this;
	}

	public function action($action, $table, $where = array()) {

		$operators = array('=', '>', '<', '>=', '<=', '&&', '||');

		if (count($where) === 3) {

			$field 		= $where[0];
			$operator 	= $where[1];
			$value 		= $where[2];

			if(in_array($operator, $operators)) {
				$sql = "{$action} FROM {$table} WHERE {$field} {$operator} ?";
				
				if($this->query($sql, array($value))){
					return $this;
				}
			}
		} else if (count($where) === 7) {

			$field 		= $where[0];
			$operator 	= $where[1];
			$value 		= $where[2];
			$operator2 	= $where[3];
			$field2		= $where[4];
			$operator3 	= $where[5];
			$value2  	= $where[6];

			if(in_array($operator, $operators)) {
				$sql = "{$action} FROM {$table} WHERE {$field} {$operator} ? {$operator2} {$field2} {$operator3} ?";


				if($this->query($sql, array($value, $value2))){
					return $this;
				}
			}
		} else if (count($where) === 11) {
			$field 		= $where[0];
			$operator 	= $where[1];
			$value 		= $where[2];
			$operator2 	= $where[3];
			$field2		= $where[4];
			$operator3 	= $where[5];
			$value2  	= $where[6];
			$operator4 	= $where[7];
			$field3		= $where[8];
			$operator5 	= $where[9];
			$value3  	= $where[10];

			if(in_array($operator, $operators)) {
				$sql = "{$action} FROM {$table} WHERE {$field} {$operator} ? {$operator2} {$field2} {$operator3} ? {$operator4} {$field3} {$operator5} ?";


				if($this->query($sql, array($value, $value2, $value3))){
					return $this;
				}
			}

		}
		return false;
	}

	public function get($table, $where) {
		return $this->action('SELECT *', $table, $where);
	}

	public function delete($table, $where) {
		return $this->action('DELETE', $table, $where);

	}

	public function insert($table, $fields = array()) {

		$keys = array_keys($fields);
		$values = null;
		$x = 1;

		foreach($fields as $field) {
			$values .= '?';
			if ($x < count($fields)) {
				$values .=', ';
			}
			$x++;
		}

		$sql = "INSERT INTO {$table} (`" . implode('`,`', $keys) . "`) VALUES({$values})";
		
		if(!$this->query($sql, $fields)->error()) {
			return true;
		}

		return false;
	}

	public function update($table, $id, $fields){
		$set = '';
		$x = 1;

		foreach($fields as $name => $value){
			$set .="{$name} = ?";
			if ($x < count ($fields)) {
				$set .= ', ';
			}
			$x++;
		}

		$sql = "UPDATE {$table} SET {$set} WHERE id = {$id}";

		if(!$this->query($sql, $fields)->error()) {
			return true;
		}
		return false;
	}

	public function results() {
		return $this->_results;
	}

	public function first() {
		return $this->results()[0];
	}

	public function count() {
		return $this->_count;
	}

	public function error() {
		return $this->_error;
	}
}