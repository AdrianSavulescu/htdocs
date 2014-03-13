<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	<script src="js/javascript.js" type="text/javascript"></script>
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
					<li><a href="voucher.php">Voucher</a></li>
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
										'required' => true
									),
									'email' => array (
										'required' => true
									),
									'department' => array (
										'required' => true
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
									'username' => array(
										'required' => true,
										'min' => 2,
										'max' => 50
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
									'name' => array(
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

							case 'PTO':
							
							echo '<div class="post-title"><h1>PTO Management</h1></div>';
							echo '<div class="post-body">';
						
							//do pto management stuff here

							$pto = new PTO;

							$action = Input::get('action');
							$value = Input::get('id');

							$pto->check_page_action($action, $value);

							echo $pto->generate_pto_management();


							echo '</div>';
							break;

							case 'OT':
							
							echo '<div class="post-title"><h1>OT Management</h1></div>';
							echo '<div class="post-body">';
						
							$ot = new OT;

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