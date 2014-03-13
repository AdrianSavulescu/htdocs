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
						<h1 id="site-title">Voucher</h1>
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
					<li class="current_page_item"><a href="voucher.php">Voucher</a></li>
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

						<div class="post-title"><h1>Title</h1></div>
						
						<div class="post-body">

							Body text
						
						</div>
						
					</div>

				</div>
			</div>

			<div id="sidebar-wrapper">
				<div id="sidebar">

					<div class="box">

						<div class="box-content">
							<ul class="nice-list">
								<li><a href="#">Button</a></li>
								<li><a href="#">Button</a></li>
								<li><a href="#">Button</a></li>
								<li><a href="#">Button</a></li>
								<li><a href="#">Button</a></li>
								<li><a href="#">Button</a></li>
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