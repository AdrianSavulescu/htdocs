<?php
class Validate {
	private $_passed = false,
			$_errors = array(),
			$_db = null;

	public function __construct() {
		$this->_db = DB::getInstance();
	}

	public function check($source, $items = array()) {

		foreach($items as $item => $rules) {
			foreach($rules as $rule => $rule_value) {
				$value = trim($source[$item]);
				$item = escape($item);

				if($rule === 'required' && empty($value)) {
					$this->addError("{$item} is required");
				} else if(!empty($value)){
					switch($rule) {
						case 'min':
							if (strlen($value) < $rule_value) {
								$this->addError("{$item} must be a minimum of {$rule_value} characters.");
							}
						break;
						case 'max':
							if (strlen($value) > $rule_value) {
								$this->addError("{$item} must be a maximum of {$rule_value} characters.");
							}
						break;
						case 'matches':
							if($value != $source[$rule_value]) {
								$this->addError("{$rule_value} must match {$item}");
							}
						break;
						case 'unique':
							$check = $this->_db->get($rule_value, array($item, '=', $value));
							if($check->count()) {
								$this->addError("{$item} already exists");
							}
						break;
						case 'email':
							$result = preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$value);

							if ($result != true){
							  	$this->addError("{$item} is not an email valid format");
							}
						break;
						case 'color':
							if($value == '#000000') {
								$this->addError("Color must not be black");
							}
						break;
						case 'date':

							$datetime = DateTime::createFromFormat("d/m/Y", $value);

							if ($datetime == false) {
								$this->addError("Date format is invalid. Use the date picker pick your day.");
							}

						break;

						case 'lower':
							if($value > $rule_value) {
								$this->addError("Initial date must be lower than or equal to following date");
							}
						break;
					}
				}
			}
		}
		if (empty($this->_errors)) {
			$this->_passed = true;
		}

		return $this;
	}

	private function addError($error) {
		$this->_errors[] = $error;
	}

	public function errors() {
		return $this->_errors;
	}

	public function passed() {
		return $this->_passed;
	}
}