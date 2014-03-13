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
						<h1 id="site-title">Schedule</h1>
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
		
		<div class="content">

			<div id="wrapper">
				<div id="main">

					<div class="post">

						<?php
							
						echo '<div class="post-title"><h1>Schedule Management</h1></div>';
						echo '<div class="post-body">';
					
						//do schedule management stuff here

						//create new instance of calendar
						$calendar = new Calendar;

						//set department in the Calendar object to the modifier's department
						
						$user_details = $user->get_user_details($data->username);
						
						$calendar->department = $user_details[0]->department_name;

						//generate calendar menu bar
						echo $calendar->generate_bar();

						$input = Input::get('remove_entry');

						if(isset($_GET['ajax'])) {

							$calendar->delete(array('id', '=', $_POST['id']));

							echo 'Success';
						}

						echo '<div><span class="remove_feedback"></span></div>';

						$params['username'] = Input::get('userlist');
						$params['shift'] = Input::get('shift');

						//add schedule entry stuff
						$input = Input::get('add_entry');

						if($input == 'Add schedule entry' AND Input::get('userlist') != 'nouser' AND Input::get('shift') != 'noshift')  {

							$validate = new Validate();
							$validation = $validate->check($_POST, array(
								'userlist' => array (
									'required' => true
								),
								'shift' => array (
									'required' => true
								),
								'from' => array (
									'required' => true
								),
								'to' => array (
									'required' => true
								)
							));

							if ($validation->passed()) {


								try {

									$from = Input::get('from');
									$to = Input::get('to');

									if (strpos($from,'/')) {
										$from = explode('/', $from);

										$from = $from[0];
									}

									if (strpos($to,'/')) {
										$to = explode('/', $to);

										$to = $to[0];
									}

									for ($x=$from; $x<=$to; $x++){


									  $params = array(
										'username' => Input::get('userlist'),
										'shift' => Input::get('shift'),
										'day' => $x,
										'month' => $calendar->current_month(),
										'year' => $calendar->current_year(),
										'department' => $user_details[0]->department_name
										);

										if(!$calendar->entry_exists($params)){

											$calendar->create(array(
											'username' => Input::get('userlist'),
											'shift' => Input::get('shift'),
											'day' => $x,
											'month' => $calendar->current_month(),
											'year' => $calendar->current_year(),
											'department' => $user_details[0]->department_name
											));

											$error = 'Success';

										} else {

											$error = 'Selection already exists in the schedule entry!';
										}

									}

									echo $error;

								} catch(Exception $e) {
									die($e->getMessage());
								}
							} else {
								foreach($validation->errors() as $error) {
									echo $error, '<br>';
								}
							}
						}
						
						echo $calendar->schedule_form($params);


						//generate calendar
						echo $calendar->generate();
						
						echo '</div>';
							
						?>

						
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