<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<m:master title="Login">
	<jsp:attribute name="head">
</jsp:attribute>
	<jsp:attribute name="content">
	
	<div class=" form-container" id="msg">
	<marquee><h1>${msg }</h1></marquee>
	</div>
		<style>
body {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('/img/1211.webp');
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
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	font-family:white;
	
}
h1 {
  color: white;
}

.background-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-color: rgba(0, 0, 0, 0.4); /* Adjust opacity as needed */
	z-index: -1; /* Position behind content */
}
</style>
		<link
			href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
			rel="stylesheet">
		<div class="background-overlay"></div>
	</jsp:attribute></m:master>
