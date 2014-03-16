<?php

Class Voucher {

	public $department;
	private $_db;

	public function __construct() {
	
		$this->_db = Db::getInstance();

	}

	public function form($params) {
		$this->_voucher_form = '

			<form method="post" action="admin.php?page=voucher" name="voucher_form" id="reply">

				<fieldset>

				<div class="legend"><h3>Add voucher</h3></div>
					<table>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property">User</div>
						</td>
						<td>
						<div class="form-value">

						<select name="userlist" id="userlist">
							<option value="0">Select a user...</option>';
								foreach (self::get_all_users_by_department() as $userdata) {
									$this->_voucher_form .= ' <option ';if($userdata->user_id == $params['user_id']) {$this->_voucher_form .= 'selected="selected"';} $this->_voucher_form .= 'value="'.$userdata->user_id.'">'.$userdata->username.'</option>';
								}
								$this->_voucher_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Voucher serial</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="key" class="text" value="'.$params['key'].'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Voucher Number</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="number" class="text"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="add_entry" class="button" value="Add voucher entry" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

				
				</table>
				</fieldset>

			</form>

		';

		return $this->_voucher_form;
	}

	public function generate_voucher_management() {

		$this->_voucher_form = '
		<table border="1" width="650">
		<tr>
		<th>Name</th>
		<th>Voucher Serial</th>
		<th>Voucher Number</th>
		<th>Voucher returned?</th>
		<th>Voucher sent?</th>
		<th>Modify</th>
		</tr>';	

		foreach (self::get_all_voucher_requests() as $voucher_request) {

			$data = self::get_user_name($voucher_request->user_id);

			$this->_voucher_form .= '
				<tr>
				<td>'. $data[0]->username .'</td>
				<td>'. $voucher_request->key .'</td>
				<td>'. $voucher_request->number .'</td>
				<td>'. $voucher_request->returned .'</td>
				<td>'. $voucher_request->sent .'</td>
				<td>';
				
				if ($voucher_request->sent == "Yes"){

					$this->_voucher_form .= '<a href="admin.php?page=voucher&action=delete&id='.$voucher_request->id.'">Delete</a>';

				} else

				if ($voucher_request->returned == "Yes") {
			
					$this->_voucher_form .= '<a href="admin.php?page=voucher&action=send&id='.$voucher_request->id.'">Send</a>';

				} else {

					$this->_voucher_form .= '<a href="admin.php?page=voucher&action=return&id='.$voucher_request->id.'">Return</a>';

				}
			
			$this->_voucher_form .=  '</td></tr>';

		}

		$this->_voucher_form .= '</table>';

		return $this->_voucher_form;
	}

	private function get_all_voucher_requests(){

		$data = $this->_db->query('SELECT * FROM vouchers', array(''));

		return $data = $data->results();
	}


	private function get_all_users_by_department(){

		$data = $this->_db->query('SELECT users.username, users.id AS user_id, departments.id AS department_id FROM users, departments WHERE departments.id = users.department_id AND departments.name = ?', array($this->department));

		return $data = $data->results();
	}

	public function get_user_details($name){

		$data = $this->_db->query('SELECT users.id, users.username, users.email, users.weekend_days, users.department_id, users.admin, users.color, departments.name AS department_name FROM departments, users WHERE users.department_id = departments.id AND users.username = ?', array($name));
	
		return $data = $data->results();
	}

	public function create($fields = array()) {

		if(!$this->_db->insert('vouchers', $fields)) {
			throw new Exception('There was a problem creating an account.');
		}
	}

	private function get_user_name($id){

		$data = $this->_db->query('SELECT vouchers.user_id, users.username, users.id FROM users, vouchers WHERE vouchers.user_id = users.id AND vouchers.user_id = ?', array($id));
	
		return $data = $data->results();
	}

	public function check_page_action($action, $id) {


		if ($action =='return') {

			self::return_voucher($id);
		}
		
		if ($action =='send') {
			self::send_voucher($id);
		}

		if ($action =='delete') {
			self::delete_voucher($id);
		}
		
	}

	private function delete_voucher($id){

		$this->_db->delete('vouchers',array('id', '=', $id));

	}

	private function return_voucher($id){

		$this->_db->update('vouchers', $id, array('returned' => 'Yes'));

	}

	private function send_voucher($id){

		$this->_db->update('vouchers', $id, array('sent' => 'Yes'));

	}

}