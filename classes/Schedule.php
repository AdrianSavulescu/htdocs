<?php
class Schedule {
	private $_db = null,
			$_schedule_form;

	public $department_id;

	public function __construct() {
		$this->_db = DB::getInstance();
	}

		public function schedule_form($params) {
		$this->_schedule_form = '

			<form method="post" action="schedule_management.php" name="schedule_form" id="reply">

				<fieldset>

				<div class="legend"><h3>Schedule planner</h3></div>
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
									$this->_schedule_form .= ' <option ';if($userdata->user_id == $params['user_id']) {$this->_schedule_form .= 'selected="selected"';} $this->_schedule_form .= 'value="'.$userdata->user_id.'">'.$userdata->username.'</option>';
								}
								$this->_schedule_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">User shift</div>
						</td>
						<td>
						<div class="form-value">

						<select name="shift" id="shift">
							<option value="0">Select a shift...</option>';
								foreach (self::get_all_shifts_by_department() as $shiftdata) {
									$this->_schedule_form .= ' <option ';if($shiftdata->shift_id == $params['shift_id']) {$this->_schedule_form .= 'selected="selected"';} $this->_schedule_form .= 'value="'.$shiftdata->shift_id.'">'.$shiftdata->shift_name.'</option>';
								}
								$this->_schedule_form .= '

						</select>
						
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">From</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="from" class="text" id="datepicker_schedule_from"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">To</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="to" class="text" id="datepicker_schedule_to"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="add_entry" class="button" value="Add schedule entry" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

				
				</table>
				</fieldset>

			</form>

		';

		return $this->_schedule_form;
	}

		private function get_all_users_by_department(){

		$data = $this->_db->query('SELECT users.username, users.id AS user_id, departments.id AS department_id FROM users, departments WHERE departments.id = users.department_id AND departments.id = ?', array($this->department_id));

		return $data = $data->results();
	}

	private function get_all_shifts_by_department(){

		$data = $this->_db->query('SELECT shifts.name AS shift_name, shifts.id AS shift_id, shifts.department_id, departments.name AS department_name FROM shifts, departments WHERE departments.id = shifts.department_id AND departments.id = ?', array($this->department_id));

		return $data = $data->results();
	}

	public function create($fields = array()) {

		if(!$this->_db->insert('schedule', $fields)) {
			throw new Exception('There was a problem adding the schedule entry.');
		}
	}

	public function delete($fields = array()) {

		if(!$this->_db->delete('schedule', $fields)) {
			throw new Exception('There was a problem deleting a schedule entry.');
		}
	}

	public function entry_exists($params) {

		$data = $this->_db->query('SELECT * FROM schedule WHERE `user_id` = ? AND `shift_id` = ? AND `day` = ? AND `month` = ? AND `year` = ? AND `department_id` = ?', array($params['user_id'], $params['shift_id'], $params['day'], $params['month'], $params['year'], $params['department_id']));

		if ($data->count() != 0) {

			return true;

		} else {

			return false;
		}
	}

	private function get_shifts_by_department() {

		$data = $this->_db->query('SELECT departments.name AS department_name, shifts.department_id, shifts.id AS shift_id, shifts.name AS shift_name, shifts.description FROM shifts, departments WHERE shifts.department_id = departments.id AND departments.id = ? ORDER BY name asc', array($this->department_id));

		return $data = $data->results();

	}

}