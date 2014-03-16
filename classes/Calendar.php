<?php

Class Calendar {
	private $_currentMonth,
			$_currentYear,
			$_currentDay,
			$_db,
			$_data,
			$_counter,
			$_shift_counter = 1,
			$_shift_checker = NULL,
			$_schedule_form,
			$_week,
			$_calendar = NULL;

	public $department;
	public $edit = false;

	public function __construct() {
	
		$this->_db = Db::getInstance();

		if (Input::exists('post')) {
			if (!empty(Input::get('previous_month'))) {
			
				$_SESSION['current_month'] = $_SESSION['current_month'] -1;
				
				if ($_SESSION['current_month'] == 0) {
				
						$_SESSION['current_month'] = 12;
						$_SESSION['current_year'] = $_SESSION['current_year'] - 1;
				}	
			}

			if (!empty(Input::get('next_month'))) {
			
				$_SESSION['current_month'] = $_SESSION['current_month'] +1;
				
				if ($_SESSION['current_month'] == 13) {
					$_SESSION['current_month'] = 1;
					$_SESSION['current_year'] = $_SESSION['current_year'] + 1;
				}
			} 
		} else {
			$_SESSION['current_month'] = date('n');
			$_SESSION['current_year'] = date('Y');

		}


		$this->_currentMonth = $_SESSION['current_month'];
		$this->_currentYear = $_SESSION['current_year'];
		self::calculate();

	}

	public function generate() {

		$week_number = $this->_data['week_number'];

			//calendar generator loop based on each week in the month
			for ($i=0; $i<$week_number;$i++) {

				$this->_week = $i + 1;
				$this->_calendar .= '<br></br><table class="table_container" cellspacing="0">';
				self::daysGenerator($this->_data['days_in_month'], $this->_data['total_days']);
				self::schedule();
				$this->_calendar .= '</tbody>';
				$this->_calendar .= '</table>';
			}

		

		echo $this->_calendar;

	}

	private function calculate() {

		$month = $this->_currentMonth;
		$year = $this->_currentYear;

		//generate days in month
		$this->_data['days_in_month'] = cal_days_in_month(CAL_GREGORIAN, $month, $year);

		//generate the first day of the month(unreadable)
		$first_numerical_day_in_month = mktime(0,0,0,$month, 1, $year);


		//Here we find out what day of the week the first day of the month falls on (name)
		$first_day_of_month = date('D', $first_numerical_day_in_month);

		//convert to numerical(readable)
		switch($first_day_of_month) {
			case "Mon": $first_day_of_month = 0; break;
			case "Tue": $first_day_of_month = 1; break;
			case "Wed": $first_day_of_month = 2; break;
			case "Thu": $first_day_of_month = 3; break;
			case "Fri": $first_day_of_month = 4; break;
			case "Sat": $first_day_of_month = 5; break;
			case "Sun": $first_day_of_month = 6; break;
		}

		//generate blank spaces after months end
		$this->_data['post_blank_space'] = (7 - (date('w', mktime(0, 0, 0, $month, $this->_data['days_in_month'], $year))));

		//generate blank spaces before months end
		$this->_data['pre_blank_space'] = $first_day_of_month <= 0 ? $first_day_of_month : -$first_day_of_month;

		//calculate the total number of days in month + pre and post empty spaces to generate the calendar
		$this->_data['total_days'] = $this->_data['days_in_month'] + $first_day_of_month + $this->_data['post_blank_space'];

		//generating number of weeks in month;
		$this->_data['week_number'] = $this->_data['total_days'] / 7;

		//fix for not generating empty row
		if ($this->_data['post_blank_space'] == 7) {
			$this->_data['week_number'] = $this->_data['week_number']-1;
		}

		//setting the counter to the negative value which whill be used by the generator
		$this->_counter = $this->_data['pre_blank_space'];
		$this->_currentDay = $this->_data['pre_blank_space'];
	}

	private function daysGenerator($days_in_month, $total_days) {

		$this->_calendar .= '<thead>';
		$this->_calendar .= '<tr class="table_header">';

		//loop for day names
		for ($i= 0; $i < 9 ;$i++) {
		
			switch($i) {
				case "0": $dayname = "&nbsp;"; break;
				case "1": $dayname = "Mon"; break;
				case "2": $dayname = "Tue"; break;
				case "3": $dayname = "Wed"; break;
				case "4": $dayname = "Thur"; break;
				case "5": $dayname = "Fri"; break;
				case "6": $dayname = "Sat"; break;
				case "7": $dayname = "Sun"; break;
				case "8": $dayname = "&nbsp;"; break;
			}

			if ($i==0) {
				$this->_calendar .= '<th class="header_non_day">Week '. $this->_week .'</th>';
			}  else if ($i==8){
				$this->_calendar .= '</tr>';
				$this->_calendar .= '</thead>';
				$this->_calendar .= '<tbody>';
				$this->_calendar .= '<tr class="days_container">';
				$this->_calendar .= '<td class="description">&nbsp;</td>';
			} else {
				$this->_calendar .= '<th class="header_day">' . $dayname . '</th>';
			}
		}


		//loop for day values
		for ($i=0; $i<7;$i++) {
		
			if ($this->_counter < 0) {
				$type = 'invalid';
				$this->_counter++;
			}else if ($this->_counter < $days_in_month){
				$type = 'valid';
				$this->_counter++;
			}else if ($this->_counter < $total_days) {
			$type = 'invalid';
			$this->_counter++;
			}
			
			$month_name = self::month_name($this->_currentMonth);

			if ($type == 'valid') {
				$value = $month_name.' - '.$this->_counter;
			} else {
				$value = '&nbsp;';
			}

			
			$this->_calendar .= '<td class="day_value" id="'. $type .'">'. $value .'</td>';
		}

		$this->_calendar .= '</tr>';
	}

	public function schedule() {

		foreach(self::get_shifts_by_department_and_date() as $shift) {

				$usercount = 0;

				$shift_data = self::get_shift_details($shift->shift);

				foreach(self::get_users_by_shift($shift->shift) as $user) {

					$usercount++;

				}

				if ($usercount != 0) {

					$this->_calendar .= '<tr class="shift_data_container">';

					$this->_calendar .= '<td class="shift_name" rowspan="'.$usercount.'">'. $shift->shift .' '. $shift_data[0]->description .'</td>';

				}


			foreach(self::get_users_by_shift($shift->shift) as $user) {


				$current_day = $this->_counter - 7;

				//nr of days loop
				for ($days=1; $days<=7;$days++) {
				
					$current_day = $current_day +1;
					$this->_currentDay = $current_day;
					
					if ($data = self::user_is_active_on_shift($user->username, $shift->shift)){

						$color = self::get_user_color($user->username);

						$this->_calendar .= '<td class="user_data" id="'. $data[0]->id .'" style="background-color: '. $color[0]->color .';">';

						$this->_calendar .= '
						<div class="userbox" id="'.$data[0]->id.'"> '. $user->username;

						if($this->edit == true) {

						$this->_calendar .= '
							<form action="schedule.php?page=management&ajax=true" method="post">
								<input type="hidden" name="id" value="'. $data[0]->id .'" class="id">
								<input type="submit" name="remove_entry" value="x" class="ajax_btn">
							</form>';

						}

						$this->_calendar .= '</div></td>';

					} else {
						$this->_calendar .= '<td class="user_data" id="OFF">&nbsp;</td>';
					} 

					if ($days == 7) {

						$this->_calendar .= '
					</tr>
						<tr class="shift_data_container">
						 ';

					}
				}

			}

			if ($usercount != 0) {

				$this->_calendar .= '</tr>';

			}
			

		}

	}

	


	private function get_shifts_by_department_and_date() {

		$data = $this->_db->query('SELECT DISTINCT shift FROM schedule WHERE `month` = ? AND year = ? AND department = ? ORDER BY shift asc', array($this->_currentMonth, $this->_currentYear, $this->department));

		return $data = $data->results();

	}

	private function get_shifts_by_department() {

		$data = $this->_db->query('SELECT departments.name AS department_name, shifts.department_id, shifts.id AS shift_id, shifts.name AS shift_name, shifts.description FROM shifts, departments WHERE shifts.department_id = departments.id AND departments.name = ? ORDER BY name asc', array($this->department));

		return $data = $data->results();

	}

	private function user_is_active_on_shift($username, $shift) {

		$data = $this->_db->query('SELECT * FROM schedule WHERE `day` = ? AND `username` = ? AND `shift` = ?', array($this->_currentDay, $username, $shift));

		if ($data->count() != 0) {

			return $data = $data->results();

		} else {

			return false;
		}

	}

	private function get_users_by_shift($shift) {


		$data = $this->_db->query('SELECT DISTINCT username, shift FROM schedule WHERE shift = ?', array($shift));

		return $data = $data->results();
	
	}

	private function get_shift_details($name){

		$data = $this->_db->get('shifts', array('name', '=', $name));
	
		return $data = $data->results();
	}

	private function get_all_users_by_department(){

		$data = $this->_db->query('SELECT users.username, users.id AS user_id, departments.id AS department_id FROM users, departments WHERE departments.id = users.department_id AND departments.name = ?', array($this->department));

		return $data = $data->results();
	}

	private function get_all_shifts_by_department(){

		$data = $this->_db->query('SELECT shifts.name AS shift_name, shifts.department_id, departments.name AS department_name FROM shifts, departments WHERE departments.id = shifts.department_id AND departments.name = ?', array($this->department));

		return $data = $data->results();
	}

	private function current_date(){

		return $date = implode('-', array($this->_currentYear, $this->_currentMonth,$this->_currentDay));

	}

	private function week_interval() {

		return $week_interval = array('first_day' => $this->_counter + 1, 'last_day' => $this->_counter + 7);

	}

	private function month_name($number) {

		if ($number == 1) {
			
			$month = 'January';
		}
		if ($number == 2) {
			
			$month = 'February';
		}
		if ($number == 3) {
			$month = 'March';
		}

		if ($number == 4) {
			$month = 'April';
		}

		if ($number == 5) {
			$month = 'May';
		}

		if ($number == 6) {
			$month = 'June';
		}

		if ($number == 7) {
			$month = 'July';
		}

		if ($number == 8) {
			$month = 'August';
		}

		if ($number == 9) {
			$month = 'September';
		}

		if ($number == 10) {
			$month = 'October';
		}

		if ($number == 11) {
			$month = 'November';
		}

		if ($number == 12) {
			$month = 'December';
		}

		return $month;
	}



	public function generate_bar(){

		$month = $this->_currentMonth;

		$month_name = self::month_name($month);

		if($this->edit == true){
			$action = 'schedule_management.php';
		} else {
			$action = 'schedule.php';
		}


		echo '

		<div class="title_bar">
			<form name="calendar_control" action="'. $action .'" method="post">

				<div class="previous_month">

				<input type="Submit" class="button" name="previous_month" value="&#171 Previous month">

				</div>
				
				<div class="show_month">

				Calendar date is set to<br> '. $month_name . ', ' . $this->_currentYear . '

				</div>
				<div class="next_month">

				<input type="Submit" class="button" name="next_month" value="Next month &#187;">

				</div>

			</form>
		</div>
		';
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
									$this->_schedule_form .= ' <option ';if($userdata->username == $params['username']) {$this->_schedule_form .= 'selected="selected"';} $this->_schedule_form .= 'value="'.$userdata->username.'">'.$userdata->username.'</option>';
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
									$this->_schedule_form .= ' <option ';if($shiftdata->shift_name == $params['shift']) {$this->_schedule_form .= 'selected="selected"';} $this->_schedule_form .= 'value="'.$shiftdata->shift_name.'">'.$shiftdata->shift_name.'</option>';
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

	public function pick_department_form($params) {
		$this->_update_department_form = '

			<form method="post" action="schedule.php" name="pick_department">

						<div class="form-value">

						<select name="departmentlist" onChange="DoDepartmentPick();" id="departmentlist">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $departmentdata) {
								$this->_update_department_form .= ' <option ';if($departmentdata->name == $params['name']) {$this->_update_department_form .= 'selected="selected"';} $this->_update_department_form .= 'value="'.$departmentdata->name.'">'.$departmentdata->name.'</option>';
								}
								$this->_update_department_form .= '
						</select>
						
						</div>
					
			</form>


		';

		return $this->_update_department_form;
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

	public function current_month() {
		return $this->_currentMonth;
	}

	public function current_year() {
		return $this->_currentYear;
	}

	public function entry_exists($params) {

		$data = $this->_db->query('SELECT * FROM schedule WHERE `username` = ? AND `shift` = ? AND `day` = ? AND `month` = ? AND `year` = ? AND `department` = ?', array($params['username'], $params['shift'], $params['day'], $params['month'], $params['year'], $params['department']));

		if ($data->count() != 0) {

			return true;

		} else {

			return false;
		}

	}

	private function get_user_color($user) {

		$data = $this->_db->query('SELECT color FROM users WHERE username = ?', array($user));

		return $data = $data->results();

	}

	private function get_all_departments(){

		$data = $this->_db->query('SELECT * FROM departments', array(''));

		return $data = $data->results();
	}

}
