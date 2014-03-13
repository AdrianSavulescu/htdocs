<?php
class Input {
	public static function exists($type = 'post') {
		switch ($type) {
			case 'post':
				return (!empty($_POST)) ? true : false;
			break;
			case 'get':
				return (!empty($_GET)) ? true : false;
			break;
			default:
				return false;
			break;
		}
	}

	public static function get($item){
		if(isset($_POST[$item])) {
			return $_POST[$item];
		} else if (isset($_GET[$item])) {
			return $_GET[$item];
		}
		return '';
	}

	public function get_all() {
		$var = array();
		if(!empty($_POST)) {
			foreach ($_POST as $item) {
				$var[] = $item;
			}
			return $var;
		} else if (!empty($_GET)) {
			foreach ($_GET as $item) {
				$var[] = $item;
			}
			return $var;
		}
		return '';
	}
}