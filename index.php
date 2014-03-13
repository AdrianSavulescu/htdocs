<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	<title>Romania RPM Dashboard</title>
</head>

<body id="top">
<?php 

include('core/init.php');

?>

<div id="header-wrapper">
	<div id="header-wrapper-2">
		<div class="center-wrapper">

			<div id="header">

				<div id="logo">
					<img src="images/ealogo.png" alt="logo">
				</div>

			</div>

		</div>
	</div>
</div>

<div id="navigation-wrapper">
	<div id="navigation-wrapper-2">
		<div class="center-wrapper">
	

		</div>
	</div>
</div>

<div id="content-wrapper">
	<div class="center-wrapper">
		
		<div class="content">

			<div id="main-wrapper">
				<div id="main" style="float: left;">

					<div class="post">

						<div class="post-title"><h1>Log In</h1></div>
						
						<div class="post-body">
	
							<?php

							if(Input::exists('post')) {
								if(Token::check(Input::get('token'))){
									$validate = new Validate();

									$validation = $validate->check($_POST, array(
											'email' => array('required' => true),
											'password' => array('required' => true)
										));
								}

								if($validation->passed()) {
									$user = new User();

									$remember = (Input::get('remember') === 'on') ? true : false;
									$remember;

									$login = $user->login(Input::get('email'), Input::get('password'), $remember);

									if ($login) {
										Redirect::to('profile.php');
									} else {
										echo 'Wrong Credentials';
									}
								} else {
									foreach ($validation->errors() as $error) {
										echo $error, '<br>';
									}
								}
							}


							$user = new User();
							echo $user->login_user_form();
	
							?>
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