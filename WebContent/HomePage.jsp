<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="HomePage.css">
		<title>DueOh! Login</title>
	</head>
	<body>
	
		<div class="header">
			<table>
				<tr>
					<td><img class="logo" src="DueOh_logo.png" style="margin-top:30px;"/></td>
				</tr>
			</table>
		</div>
				
		<div class="content">
			<div class="form-content">
				
				<form method="GET" action="loginServ">
					<table>
				
						<tr>
							<td><input type="text" name="usernameText" placeholder="username"style="position:relative; font-size:20px; top:%50; left:100%; margin-top:20px; width:400px; height:30px;"></td>
						</tr>
						<tr>
							<td><input type="password" name="passwordText" placeholder="password" style="position:relative; font-size:20px; top:%50; left:100%; margin-top:20px; width:400px; height:30px;"></td>
						</tr>
						<tr>
							<td><input class="button-small grey_dark rounded3" type="submit" value="login" style="position:relative; top:%50; left:100%; margin-top:20px; display:inline-block;"></td>
							<td><input class="button-small grey_dark rounded3" type="button" onclick="javascript:window.location=/DueOh/NewAccount.jsp" value="create new account" style="position:relative; top:%50; left:100%; margin-top:20px; margin-left:42px; display:inline-block;"></td>						
						</tr>
					</table> 
				</form>
			</div>
		</div>
	</body>
</html>