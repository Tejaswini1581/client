<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Withdraw">
	<jsp:attribute name="head">
    	
</jsp:attribute>
	<jsp:attribute name="content">
    <button class="btn--close-modal" style="margin-top: 6%;" onclick="main();">&times;</button>
         
    <div class=" form-container">
    <h1>Your balance is <a:out value="${b}"></a:out> </h1>
    </div>
           <img src="${pageContext.request.contextPath}/img/Picture1.png" alt="prospera bank" style="margin-top: -30%; margin-left: 50%;" >
 <style>
body {

	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
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
	border: 1px solid #ccc;
	border-radius: 2px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
	font-family:white;
	
}
h1 {
  color: black;
}
/* .background-image-login {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('/images/coverpage.png');
	background-size: cover;
	z-index: -2;
	background-position: right bottom;
} */

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
    <div class="background-overlay"></div>
        </jsp:attribute></m:master>