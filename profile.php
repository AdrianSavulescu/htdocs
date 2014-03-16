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
						<h1 id="site-title">My profile</h1>
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
					<li><a href="admin.php">Administration</a></li>
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

							case 'PTO':
							
							echo '<div class="post-title"><h1>Request PTO</h1></div>';
							echo '<div class="post-body">';

							$pto = new PTO();

							$input = Input::get('request_pto');

							if($input == 'Request PTO') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
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
											'user_id' => $data->id,
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

							echo $pto->self_pto_request_form();

							echo 'My PTO requests';
							echo $pto->generate_my_pto_list($data->id);

							echo '</div>';
							break;
							
							case 'OT':
							
							echo '<div class="post-title"><h1>Add OT</h1></div>';
							echo '<div class="post-body">';
						
							$ot = new OT();

							$input = Input::get('request_ot');

							if($input == 'Request OT') {

								$validate = new Validate();
								$validation = $validate->check($_POST, array(
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
											'user_id' => $data->id,
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

							echo $ot->self_ot_request_form();

							echo 'My OT requests';
							echo $ot->generate_my_ot_list($data->id);
							
							echo '</div>';
							break;

							case 'edit':
							
							echo '<div class="post-title"><h1>Edit Profile</h1></div>';
							echo '<div class="post-body">';

							
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
										//$weekend = implode('/', Input::get('weekend'));
										
										$id = Input::get('id');

										//$admin = Input::get('admin');
									


										$user->update(array(
											'username' => Input::get('username'),
											'email' => Input::get('email')

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

							$user = new User();
							$data = $user->data();

							$data->weekend_days = explode('/', $data->weekend_days);

							echo $user->update_self_form($data);
							echo '</div>';
							break;

							default:

							echo '<div class="post-title"><h1>Profile info</h1></div>';
							echo '<div class="post-body">';

							$var = explode('/', $data->weekend_days);

							$weekend_days = null;

							foreach($var as $value) {



								switch($value){
									case '0':

										$weekend_days .= 'Monday ';

									break;
									case 1:

										$weekend_days .= 'Tuesday ';
									
									break;

									case 2:

										$weekend_days .= 'Wednesday ';

									break;

									case 3:

										$weekend_days .= 'Thursday ';

									break;

									case 4:

										$weekend_days .= 'Friday ';

									break;

									case 5:

										$weekend_days .= 'Saturday ';

									break;

									case 6:

										$weekend_days .= 'Sunday ';

									break;

								}
							}

							if ($data->department_id != '0') {

								$user_details = $user->get_user_details($data->username);

								$department = $user_details[0]->department_name;
							} else {
								$department = 'No department defined!';
							}

							if ($data->admin == 0) {

								$admin = 'No';

							} else {

								$admin = 'Yes';
							}

							echo 'Username: '. $data->username;
							echo '</br>';
							
							echo 'Email: '. $data->email;
							echo '</br>';	
							
							echo 'Department: '. $department;
							echo '</br>';

							echo 'Weekend days: '. $weekend_days;
							echo '</br>';

							echo 'Admin priviledges: '. $admin;
							echo '</br>';

							echo '</div>';
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
								<li><a href="profile.php?page=PTO">Request Paid time off</a></li>
								<li><a href="profile.php?page=OT">Add overtime</a></li>
								<li><a href="profile.php">View your profile</a></li>
								<li><a href="profile.php?page=edit">Edit your profile</a></li>
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