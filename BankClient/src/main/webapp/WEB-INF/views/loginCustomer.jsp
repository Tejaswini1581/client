
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Customer login">
	<jsp:attribute name="head">

    </jsp:attribute>
	<jsp:attribute name="content">
            <button style="margin-top: 6%;" class="btn--close-modal" onclick="home();">&times;</button>
        <center>	<h2 style="color:red;">${msg}</h2></center>

        <div class="container-container">
            <form action="main" method="post">
                <div class="login-form">
               
                    <h3 class="login-header" >Have an Account?</h3> 
                    <h4 style="margin-bottom: 20px; font-size:20px;">Login here</h4>
           
                    
                       
                     
                    <label for="userId" style="margin-left: 20%;"><b>User Id</b></label>
                    <input type="text" placeholder="Enter UserId"
						name="userId" id="userId" required="required">

                    <label for="password" style="margin-left: 20%;"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password"
						name="password" id="password" required="required">
                    
                   
                    
                     <label for="showPassword" style="margin-left: 20%;">
    					<input type="checkbox" id="showPassword"> Show Password
  					</label>
  					
  					    

                    <div class="button-container">
                        <button type="submit" class="login-button"
							style="margin-left: 20%;">Login</button>
                        <!-- <button type="reset" class="reset-button"
							style="margin-right: 20%;">Reset</button> -->
                       
 
                    </div>
              	
						<p style="color: black; font-size: 20px;" class="register-link">New User <a
							href="insertCustomer">Register </a>Here
                    	</p>
            

  
                	</div>
                 
			
            	</form>
        	</div>
        
            <style>
            
            .container-container {
        margin: 0 auto; /* Center the container horizontally */
        padding: 10px; /* Add some padding */
        height:10px;
    }
    

.login-form {
	margin:0 auto;
	/* background-color: #ffffff; */
	padding: 30px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	width: 40%;
	text-align: center;
	
}
    </style>
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
    </jsp:attribute>

</m:master>