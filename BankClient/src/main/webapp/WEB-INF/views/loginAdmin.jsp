<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Admin login">
	<jsp:attribute name="head">
	
</jsp:attribute>
	<jsp:attribute name="content">
            <button style="margin-top: 6%;" class="btn--close-modal" onclick="home();">&times;</button>

<center>	<h2 style="color:red;">${msg}</h2></center>
<form action="loginAdmin1" method="post">
  <div class="login-form" style="height:12%">
   <h3 class="login-header" >Admin Login</h3> 
    
    <label for="adminId" style="margin-left: 20%;"><b>AdminId</b></label>
    <input type="text" placeholder="Enter adminId" name="adminId" id="adminId" required="required" >

    <label for="password" style="margin-left: 20%;"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required="required">
        <label for="showPassword" style="margin-left: 20%;">
    					<input type="checkbox" id="showPassword"> Show Password
  					</label>
    <div class="button-container">
                        <button type="submit" class="login-button"
							style="margin-left: 20%;">Login</button>
     
                    
  </div>
                	</div>
                 
			
            	</form>




 <link rel="stylesheet"
			href="${pageContext.request.contextPath}/styles/login.css">
			<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
			
			<link
			href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
			rel="stylesheet">
			
			<script>
				// Get references to the elements
				const passwordInput = document.getElementById('password');
				const showPasswordCheckbox = document
						.getElementById('showPassword');

				// Add event listener to the checkbox
				showPasswordCheckbox.addEventListener('change', function() {
					if (this.checked) {
						// If checkbox is checked, show the password
						passwordInput.type = 'text';
					} else {
						// If checkbox is unchecked, hide the password
						passwordInput.type = 'password';
					}
				});
			</script>
		</jsp:attribute></m:master>
