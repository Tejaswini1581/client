<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
	<jsp:attribute name="head">
	
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
	
	<center>	<h2 style="color:red;">${msg}</h2></center>
  <div class="login-form" style="height:12%"><center>
  <h2 class="login-header" ><strong>User Details</strong></h2> 
	 <table class="table table-borderless">
                    <tr><th>User Id</th><td>${v.userId }</td></tr>
                      <tr> <th>First Name</th><td>${v.firstName}</td></tr>
                       <tr> <th>Last Name</th><td>${v.lastName}</td></tr>
                        <tr><th>Email Address</th><td>${v.mailId}</td></tr>
                       <tr> <th>Phone Number</th><td>${v.phoneNo }</td></tr>
                      <tr> <th>Date Of Birth</th><td>${v.dateOfBirth}</td></tr>
                       <tr> <th>Gender</th>  <td>${v.gender}</td></tr>
                        <tr><th>Address</th><td>${v.address}</td></tr>
                       <tr><th>Account Number</th><td>${c.accountNo}</td></tr>
                       <tr><th>Account Name</th><td>${c.accountName }</td></tr>
                        <tr><th>Balance</th><td>${c.balance}</td></tr>
		</table></center>
			<input type="submit" style="background-color:#2b7199;margin-left: -170px;"  class="btn" onclick="form1()" style=" margin-top: 10px" value="Edit"/>
			
	
	<div class="d-flex justify-content-center" >
<button id="printButton" class="btn btn-primary" style=" background-color:#2b7199; margin-top: -58px">Print Form</button>
</div></div>
 <link rel="stylesheet"
			href="${pageContext.request.contextPath}/styles/login.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  
<script>
function form1() {
	window.location.href = "http://localhost:9101/editCustomer";
}
	document.getElementById("printButton").addEventListener("click",
			function() {
				// Hide the print button before printing
				document.getElementById("printButton").style.display = "none";

				// Print the form
				window.print();

				// Show the print button again after printing
				document.getElementById("printButton").style.display = "block";
			});
	
</script>

        </jsp:attribute></m:master>