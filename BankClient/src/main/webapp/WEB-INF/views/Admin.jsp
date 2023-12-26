<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
    <jsp:attribute name="head">

        <meta charset="ISO-8859-1">
    </jsp:attribute>
    <jsp:attribute name="content">
        <a:if test="${not empty list}">
             <table  id="dtBasicExample" class="table table-striped" cellspacing="0" width="100%">
                  <tr class="table-info" style="background-color: #b7d9ed;">
                    <th scope="col">User Id</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Mail Id</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Date Of Birth</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Address</th>
                    <th colspan="2" scope="col">Status(Accept/Reject)</th>
                </tr>
                <a:forEach items="${list}" var="v">
                    <tr>
                        <td class="userid">${v.userId}</td>
                        <td>${v.firstName}</td>
                        <td>${v.lastName}</td>
                        <td>${v.mailId}</td>
                        <td>${v.phoneNo}</td>
                        <td>${v.dateOfBirth}</td>
                        <td>${v.gender}</td>
                        <td>${v.address}</td>
                        <td><input type="button" class="status1 btn btn-primary" value="Accept"></td>
                        <td><input type="button" class="status1 btn btn-primary" value="Reject"></td>
                    </tr>
                </a:forEach>
            </table>
        </a:if>
        <a:if test="${empty list}">
    	<h1 style="color:black; padding-left: 100px; font-size: 100px"> No pending records<br> found</h1>
    	 <img src="img/recordd.png" class="pp"  alt="Minimalist bank items" style="margin-top: -13%; margin-left: 60%;">
        </a:if>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

		<style>
body {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('/img/bg11.avif');
	background-size: cover;
	z-index: -2;
	background-position: bottom;
}
/* Your other custom styles */
.form-container {
	height: -50vh; /* Adjust as needed */
	width: 30%;
	margin: 100px 50px;
	padding: 30px;
	
	border-radius: 2px;
	font-family:white;
	
}

.background-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	z-index: -1; /* Position behind content */
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link
			href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
			rel="stylesheet">
		<div class="background-overlay"></div>
  <style>
  
  	body
  	{
  		background-color: #dee2e3;
  		font-family: 'Roboto', sans-serif;
  	}
  	

  </style>
    </jsp:attribute>
</m:master>
