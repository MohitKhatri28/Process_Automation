<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Homepage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body>
		<nav class="nav">
			<div class="container">
				<div class="logo">
					<a href="#"><img src="images/logo_trans.png" width="40%" height=auto /></a>
				</div>
				<div id="mainListDiv" class="main_list">
					<ul class="navlinks">
						<li><a href="#">About</a></li>
					</ul>
				</div>
				<!-- <span class="navTrigger">
					<i></i>
					<i></i>
					<i></i>
				</span> -->
			</div>
		</nav>
	<section class="ftco-section">
		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>Welcome to login</h2>
								<p>Don't have an account?</p>
								<a href="registration.jsp" class="btn btn-white btn-outline-white">Sign Up</a>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign In</h3>
			      		</div>		
			      	</div>
			      	<form action="<%= request.getContextPath() %>/login" method="POST"class="signin-form">
			      	<label for="signin">Sign in as:</label>
					  <select name="who" id="signin">
						<option value="1">Student</option>
						<option value="2">Teacher</option>
						<option value="3">Admin</option>
					  </select>
						
			      		<div class="form-group mb-3">
			      			<label class="label">Username</label>
			      			<input type="text" class="form-control" name="username" placeholder="Username" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="label">Password</label>
		              <input type="password" class="form-control" name="password"placeholder="Password" required>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
		            </div>
		            
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  	<script src="js/popper.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  	<script src="js/main.js"></script>

	</body>
</html>

