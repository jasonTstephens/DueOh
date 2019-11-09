<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="HomePage.css">
	<meta charset="ISO-8859-1">
	<title>Details</title>
	
	<style>
						
		.button {
			background-color: #4CAF50; /* Green */
			border: none;
			color: white;
			padding: 10px 25px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 15px;
		}
						
	</style>
</head>

<body>
	<div class="header">
		<table>
			<tr>
				<td><a href="HomePage.jsp"><img class="logo" src="DueOh_logo.png"/></a></td>
			</tr>					
			
			<tr>	
				<div class="content">
					<div class="form-content">
						<form method="GET" action="newAccountServ">
							<table>

							<tr>
								<td><input type="text" name="usernameText" placeholder="username"style="position:relative; font-size:20px; top:%50; left:100%; margin-top:20px; width:400px; height:30px;"></td>
							</tr>
							
							<tr></tr>
							
							<tr>
								<td><input type="password" name="passwordText" placeholder="password" style="position:relative; font-size:20px; top:%50; left:100%; margin-top:20px; width:400px; height:30px;"></td>
							</tr>
							
							<tr>
								<td><input class="button-small grey_dark rounded3" type="submit" value="create account" style="position:relative; top:%50; left:100%; margin-top:20px; margin-left:42px; display:inline-block;"></td>						
							</tr>
							
							</table> 
						</form>
					</div>
				</div>



			</tr>
		</table>
	</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>

	var id = parseInt(window.location.search.substring(1).substring(3));
	var data = <%= session.getAttribute("data") %>;
	$("#results").html("<hr style='border-top: dotted 1px;' />");
	$("#results").append('<table><tr><td rowspan="8">&nbsp'+'<img src="'+data.items[id].volumeInfo.imageLinks.smallThumbnail+'" onclick="history.back()"/>'+'</td><td>&nbsp</td></tr>'
			+'<tr><td><h2>&nbsp'+data.items[id].volumeInfo.title+'</h2></td></tr>'
			+'<tr><td><i>Author:</i>&nbsp'+data.items[id].volumeInfo.authors+'</td></tr>'
			+'<tr><td><i>Publisher:</i>&nbsp'+data.items[id].volumeInfo.publisher+'</td></tr>'
			+'<tr><td><i>Publish Date:</i>&nbsp'+data.items[id].volumeInfo.publishedDate+'</td></tr>'
			+'<tr><td><i>ISBN:</i>&nbsp'+data.items[id].volumeInfo.industryIdentifiers[0].identifier+'</td></tr>'
			+'<tr><td><i>Summary:</i>&nbsp'+data.items[id].volumeInfo.description+'</td></tr>'
			+'<tr><td><i>Rating:</i><span id="star"></span></td></tr>'
			+'</table>');
	// Using a jQuery library for rating
	$(function () {
	  $("#star").rateYo({
	    rating: data.items[id].volumeInfo.averageRating,
	    readOnly: true
	  });
	});
</script>
</html>