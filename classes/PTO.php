<?php

Class PTO {

	private $_db,
			$_pto_form,
			$_pto_request_form;
	

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

	public function pto_request_form() {

		$this->_pto_request_form = '


		<form method="post" action="profile.php?page=PTO" name="request_pto" id="reply">

				<fieldset>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">First PTO day</div>
						</td>
						<td>
						<div class="form-value"><input type="text" size="32" name="first_pto" value="" class="text" id="datepicker"></div>
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
						<div class="form-value"><input type="text" size="32" name="last_pto" value="" class="text" id="datepicker"></div>
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
						<div class="form-value"><input type="text" size="32" name="pto_description" value="" class="text" /></div>
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


}