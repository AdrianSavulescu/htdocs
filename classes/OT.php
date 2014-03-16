<?php

Class OT {

	private $_db,
			$_self_ot_request_form,
			$_ot_request_form,
			$_ot_form;

	public $department;
	

	public function __construct() {
	
		$this->_db = Db::getInstance();

	}

	public function generate_ot_management() {

		$this->_ot_form = '
		<table border="1" width="650">
		<tr>
		<th>Name</th>
		<th>Date</th>
		<th>Hours</th>
		<th>OT description</th>
		<th>Status</th>
		<th>Modify Status</th>
		</tr>';	

		foreach (self::get_all_ot_requests() as $ot_request) {

			$data = self::get_user_name($ot_request->user_id);

			$this->_ot_form .= '
				<tr>
				<td>'. $data[0]->username .'</td>
				<td>'. $ot_request->date .'</td>
				<td>'. $ot_request->hours .'</td>
				<td>'. $ot_request->description .'</td>
				<td>'. $ot_request->status .'</td>
				<td>';
			
			if ($ot_request->status == "Pending") {
			
			$this->_ot_form .= '
				<a href="admin.php?page=OT&action=approve&id='.$ot_request->id.'">Send</a>
				<a href="admin.php?page=OT&action=deny&id='.$ot_request->id.'">Deny</a>';
			} else {

			$this->_ot_form .= ' 
				<a href="admin.php?page=OT&action=delete&id='.$ot_request->id.'">Delete</a>';

			}
			$this->_ot_form .=  '</td></tr>';

		}

		$this->_ot_form .= '</table>';

		return $this->_ot_form;
	}

	private function get_all_ot_requests(){

		$data = $this->_db->query('SELECT * FROM overtime', array(''));

		return $data = $data->results();
	}

	public function check_page_action($action, $id) {


		if ($action =='approve') {

			self::approve_ot($id);
		}
		
		if ($action =='deny') {
			self::deny_ot($id);
		}
		
		if ($action =='delete') {
			self::delete_ot($id);
		}
	}

	private function approve_ot($id){

		$this->_db->update('overtime', $id, array('status' => 'Sent'));

	}

	private function deny_ot($id){

		$this->_db->update('overtime', $id, array('status' => 'Denied'));

	}

	private function delete_ot($id){

		$this->_db->delete('overtime',array('id', '=', $id));

	}

	public function request($fields){
		if(!$this->_db->insert('overtime', $fields)) {
			throw new Exception('There was a problem adding the OT entry.');
		}
	}

	public function self_ot_request_form() {

		$this->_self_ot_request_form = '

			<form method="post" action="profile.php?page=OT" name="request_ot" id="reply">

				<fieldset>
				<table>
					<div class="form-row">
					<tr>
					<td>
						<div class="form-property form-required">Overtime date</div>
					</td>
					<td>
						<div class="form-value"><input type="text" name="date" class="text" id="datepicker_ot_date"/></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
					<tr>
					<td>	
						<div class="form-property form-required">Nr of OT hours</div>
					</td>
					<td>
						<div class="form-value"><input type="text" name="hours" class="text" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
					<tr>
					<td>	
						<div class="form-property form-required">OT description</div>
					</td>
					<td>
						<div class="form-value"><input type="text"name="description" class="text" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>
					
					<div class="form-row form-row-submit">
					<tr>
					<td>
					</td>
					<td>
						<div class="form-value"><input type="submit" name="request_ot" class="button" value="Request OT" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				</table>
				</fieldset>

			</form>

		';

		return $this->_self_ot_request_form;
	}

	public function ot_request_form($params) {

		$this->_ot_request_form = '

			<form method="post" action="admin.php?page=OT" name="request_ot" id="reply">

				<fieldset>

				<div class="legend"><h3>Add OT entry</h3></div>

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
									$this->_ot_request_form .= ' <option ';if($userdata->user_id == $params['user_id']) {$this->_ot_request_form .= 'selected="selected"';} $this->_ot_request_form .= 'value="'.$userdata->user_id.'">'.$userdata->username.'</option>';
								}
								$this->_ot_request_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>


					<div class="form-row">
					<tr>
					<td>
						<div class="form-property form-required">Overtime date</div>
					</td>
					<td>
						<div class="form-value"><input type="text" name="date" class="text" id="datepicker_ot_date"/></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
					<tr>
					<td>	
						<div class="form-property form-required">Nr of OT hours</div>
					</td>
					<td>
						<div class="form-value"><input type="text" name="hours" class="text" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
					<tr>
					<td>	
						<div class="form-property form-required">OT description</div>
					</td>
					<td>
						<div class="form-value"><input type="text" name="description" class="text" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>
					
					<div class="form-row form-row-submit">
					<tr>
					<td>
					</td>
					<td>
						<div class="form-value"><input type="submit" name="request_ot" class="button" value="Request OT" /></div>
					</td>
					</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				</table>
				</fieldset>

			</form>

		';

		return $this->_ot_request_form;
	}

	public function generate_my_ot_list($user_id){

		$this->_my_ot_list = '
		<table border="1" width="650">
		<tr>
		<th>Date</th>
		<th>Hours</th>
		<th>OT description</th>
		<th>Status</th>
		</tr>';	

		foreach (self::get_ot_by_user($user_id) as $ot_request) {

			$data = self::get_user_name($ot_request->user_id);

			$this->_my_ot_list .= '
				<tr>
				<td>'. $ot_request->date .'</td>
				<td>'. $ot_request->hours .'</td>
				<td>'. $ot_request->description .'</td>
				<td>'. $ot_request->status .'</td>
				</tr>';

		}

		$this->_my_ot_list .= '</table>';

		return $this->_my_ot_list;

	}

	private function get_user_name($id){

		$data = $this->_db->query('SELECT overtime.user_id, users.username, users.id FROM users, overtime WHERE overtime.user_id = users.id AND overtime.user_id = ?', array($id));
	
		return $data = $data->results();
	}

	private function get_all_users_by_department(){

		$data = $this->_db->query('SELECT users.username, users.id AS user_id, departments.id AS department_id FROM users, departments WHERE departments.id = users.department_id AND departments.name = ?', array($this->department));

		return $data = $data->results();
	}

	private function get_ot_by_user($id){

		$data = $this->_db->query('SELECT * FROM overtime WHERE user_id', array($id));

		return $data = $data->results();
	}


}