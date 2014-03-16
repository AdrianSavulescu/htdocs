<?php

Class PTO {

	private $_db,
			$_pto_form,
			$_pto_request_form,
			$_self_pto_request_form;

	public $department;
	

	public function __construct() {
	
		$this->_db = Db::getInstance();

	}

	public function generate_pto_management() {

		$this->_pto_form = '
		<table border="1" width="650">
		<tr>
		<th>Name</th>
		<th>First Work Day Out</th>
		<th>Last Work Day Out</th>
		<th>PTO description</th>
		<th>Approval Status</th>
		<th>Modify Status</th>
		</tr>';	

		foreach (self::get_all_pto_requests() as $pto_request) {

			$data = self::get_user_name($pto_request->user_id);

			$this->_pto_form .= '
				<tr>
				<td>'. $data[0]->username .'</td>
				<td>'. $pto_request->date_from .'</td>
				<td>'. $pto_request->date_to .'</td>
				<td>'. $pto_request->description .'</td>
				<td>'. $pto_request->status .'</td>
				<td>';
			
			if ($pto_request->status == "Pending") {
			
			$this->_pto_form .= '
				<a href="admin.php?page=PTO&action=approve&id='.$pto_request->id.'">Approve</a>
				<a href="admin.php?page=PTO&action=deny&id='.$pto_request->id.'">Deny</a>';
			} else {

			$this->_pto_form .= ' 
				<a href="admin.php?page=PTO&action=delete&id='.$pto_request->id.'">Delete</a>';

			}
			$this->_pto_form .=  '</td></tr>';

		}

		$this->_pto_form .= '</table>';

		return $this->_pto_form;
	}

	private function get_all_pto_requests(){

		$data = $this->_db->query('SELECT * FROM pto', array(''));

		return $data = $data->results();
	}

	private function get_pto_by_user($id){

		$data = $this->_db->query('SELECT * FROM pto WHERE user_id', array($id));

		return $data = $data->results();
	}

	public function check_page_action($action, $id) {


		if ($action =='approve') {

			self::approve_pto($id);
		}
		
		if ($action =='deny') {
			self::deny_pto($id);
		}
		
		
		if ($action =='delete') {
			self::delete_pto($id);
		}

	}

	private function approve_pto($id){

		$this->_db->update('pto', $id, array('status' => 'Approved'));

	}

	private function deny_pto($id){

		$this->_db->update('pto', $id, array('status' => 'Denied'));

	}

	private function delete_pto($id){

		$this->_db->delete('pto',array('id', '=', $id));

	}

	public function request($fields){
		if(!$this->_db->insert('pto', $fields)) {
			throw new Exception('There was a problem adding the PTO request.');
		}
	}

	public function self_pto_request_form() {

		$this->_self_pto_request_form = '


		<form method="post" action="profile.php?page=PTO" name="request_pto" id="reply">

				<fieldset>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">First PTO day</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="first_pto" value="" class="text" id="datepicker_pto_from"></div>
						</td>
						</tr>

						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Last PTO day</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="last_pto" value="" class="text" id="datepicker_pto_to"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">PTO Description</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="pto_description" value="" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="request_pto" class="button" value="Request PTO" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				</table>
				</fieldset>

			</form>


		';

		return $this->_self_pto_request_form;
	}

	public function pto_request_form($params) {

		$this->_pto_request_form = '


		<form method="post" action="admin.php?page=PTO" name="request_pto" id="reply">

				<fieldset>
					<div class="legend"><h3>Add PTO entry</h3></div>
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
									$this->_pto_request_form .= ' <option ';if($userdata->user_id == $params['user_id']) {$this->_pto_request_form .= 'selected="selected"';} $this->_pto_request_form .= 'value="'.$userdata->user_id.'">'.$userdata->username.'</option>';
								}
								$this->_pto_request_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">First PTO day</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="first_pto" value="" class="text" id="datepicker_pto_from"></div>
						</td>
						</tr>

						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Last PTO day</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="last_pto" value="" class="text" id="datepicker_pto_to"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">PTO Description</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="pto_description" value="" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="request_pto" class="button" value="Request PTO" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				</table>
				</fieldset>

			</form>
		';

		return $this->_pto_request_form;
	}

	private function get_user_name($id){

		$data = $this->_db->query('SELECT pto.user_id, users.username, users.id FROM users, pto WHERE pto.user_id = users.id AND pto.user_id = ?', array($id));
	
		return $data = $data->results();
	}

	private function get_all_users_by_department(){

		$data = $this->_db->query('SELECT users.username, users.id AS user_id, departments.id AS department_id FROM users, departments WHERE departments.id = users.department_id AND departments.name = ?', array($this->department));

		return $data = $data->results();
	}

	public function generate_my_pto_list($user_id){

		$this->_my_pto_list = '
		<table border="1" width="650">
		<tr>
		<th>First Work Day Out</th>
		<th>Last Work Day Out</th>
		<th>PTO description</th>
		<th>Approval Status</th>
		</tr>';	

		foreach (self::get_pto_by_user($user_id) as $pto_request) {

			$data = self::get_user_name($pto_request->user_id);

			$this->_my_pto_list .= '
				<tr>
				<td>'. $pto_request->date_from .'</td>
				<td>'. $pto_request->date_to .'</td>
				<td>'. $pto_request->description .'</td>
				<td>'. $pto_request->status .'</td>
				</tr>';
		}

		$this->_my_pto_list .= '</table>';

		return $this->_my_pto_list;

	}


}