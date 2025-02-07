<!doctype html>
<html lang="en">
<head>
	<title>Unauthorized Access</title>
	<meta charset="UTF-8">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<?php require('../recaptcha.php'); ?>
	<?php
		$lang = "en";
		if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
			$lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
		}
		if(file_exists('../'.$lang.'.php')) {
			require('../'.$lang.'.php');
		}else{
			require('../en.php');
		}
	?>

<div class="container-fluid">
	<img src="data:image/png;base64,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" />
	<div class="alert alert-warning"><h2><?php echo $lang["warning"]; ?></h2></div>
	<p><?php echo $lang["contact"]; ?></p>
	<p><?php echo $lang["blocked ip"]; ?> <b><?php echo $_SERVER['REMOTE_ADDR'] ?></b></p>
	<p><?php echo $lang["hostname"]; ?> <b><?php echo php_uname('n'); ?></b></p>

	<br />
	<p><?php echo $lang["recaptcha title"]; ?></p>

	<form action="" method="POST">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="g-recaptcha" data-sitekey="<?php echo $sitekey; ?>"></div>
					</div>
					<div class="panel-footer text-center">
						<button class='btn btn-primary' type="submit" name="submit"><?php echo $lang["unblock submit"]; ?></button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<br />
	<?php
		if (!empty($_POST)) {
			$alert = '';
			$message = '';
			$pieces = explode(".", php_uname('n'));
			$date = @date('M j H:i:s'). " " . $pieces[0] . " ";
			if (isset($_POST['g-recaptcha-response']) && !empty($_POST['g-recaptcha-response'])) {
				$data = array('secret' => $secret,'response' => $_POST['g-recaptcha-response']);
				$verify = curl_init();
				curl_setopt($verify, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
				curl_setopt($verify, CURLOPT_POST, true);
				curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($data));
				curl_setopt($verify, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
				$verifyResponse = curl_exec($verify);
				$responseData = json_decode($verifyResponse);
				if($responseData->success) {
					if ($responseData->hostname == $_SERVER['SERVER_NAME']) {
						$alert = 'success';
						$message = $lang["recaptcha success"] . "<br /><a href='" . $_SERVER['REQUEST_URI'] . "'>" . $_SERVER['REQUEST_URI'] . "</a>";
						file_put_contents($unblockfile, $_SERVER['REMOTE_ADDR'].";".$_SERVER['SERVER_NAME'].";".$_SERVER['SERVER_ADDR']."\n", FILE_APPEND | LOCK_EX);
						file_put_contents($logfile,$date . "*Success*, ReCaptcha (" . $_SERVER['REMOTE_ADDR'].": [".$_SERVER['SERVER_NAME']." (".$_SERVER['SERVER_ADDR'].")] requested unblock\n", FILE_APPEND | LOCK_EX);
					} else {
						$alert = "danger";
						$message = $lang["recaptcha hostfail"] . ' ['.$responseData->hostname.' != '.$_SERVER['SERVER_NAME'].']';
						file_put_contents($logfile,$date . "*Failed*, ReCaptcha (" . $_SERVER['REMOTE_ADDR'].": [".$_SERVER['SERVER_NAME']." (".$_SERVER['SERVER_ADDR'].")] does not appear to be hosted on this server\n", FILE_APPEND | LOCK_EX);
					}
				} else {
					$alert = "danger";
					$message = $lang["recaptcha failure"];
					file_put_contents($logfile,$date . "*Error*, ReCaptcha (" . $_SERVER['REMOTE_ADDR'].": $responseData\n", FILE_APPEND | LOCK_EX);
				}
			} else {
				$alert = "danger";
				$message = $lang["recaptcha error"];
			}
			echo '<div class="alert alert-' . $alert . '"><h4>' . $message . '</h4></div>';
		}
	?>

	<div class="alert alert-info"><?php echo $lang["recaptcha note"]; ?></div>
</div>
</body>
</html>
