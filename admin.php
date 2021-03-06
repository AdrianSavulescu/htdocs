<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.10.4.custom.min.css" media="screen" />
	<script src="/js/jquery-1.11.0.min.js"></script>
	<script src="/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	<script src="/js/javascript.js" type="text/javascript"></script>
	<title>Romania RPM Dashboard</title>
</head>

<body id="top">

<?php 

include('core/init.php');

$user = new User();

if($user->isLoggedIn()) {
	$data = $user->data();
} else {
	Redirect::to('index.php');
}


?>
<div id="header-wrapper">
	<div id="header-wrapper-2">
		<div class="center-wrapper">

			<div id="header">
				<div id="header_wrapper">

					<div id="header_logo">
						<div id="logo">
						<img src="images/ealogo.png" alt="logo">
						</div>
					</div>
					
					<div id="header_description">
						<h1 id="site-title"><a href="#"><span>RPM</span> Dashboard</h></a>
						<h2 id="site-slogan">RPM FTW</h2>
					</div>

					<div id="header_page_name">
						<h1 id="site-title">Administration</h1>
					</div>

					<div id="header_user_details">
						<h5 id="header_username">Hello <?php echo escape($data->username); ?> !</h5>
						<h5 id="header_profile"><a href="profile.php">My profile</a></h5>
						<h6 id="header_profile"><a href="logout.php">Log Out!</a></h6>
					</div>

				</div>

			</div>

		</div>
	</div>
</div>

<div id="navigation-wrapper">
	<div id="navigation-wrapper-2">
		<div class="center-wrapper">
	
			<div id="navigation">

				<ul class="tabbed">
					<li><a href="schedule.php">Schedule</a></li>
					<li class="current_page_item"><a href="admin.php">Administration</a></li>
				</ul>

				<div class="clearer">&nbsp;</div>

			</div>

		</div>
	</div>
</div>

<div id="content-wrapper">
	<div class="center-wrapper">
		
		<div class="content" id="content-two-columns">

			<div id="main-wrapper">
				<div id="main">

					<div class="post">

						<?php

						$page = Input::get('page');

						switch ($page) {

							case 'user':
							
							echo '<div class="post-title"><h1>User Administration</h1></div>';
							echo '<div class="post-body">';

							$user = new User();


							//add user stuff
							$input = Input::get('add_user');

							if($input == 'Add user') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'username' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'email' => array (
										'required' => true,
										'email' => true,
										'min' => '2',
										'max' => '30'
									),
									'department' => array (
										'required' => true
									),
									'color' => array (
										'color' => true
									)
								));

								if ($validation->passed()) {


									try {


										if (Input::get('admin') == 'on') {$admin = 1;} else {$admin = 0;}
										if(!empty(Input::get('weekend'))) {$weekend = implode('/', Input::get('weekend'));} else {$weekend = '';}
									
										$user->create(array(
											'username' => Input::get('username'),
											'email' => Input::get('email'),
											'weekend_days' => $weekend,
											'department_id' => Input::get('department'),
											'admin' => $admin,
											'color' => Input::get('color')

										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}
							echo $user->add_user_form();
						

							//edit user stuff
							$params = array();
							$params['user'] = '0';
							$params['username'] = '';
							$params['email'] = '';
							$params['weekend'] = array();
							$params['department_id'] = 0;
							$params['admin'] = 0;
							$params['id'] = 0;
							$params['color'] = '#000000';
								
							

							if (!empty(Input::get('userlist')) AND Input::get('userlist') != '0' AND Input::get('update_user') != 'Update user' AND Input::get('update_user') != 'Delete user') {

								$temp = $user->get_user_details(Input::get('userlist'));

								$params['user'] = $temp[0]->username;
								$params['username'] = $temp[0]->username;
								$params['email'] = $temp[0]->email;
								$params['weekend'] = explode('/', $temp[0]->weekend_days);
								$params['department_id'] = $temp[0]->department_id;
								$params['admin'] = $temp[0]->admin;
								$params['id'] = $temp[0]->id;
								$params['color'] = $temp[0]->color;

							}

							$input = Input::get('update_user');

							if($input == 'Update user') {


								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'username' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'email' => array (
										'required' => true,
										'email' => true,
										'min' => '2',
										'max' => '30'
									),
									'department' => array (
										'required' => true
									),
									'color' => array (
										'color' => true
									)
								));

								if($validation->passed()) {

									try {
										
										if (Input::get('admin') == 'on') {$admin = 1;} else {$admin = 0;}
										if(!empty(Input::get('weekend'))) {$weekend = implode('/', Input::get('weekend'));} else {$weekend = '';}
										
										$id = Input::get('id');

										$user->update(array(
											'username' => Input::get('username'),
											'email' => Input::get('email'),
											'weekend_days' => $weekend,
											'department_id' => Input::get('department'),
											'admin' => $admin,
											'color' => Input::get('color')

										), 	$id);

										echo 'Success';

									} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}

							}

							echo $user->update_user_form($params);

							//delete user stuff
							
							$input = Input::get('delete_user');

							if($input == 'Delete user') {


								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'delete_userlist' => array(
										'required' => true
									)
								));

								if($validation->passed()) {

									try {

										$user->delete(array('username', '=', Input::get('delete_userlist')));

											echo 'Success';

										} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}

							echo $user->delete_user_form();

							echo '</div>';
							break;

							case 'shift':
							
							echo '<div class="post-title"><h1>Shift Administration</h1></div>';
							echo '<div class="post-body">';

							$shift = new Shift();


							//add shift stuff
							$input = Input::get('add_shift');

							if($input == 'Add shift') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'name' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'description' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'department' => array (
										'required' => true
									)
								));

								if ($validation->passed()) {


									try {

										
										$shift->create(array(
											'name' => Input::get('name'),
											'description' => Input::get('description'),
											'department_id' => Input::get('department')
										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}
							echo $shift->add_shift_form();
						

							//edit shift stuff
							$params = array();
							$params['name'] = '';
							$params['description'] = '';
							$params['department_id'] = '0';
							$params['id'] = 0;
								
							
							if (!empty(Input::get('shiftlist')) AND Input::get('shiftlist') != '0' AND Input::get('update_shift') != 'Update shift' AND Input::get('update_shift') != 'Delete shift') {

								$temp = $shift->get_shift_details(Input::get('shiftlist'));

								$params['name'] = $temp[0]->name;
								$params['description'] = $temp[0]->description;
								$params['department_id'] = $temp[0]->department_id;
								$params['id'] = $temp[0]->id;

							}

							$input = Input::get('update_shift');

							if($input == 'Update shift') {


								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'name' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'description' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									),
									'department' => array (
										'required' => true
									)
								));

								if($validation->passed()) {

									try {
										

										$id = Input::get('id');

										$shift->update(array(
											'name' => Input::get('name'),
											'description' => Input::get('description'),
											'department_id' => Input::get('department')

										), 	$id);

										echo 'Success';

									} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}

							}

							echo $shift->update_shift_form($params);

							//delete shift stuff
							
							$input = Input::get('delete_shift');

							if($input == 'Delete shift') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'delete_shiftlist' => array(
										'required' => true
									)
								));

								if($validation->passed()) {

									try {

										$shift->delete(array('name', '=', Input::get('delete_shiftlist')));

											echo 'Success';

										} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}

							echo $shift->delete_shift_form();

							echo '</div>';
							break;

							case 'department':
							
							echo '<div class="post-title"><h1>Departments Administration</h1></div>';
							echo '<div class="post-body">';
						
							//do department management stuff here

							$department = new Department();


							//add department stuff
							$input = Input::get('add_department');

							if($input == 'Add department') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'name' => array (
										'required' => true,
										'min' => '2',
										'max' => '15'
									)
								));

								if ($validation->passed()) {


									try {

										
										$department->create(array(
											'name' => Input::get('name')
										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}
							echo $department->add_department_form();
						

							//edit department stuff
							$params = array();
							$params['name'] = '';
							$params['id'] = 0;
								
							
							if (!empty(Input::get('departmentlist')) AND Input::get('departmentlist') != '0' AND Input::get('update_department') != 'Update department' AND Input::get('update_department') != 'Delete department') {

								$temp = $department->get_department_details(Input::get('departmentlist'));

								$params['name'] = $temp[0]->name;
								$params['id'] = $temp[0]->id;

							}

							$input = Input::get('update_department');

							if($input == 'Update department') {


								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'name' => array (
										'required' => true,
										'min' => '2',
										'max' => '15'
									)
								));

								if($validation->passed()) {

									try {
										

										$id = Input::get('id');

										$department->update(array(
											'name' => Input::get('name')
										), 	$id);

										echo 'Success';

									} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}

							}

							echo $department->update_department_form($params);

							//delete department stuff
							
							$input = Input::get('delete_department');

							if($input == 'Delete department') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'delete_departmentlist' => array(
										'required' => true
									)
								));

								if($validation->passed()) {

									try {

										$department->delete(array('name', '=', Input::get('delete_departmentlist')));

											echo 'Success';

										} catch (Exception $e) {
										die($e->getMessage());
									}
									
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}

							echo $department->delete_department_form();


							echo '</div>';
							break;

							case 'voucher':
							
							echo '<div class="post-title"><h1>Vouchers Management</h1></div>';
							echo '<div class="post-body">';
						
							//do voucher management stuff here

							$voucher = new Voucher;

							$action = Input::get('action');
							$value = Input::get('id');

							$voucher->check_page_action($action, $value);

							$user_details = $voucher->get_user_details($data->username);
						
							$voucher->department =  $user_details[0]->department_name;


							$params['user_id'] = Input::get('userlist');
							$params['key'] = Input::get('key');


							//add voucher entry stuff
							$input = Input::get('add_entry');

							if($input == 'Add voucher entry')  {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'userlist' => array (
										'required' => true,
									),
									'key' => array (
										'required' => true,
										'min' => '3',
										'max' => '5'
									),
									'number' => array (
										'required' => true,
										'min' => '5',
										'max' => '10'
									)
								));

								if ($validation->passed()) {


									try {

										$voucher->create(array(
											'user_id' => Input::get('userlist'),
											'key' => Input::get('key'),
											'number' => Input::get('number'),
											'returned' => 'No',
											'sent' => 'No'
										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}
							


							echo $voucher->form($params);
							
							echo 'Given vouchers:';
							
							echo $voucher->generate_voucher_management();

							echo '</div>';
							break;


							case 'PTO':
							
							echo '<div class="post-title"><h1>PTO Management</h1></div>';
							echo '<div class="post-body">';
						
							//do pto management stuff here

							$pto = new PTO;

							$user_details = $user->get_user_details($data->username);
						
							$pto->department = $user_details[0]->department_name;

							$params['user_id'] = Input::get('userlist');

							$input = Input::get('request_pto');

							if($input == 'Request PTO') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'userlist' => array(
										'required' => true
									),
									'first_pto' => array (
										'required' => true,
										'date' => true,
										'lower' =>  Input::get('last_pto')
									),
									'last_pto' => array (
										'required' => true,
										'date' => true
									),
									'pto_description' => array (
										'required' => true,
										'min' => '3',
										'max' => '30'
									)
								));

								if ($validation->passed()) {


									try {

										$pto->request(array(
											'user_id' => Input::get('userlist'),
											'date_from' => Input::get('first_pto'),
											'date_to' => Input::get('last_pto'),
											'description' => Input::get('pto_description'),
											'status' => 'Pending'
										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}

							echo $pto->pto_request_form($params);


							$action = Input::get('action');
							$value = Input::get('id');

							$pto->check_page_action($action, $value);

							echo 'All PTO requests';
							echo $pto->generate_pto_management();


							echo '</div>';
							break;

							case 'OT':
							
							echo '<div class="post-title"><h1>OT Management</h1></div>';
							echo '<div class="post-body">';
						
							$ot = new OT;

							$user_details = $user->get_user_details($data->username);
						
							$ot->department = $user_details[0]->department_name;

							$params['user_id'] = Input::get('userlist');

							$input = Input::get('request_ot');

							if($input == 'Request OT') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
									'userlist' => array (
										'required' => true
									),
									'date' => array (
										'required' => true,
										'date' => true
									),
									'hours' => array (
										'required' => true,
										'min' => '1',
										'max' => '20'
									),
									'description' => array (
										'required' => true,
										'min' => '2',
										'max' => '30'
									)
								));

								if ($validation->passed()) {


									try {

										$ot->request(array(
											'user_id' => Input::get('userlist'),
											'date' => Input::get('date'),
											'hours' => Input::get('hours'),
											'description' => Input::get('description'),
											'status' => 'Pending'
										));

										echo 'Success';

									} catch(Exception $e) {
										die($e->getMessage());
									}
								} else {
									foreach($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}

							echo $ot->ot_request_form($params);

							$action = Input::get('action');
							$value = Input::get('id');

							$ot->check_page_action($action, $value);

							echo $ot->generate_ot_management();

							
							echo '</div>';
							break;

							case 'payroll':
							
							echo '<div class="post-title"><h1>Payroll Management</h1></div>';
							echo '<div class="post-body">';
						
							//do payroll management stuff here
							
							echo '</div>';
							break;

							default:

							Redirect::to('admin.php?page=user');
							
							break;
						}

							?>
						
					</div>

				</div>
			</div>

			<div id="sidebar-wrapper">
				<div id="sidebar">

					<div class="box">

						<div class="box-content">
							<ul class="nice-list">
								<li><a href="admin.php?page=user">User administration</a></li>
								<li><a href="admin.php?page=shift">Shifts administration</a></li>
								<li><a href="admin.php?page=department">Departments administration</a></li>
								<li><a href="admin.php?page=voucher">Vouchers administration</a></li>
								<li><a href="admin.php?page=PTO">PTO Management</a></li>
								<li><a href="admin.php?page=OT">OT Management</a></li>
								<li><a href="schedule_management.php">Schedule Management</a></li>
								<li><a href="admin.php?page=payroll">Payroll Management</a></li>
							</ul>
						</div>

					</div>

				</div>
			</div>

			<div class="clearer">&nbsp;</div>

		</div>

	</div>
</div>

<div id="footer-wrapper">

	<div class="center-wrapper">

		<div id="footer">

			<div class="left">
				<a href="#">Shift</a> <span class="text-separator">|</span> 
				<a href="#">Helpdesk</a> <span class="text-separator">|</span> 
				<a href="#">Confluence</a> 
			</div>

			<div class="right">
				<a href="#">Top ^</a>
			</div>
			
			<div class="clearer">&nbsp;</div>

		</div>

	</div>

</div>

<div id="bottom">

	<div class="center-wrapper">

		<div class="left">
			&copy; 2014 RPM - All material is confidential
		</div>

		<div class="right">
			Website by Savulescu Adrian
		</div>
		
		<div class="clearer">&nbsp;</div>

	</div>

</div>

</body>
</html>