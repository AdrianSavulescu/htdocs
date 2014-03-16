<?php

Class Shift {

	private $_db,
			$_add_shift_form,
			$_delete_shift_form,
			$_update_shift_form;


	public function __construct() {
		$this->_db = Db::getInstance();

	}

	public function create($fields = array()) {

		if(!$this->_db->insert('shifts', $fields)) {
			throw new Exception('There was a problem creating an account.');
		}
	}

	public function update($fields = array(), $id) {

		if(!$this->_db->update('shifts', $id, $fields)) {
			throw new Exception('There was a problem updating');
		}
	}

	public function delete($fields = array()) {

		if(!$this->_db->delete('shifts', $fields)) {
			throw new Exception('There was a problem deleting an account.');
		}
	}

	public function get_shift_details($name){

		$data = $this->_db->query('SELECT shifts.id, shifts.name, shifts.description, shifts.department_id, departments.name AS department_name FROM shifts, departments WHERE shifts.department_id = departments.id AND shifts.name = ?', array($name));	
	
		return $data = $data->results();
	}

	private function get_all_shifts(){

		$data = $this->_db->query('SELECT * FROM shifts', array(''));

		return $data = $data->results();
	}

	public function add_shift_form() {
		$this->_add_shift_form = '

			<form method="post" action="admin.php?page=shift" name="add_shift" id="reply">

				<fieldset>

				<div class="legend"><h3>Add shift</h3></div>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shift name</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="name" size="30" id="shift_name" class="text"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shift description</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="description" size="30" id="shift_description" class="text"></div>
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
									$this->_add_shift_form .=  '<option value="'.$department->id.'">'.$department->name.'</option>';
								}
						$this->_add_shift_form .=  '

						</select>
						
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="add_shift" class="button" value="Add shift" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>
		';

		return $this->_add_shift_form;
	}

	public function update_shift_form($params) {
		$this->_update_shift_form = '

			<form method="post" action="admin.php?page=shift" name="update_shift">

				<fieldset>

				<div class="legend"><h3>Update shift</h3></div>
					<table>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property">Shifts list</div>
						</td>
						<td>
						<div class="form-value">

						<select name="shiftlist" onChange="DoShiftUpdate();" id="shiftlist">
							<option value="0">Select a shift...</option>';
								foreach (self::get_all_shifts() as $shift) {
								$this->_update_shift_form .= ' <option ';if($shift->id == $params['id']) {$this->_update_shift_form .= 'selected="selected"';} $this->_update_shift_form .= 'value="'.$shift->name.'">'.$shift->name.'</option>';
								}
								$this->_update_shift_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shift name</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="name" class="text" size="30" id="name" value="'.$params['name'].'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shift description</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="description" class="text" size="30" id="description" value="'.$params['description'].'"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shift Department</div>
						</td>
						<td>
						<div class="form-value">

						<select name="department" id="department">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $department) {
									$this->_update_shift_form .= '<option ';if($department->id == $params['department_id']) {$this->_update_shift_form .= 'selected="selected"';} $this->_update_shift_form .=  'value="'.$department->id.'">'.$department->name.'</option>';
								}
								$this->_update_shift_form .=  '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<input type="hidden" name="id" value="'.$params['id'].'">
						<div class="form-value"><input type="submit" value="Update shift" class="button" name="update_shift"/></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>


		';

		return $this->_update_shift_form;
	}

	public function delete_shift_form() {
		$this->_delete_shift_form = '

			<form method="post" action="admin.php?page=shift" name="delete_shift" id="reply">

				<fieldset>

				<div class="legend"><h3>Delete shift</h3></div>
					<table>


					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Shifts list</div>
						</td>

						<td>
						<div class="form-value">

						<select name="delete_shiftlist" id="delete_shiftlist">
							<option value="0">Select a shift...</option>';
								foreach (self::get_all_shifts() as $shift) {
								$this->_delete_shift_form .= ' <option value="'.$shift->name.'">'.$shift->name.'</option>';
								}
								$this->_delete_shift_form .= '
						</select>

						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>

						<td>
						<div class="form-value"><input type="submit" name="delete_shift" class="button" value="Delete shift" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>

	
		';

		return $this->_delete_shift_form;
	}

	private function get_all_departments(){

		$data = $this->_db->query('SELECT * FROM departments', array(''));

		return $data = $data->results();
	}
}
