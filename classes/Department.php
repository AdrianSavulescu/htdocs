<?php

Class Department {

	private $_db,
			$_add_department_form,
			$_delete_department_form,
			$_update_department_form;


	public function __construct() {
		$this->_db = Db::getInstance();

	}

	public function create($fields = array()) {

		if(!$this->_db->insert('departments', $fields)) {
			throw new Exception('There was a problem creating a department.');
		}
	}

	public function update($fields = array(), $id) {

		if(!$this->_db->update('departments', $id, $fields)) {
			throw new Exception('There was a problem updating');
		}
	}

	public function delete($fields = array()) {

		if(!$this->_db->delete('departments', $fields)) {
			throw new Exception('There was a problem deleting a department.');
		}
	}

	public function get_department_details($name){

		$data = $this->_db->get('departments', array('name', '=', $name));
	
		return $data = $data->results();
	}

	private function get_all_departments(){

		$data = $this->_db->query('SELECT * FROM departments', array(''));

		return $data = $data->results();
	}

	public function add_department_form() {
		$this->_add_department_form = '

			<form method="post" action="admin.php?page=department" name="add_department" id="reply">

				<fieldset>

				<div class="legend"><h3>Add department</h3></div>
					<table>
					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Department name</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="name" size="30" id="department_name" class="text"></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>
					
					<div class="form-row form-row-submit">
						<tr>
						<td>
						</td>
						<td>
						<div class="form-value"><input type="submit" name="add_department" class="button" value="Add department" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>
		';

		return $this->_add_department_form;
	}

	public function update_department_form($params) {
		$this->_update_department_form = '

			<form method="post" action="admin.php?page=department" name="update_department">

				<fieldset>

				<div class="legend"><h3>Update department</h3></div>
					<table>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property">Departments list</div>
						</td>
						<td>
						<div class="form-value">

						<select name="departmentlist" onChange="DoDepartmentUpdate();" id="departmentlist">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $departmentdata) {
								$this->_update_department_form .= ' <option ';if($departmentdata->name == $params['name']) {$this->_update_department_form .= 'selected="selected"';} $this->_update_department_form .= 'value="'.$departmentdata->name.'">'.$departmentdata->name.'</option>';
								}
								$this->_update_department_form .= '
						</select>
						</div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>
						
					</div>

					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Department name</div>
						</td>
						<td>
						<div class="form-value"><input type="text" name="name" class="text" size="30" id="department_name" value="'.$params['name'].'"></div>
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
						<div class="form-value"><input type="submit" value="Update department" class="button" name="update_department"/></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>


		';

		return $this->_update_department_form;
	}

	public function delete_department_form() {
		$this->_delete_department_form = '

			<form method="post" action="admin.php?page=department" name="delete_department" id="reply">

				<fieldset>

				<div class="legend"><h3>Delete department</h3></div>
					<table>


					<div class="form-row">
						<tr>
						<td>
						<div class="form-property form-required">Departments list</div>
						</td>

						<td>
						<div class="form-value">

						<select name="delete_departmentlist" id="delete_departmentlist">
							<option value="0">Select a department...</option>';
								foreach (self::get_all_departments() as $departmentdata) {
								$this->_delete_department_form .= ' <option value="'.$departmentdata->name.'">'.$departmentdata->name.'</option>';
								}
								$this->_delete_department_form .= '
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
						<div class="form-value"><input type="submit" name="delete_department" class="button" value="Delete department" /></div>
						</td>
						</tr>
						<div class="clearer">&nbsp;</div>

					</div>
				
				</table>
				</fieldset>

			</form>

	
		';

		return $this->_delete_department_form;
	}
}
