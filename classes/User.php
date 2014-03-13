<?php

class User {
	private $_db,
			$_data,
			$_sessionName,
			$_cookieName,
			$_add_user_form,
			$_update_user_form,
			$_delete_user_form,
			$_login_user_form,
			$_isLoggedIn;


	public function __construct($user = null) {
		$this->_db = Db::getInstance();

		$this->_sessionName = Config::get('session/session_name');
		$this->_cookieName = Config::get('remember/cookie_name');

		if (!$user) {
			if(Session::exists($this->_sessionName)) {
				$user = Session::get($this->_sessionName);


				if($this->find($user)) {
					$this->_isLoggedIn = true;
				} else {
					// process Logout
				}
			}
		} else {
			$this->find($user);
		}
	}

	public function update($fields = array(), $id = null) {

		if(!$this->_db->update('users', $id, $fields)) {
			throw new Exception('There was a problem updating');
		}
	}

	public function create($fields = array()) {

		if(!$this->_db->insert('users', $fields)) {
			throw new Exception('There was a problem creating an account.');
		}
	}

	public function delete($fields = array()) {

		if(!$this->_db->delete('users', $fields)) {
			throw new Exception('There was a problem deleting an account.');
		}
	}

	public function find($email = null) {
		if($email) {
			$field = (is_numeric($email)) ? 'id' : 'email';
			$data = $this->_db->get('users', array($field, '=', $email));

			if ($data->count()) {
				$this->_data = $data->first();
				return true;
			}
		}
		return false;
	}

	public function login($email = null, $password = null, $remember = false) {
		
		
		if (!$email && !$password && $this->exists()) {
			Session::put($this->_sessionName, $this->data()->id);
		} else {
			$user = $this->find($email);
			if($user) {
				
				Session::put($this->_sessionName, $this->data()->id);

				if($remember) {
					$hash = Hash::unique();
					$hashCheck = $this->_db->get('users_session', array('user_id', '=', $this->data()->id));

					if(!$hashCheck->count()) {
						$this->_db->insert('users_session', array(
							'user_id' => $this->data()->id,
							'hash' => $hash
						));
					} else {
						$hash = $hashCheck->first()->hash;
					}

					Cookie::put($this->_cookieName, $hash, Config::get('remember/cookie_expiry'));
				}

				return true;
			}
		}

		return false;

	}

	public function hasPermission($key) {
		$group = $this->_db->get('groups', array('id', '=', $this->data()->group));

		if($group->count()) {
			$permissions = json_decode($group->first()->permissions, true);

			if($permissions[$key] == true) {
				return true;
			}
		}

		return false;
	}

	public function exists() {
		return (!empty($this->_data)) ? true : false;
	}

	public function data() {
		return $this->_data;
	}

	public function isLoggedIn() {
		return $this->_isLoggedIn;
	}

	public function logout() {
		$this->_db->delete('users_session', array('user_id', '=', $this->data()->id));

		Session::delete($this->_sessionName);
		Cookie::delete($this->_cookieName);
	}

	public function add_user_form() {
		$this->_add_user_form = '

		<form method="post" action="admin.php?page=user" name="add_user" id="reply">

				<fieldset>

				<div class="legend"><h3>Add user</h3></div>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Username</div>
						</td>
						<td>
						<div class="form-value"><input type="text" size="32" name="username" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Email</div>
						</td>
						<td>
						<div class="form-value"><input type="text" size="32" name="email" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Department</div>
						</td>
						<td>
						<div class="form-value">

						<select name="department" id="department">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $department) {
									$this->_add_user_form .=  '<option value="'.$department->id.'">'.$department->name.'</option>';
								}
						$this->_add_user_form .=  '

						</select>

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Weekend Days</div>
						</td>
						<td>
						<div class="form-value">

						<label for="update_monday">Mon</label>
							<input type="checkbox" name="weekend[]" id="update_monday" value="0">
						<label for="update_tuesday">Tue</label>
							<input type="checkbox" name="weekend[]" id="update_tuesday" value="1">
						<label for="update_wednesday">Wed</label>
							<input type="checkbox" name="weekend[]" id="update_wednesday" value="2">
						<label for="update_thursday">Thur</label>
							<input type="checkbox" name="weekend[]" id="update_thursday" value="3">
						<label for="update_friday">Fri</label>
							<input type="checkbox" name="weekend[]" id="update_friday" value="4">
						<label for="update_saturday">Sat</label>
							<input type="checkbox" name="weekend[]" id="update_saturday" value="5">
						<label for="update_sunday">Sun</label>
							<input type="checkbox" name="weekend[]" id="update_sunday" value="6">

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Is Admin</div>
						</td>
						<td>
						<div class="form-value"><input type="checkbox" name="admin" id="admin"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">User color</div>
						</td>
						<td>
						<div class="form-value"><input type="color" size="32" name="color" class="color" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="add_user" class="button" value="Add user" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

				</table>
				</fieldset>

			</form>

		';

		return $this->_add_user_form;
	}

	public function update_user_form($params) {
		$this->_update_user_form = '

			<form method="post" action="admin.php?page=user" name="update_user" id="reply">

				<fieldset>

				<div class="legend"><h3>Update user</h3></div>
					<table>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property">User</div>
						</td>
						<td>
						<div class="form-value">

						<select name="userlist" onChange="DoUserUpdate();" id="userlist">
							<option value="nouser">Select a user...</option>';
								foreach (self::get_all_users() as $userdata) {
									$this->_update_user_form .= ' <option ';if($userdata->username == $params['username']) {$this->_update_user_form .= 'selected="selected"';} $this->_update_user_form .= 'value="'.$userdata->username.'">'.$userdata->username.'</option>';
								}
								$this->_update_user_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Username</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="username" class="text" size="32" id="username" value="'.$params['username'].'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Email</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="email" class="text" size="32" id="email" value="'.$params['email'].'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Department</div>
						</td>
						<td>
						<div class="form-value">

						<select name="department" id="department">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $department) {
									$this->_update_user_form .= '<option ';if($department->id == $params['department_id']) {$this->_update_user_form .= 'selected="selected"';} $this->_update_user_form .=  'value="'.$department->id.'">'.$department->name.'</option>';
								}
								$this->_update_user_form .=  '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Weekend Days</div>
						</td>
						<td>
						<div class="form-value">

						<label for="monday">Mon</label>
							<input type="checkbox" name="weekend[]" id="monday" value="0"';foreach($params['weekend'] as $day) {if($day == 0) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="tuesday">Tue</label>
							<input type="checkbox" name="weekend[]" id="tuesday" value="1"';foreach($params['weekend'] as $day) {if($day == 1) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="wednesday">Wed</label>
							<input type="checkbox" name="weekend[]" id="wednesday" value="2"';foreach($params['weekend'] as $day) {if($day == 2) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="thursday">Thur</label>
							<input type="checkbox" name="weekend[]" id="thursday" value="3"';foreach($params['weekend'] as $day) {if($day == 3) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="friday">Fri</label>
							<input type="checkbox" name="weekend[]" id="friday" value="4"';foreach($params['weekend'] as $day) {if($day == 4) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="saturday">Sat</label>
							<input type="checkbox" name="weekend[]" id="saturday" value="5"';foreach($params['weekend'] as $day) {if($day == 5) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="sunday">Sun</label>
							<input type="checkbox" name="weekend[]" id="sunday" value="6"';foreach($params['weekend'] as $day) {if($day == 6) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Is Admin</div>
						</td>
						<td>
						<div class="form-value"><input type="checkbox" name="admin" id="admin"';if($params['admin'] == 1) {$this->_update_user_form .= ' checked="checked"';} $this->_update_user_form .= '></div>
						</td>
						</tr>
						<input type="hidden" name="id" value="'.$params['id'].'">
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">User color</div>
						</td>
						<td>
						<div class="form-value"><input type="color" size="32" name="color" class="color" value="'. $params['color'] .'" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="update_user" class="button" value="Update user" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>

		';

		return $this->_update_user_form;
	}

	public function update_self_form($data) {
		$this->_update_user_form = '
			<form method="post" action="profile.php?page=edit" name="update_user" id="reply">

				<fieldset>

				<div class="legend"><h3>Update your user info</h3></div>
					<table>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Username</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="username" class="text" size="32" id="username" value="'.$data->username.'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Email</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="email" class="text" size="30" id="email" value="'.$data->email.'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>';
/*
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">User shift</div>
						</td>
						<td>
						<div class="form-value">

						<select name="shift" id="shift">
							<option value="noshift">Select a shift...</option>';
								foreach (self::get_all_departments() as $shift) {
								$this->_update_user_form .= '<option ';if($shift->shift_name == $params['shift']) {$this->_update_user_form .= 'selected="selected"';} $this->_update_user_form .=  'value="'.$shift->shift_name.'">'.$shift->shift_name.'</option>';
					
								}
								$this->_update_user_form .=  '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Weekend Days</div>
						</td>
						<td>
						<div class="form-value">

						<label for="monday">Mon</label>
							<input type="checkbox" name="weekend[]" id="monday" value="0"';foreach($params['weekend'] as $day) {if($day == 0) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="tuesday">Tue</label>
							<input type="checkbox" name="weekend[]" id="tuesday" value="1"';foreach($params['weekend'] as $day) {if($day == 1) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="wednesday">Wed</label>
							<input type="checkbox" name="weekend[]" id="wednesday" value="2"';foreach($params['weekend'] as $day) {if($day == 2) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="thursday">Thur</label>
							<input type="checkbox" name="weekend[]" id="thursday" value="3"';foreach($params['weekend'] as $day) {if($day == 3) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="friday">Fri</label>
							<input type="checkbox" name="weekend[]" id="friday" value="4"';foreach($params['weekend'] as $day) {if($day == 4) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="saturday">Sat</label>
							<input type="checkbox" name="weekend[]" id="saturday" value="5"';foreach($params['weekend'] as $day) {if($day == 5) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>
						<label for="sunday">Sun</label>
							<input type="checkbox" name="weekend[]" id="sunday" value="6"';foreach($params['weekend'] as $day) {if($day == 6) {$this->_update_user_form .= ' checked="checked"';}} $this->_update_user_form .= '>

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Department</div>
						</td>
						<td>
						<div class="form-value">

							<select name="department" id="department">
								<option value="nodepartment">Select a department...</option>';
								$department = 'GOC'; $this->_update_user_form .= '<option value="GOC"'; if($department == $params['department']) {$this->_update_user_form .= 'selected="selected"';} $this->_update_user_form .= '>GOC</option>';
								$department = 'SSP'; $this->_update_user_form .= '<option value="SSP"'; if($department == $params['department']) {$this->_update_user_form .= 'selected="selected"';} $this->_update_user_form .= '>SSP</option>
							</select>

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Is Admin</div>
						</td>
						<td>
						<div class="form-value"><input type="checkbox" name="admin" id="admin"';if($params['admin'] == 1) {$this->_update_user_form .= ' checked="checked"';} $this->_update_user_form .= '></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
*/	$this->_update_user_form .= '				
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<input type="hidden" name="id" value="'.$data->id.'">
						<div class="form-value"><input type="submit" name="update_user" class="button" value="Update user" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>

		';

		return $this->_update_user_form;
	}

	private function get_all_departments(){

		$data = $this->_db->query('SELECT * FROM departments', array(''));

		return $data = $data->results();
	}

	private function get_all_users(){

		$data = $this->_db->query('SELECT * FROM users', array(''));

		return $data = $data->results();
	}

	public function get_user_details($name){

		$data = $this->_db->query('SELECT users.id, users.username, users.email, users.weekend_days, users.department_id, users.admin, users.color, departments.name AS department_name FROM departments, users WHERE users.department_id = departments.id AND users.username = ?', array($name));
	
		return $data = $data->results();
	}

	public function delete_user_form() {
		$this->_delete_user_form = '

			<form method="post" action="admin.php?page=user" name="delete_user" id="reply">

				<fieldset>

				<div class="legend"><h3>Delete user</h3></div>
					<table>


					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Username</div>
						</td>

						<td>
						<div class="form-value">

						<select name="delete_userlist" id="delete_userlist">
							<option value="nouser">Select a user from bellow</option>';
								foreach (self::get_all_users() as $userdata) {
									$this->_delete_user_form .= ' <option value="'.$userdata->username.'">'.$userdata->username.'</option>';
								}
								$this->_delete_user_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row">
						<tr>
						<td>
						</td>

						<td>
						<div class="form-value"><input type="submit" name="delete_user" class="button" value="Delete user" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>

		';

		return $this->_delete_user_form;
	}

	public function login_user_form(){
		$this->_login_user_form = '

						<form action="index.php" method="post" id="reply">

				<fieldset>

				<div class="legend"><h3>Enter your credentials</h3></div>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Email</div>
						</td>
						<td>
						<div class="form-value"><input type="text" size="32" name="email" value="" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Password</div>
						</td>
						<td>
						<div class="form-value"><input type="password" size="32" name="password" value="" class="text" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-value"><input type="checkbox" name="remember" id="remember">Remember me</div>
						</td>
						<td>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

						<input type="hidden" name="token" value="'. Token::generate() .'">

					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="log_in" class="button" value="Log In!" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>


		';

		return $this->_login_user_form;
	}
}