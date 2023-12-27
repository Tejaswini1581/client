<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Withdraw">
    <jsp:attribute name="head">
</jsp:attribute>
    <jsp:attribute name="content">
    <button class="btn--close-modal" style="margin-top: 6%;" onclick="main();">&times;</button>
<center>	<h2 style="color:green;">${msg}</h2></center>
<center>	<h2 style="color:red;">${err}</h2></center>
    <div style="margin-top:3%" class="form-container">
<f:form action = "withdraw1" modelAttribute= "C">
            <div class="form-header">
            <h2 >Withdraw From Account</h2>
            <p>Please enter the below details.</p>
            </div>
<table>
            <tr>
                <th><label for="amount">Amount</label></th>
                <td><f:input path="amount" onblur="return checkk();" required="required" placeholder="Enter a number"/></td>
                <td class="error"><f:errors path="amount" /></td>
            </tr>
            <tr>
                    <th><label for="remarks">Remarks</label></th>
                    <td><input type="text" name="remark" ></td>
                </tr>
  <tr>
                    <td></td>
                   <td><input type="submit" value="Submit"></td>
            </tr>
</table>
</f:form></div>
    	<script>
	function checkk() {
		var input=document.getElementById("amount").value;
		if(!isNaN(parseFloat(input)) && isFinite(input))
			return true;
		else
			{
			document.getElementById("amount").value="";
				return false;
			}
}
	</script>
        
<style>
body, div, table, tr, td, input {
	margin: 0;
	padding: 0;
	border: none;
}

body {
	font-family: Arial, sans-serif; /* Set a fallback font */
	color: #333; /* Set a default text color */
}

/* Basic styling for the form container */
.form-container {
	width: 40%;
	height: 500px;
	margin: 200px auto;
	padding: 30px;
	border: 1px solid #ccc;
	border-radius: 2px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

.form-header {
	text-align: center;
	padding: 15px;
	margin-bottom: 50px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: #400080;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
	 background: linear-gradient(to bottom, lavender, lightblue); 
}
h2
{
	font-size: 20px;
}


p
{
	font-size: 11px;
	color:#000;
}


/* Styling for the table */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 50px;
}

/* Styling for table cells */
td {
	padding: 20px;
	font-weight: 30px;
}

th {
	font-weight: bold;
	font-size: 20px;
	color: #400040 #400040;
}

th label {
	font-weight: bold;
	font-size: 15px;
	display: block;
	margin: 0 0 0 100px;
}

/* Styling for form inputs */
input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

/* Styling for submit button */
input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-size: 15px;
	transition: background-color 0.3s, color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3; /* New background color on hover */
	color: #e6e6e6; /* New text color on hover */
}

/* Error messages styling */
.error {
	color: #d9534f;
	font-size: 15px;
}
</style>
        </jsp:attribute></m:master>