<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="jquery-3.4.1.min.js"></script> -->
<script type="text/javascript">
	$(document).ready(function() {

		$("#search-form").submit(function(event) {

			event.preventDefault();
			fire_ajax_submit();
		});
	});

	function fire_ajax_submit() {

		var search = {}
		view();

		search["name"] = $("#name").val();
		search["username"] = $("#username").val();

		search["password"] = $("#password").val();
		search["email"] = $("#email").val();
		search["mobile"] = $("#mobile").val();
		search["status"] = $("#status").val();

		$.ajax({

			type : "POST",
			contentType : "application/json",
			url : "http://localhost:8089/user/add",
			data : JSON.stringify(search),
			dataType : 'json',

			timeout : 600000,

			success : function(search) {
				alert("Success");

				view();

				$('#result').html(
						search.id + " " + search.name + " " + search.username
								+ " " + search.password + " " + search.email
								+ " " + search.mobile + " " + search.status);

			},
			error : function(e) {
				alert("error");
			}
		});
	}

	function view() {
		alert("view");

		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "http://localhost:8089/user/list",
			dataType : 'json',
			success : function(search) {
				alert("Success");

				var tableBody = $('#tblEmployee tbody');
				tableBody.empty();

				$(search).each(
						function(index, search) {
							tableBody.append('<tr><td>' + search.id
									+ '</td><td>' + search.name + '</td><td>'
									+ search.username + '</td><td>'
									+ search.password + '</td><td>'
									+ search.email + '</td><td>'
									+ search.mobile + '</td><td>'
									+ search.status + '</td>');
						})

			},
			error : function(e) {
				alert("error");
			}

		});
	}
</script>
</head>
<body>

	<form method="POST" id="search-form">
		name : <input id="name" type="text" name="name" /><br> username
		: <input type="text" id="username" name="username" /> <br>
		password : <input type="text" id="password" name="password" /> <br>
		email : <input type="text" id="email" name="email" /> <br>
		mobile : <input type="text" id="mobile" name="mobile" /> <br>
		status : <input type="text" id="status" name="status" /> <br> <input
			type="submit" id="button" value="create" />
	</form>
	<div id="result"></div>

	 <input type="submit" id="button1" value="view users" onclick="view()" />
	<table id="tblEmployee" border="1" style="border-collapse: collapse">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Username</th>
				<th>Password</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Status</th>

			</tr>
		</thead>
		<tbody></tbody>
	</table>


</body>
</html>
