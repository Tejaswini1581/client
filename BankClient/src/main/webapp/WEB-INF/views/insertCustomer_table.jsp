<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
	
	</jsp:attribute>
	<jsp:attribute name="content">
	
		<div class="modal">
		<button class="btn--close-modal" onclick="home();">&times;</button>
		<h2 class="modal__header">
			Open your bank account <br> in just <span class="highlight">5
				minutes</span>
		</h2><table>
		<f:form action="insertCustomer1" modelAttribute="C" class="modal__form">
			<tr><td><label>User Id</label></td><td>
			 <f:input path="userId" required="true" /></td><td></td><td>
			 <f:errors path="userId" /></td>
			 
			<tr><td> <label>First Name</label></td><td> 
			 <f:input path="firstName"  required="true" /></td><td></td><td>
			 <f:errors path="firstName" /></td>
			 
			 
			<tr><td> <label>Last Name</label></td><td>
			  <f:input path="lastName"  required="true" /></td><td></td><td>
			  <f:errors path="lastName"/></td>
			<tr><td> <label>Email Address</label></td><td> 
			 <f:input path="mailId"  required="true" /></td><td></td><td>
			 <f:errors path="mailId"/></td>
			<tr><td> <label>Phone Number</label></td><td> 
			 <f:input path="phoneNo" required="true"  /></td><td></td><td>
			 <f:errors path="phoneNo" /></td>
			<tr><td><label>Date Of Birth</label></td><td> 
			<f:input path="dateOfBirth"  required="true"  type="Date"/></td><td></td><td>
			<f:errors path="dateOfBirth"  /></td>
			<tr><td> <label>Gender</label></td><td>
			  <f:select path="gender" required="true" >
						<f:option value="">select</f:option>
						<f:option value="Male" />
						<f:option value="Female" />
						<f:option value="Transgender" />
						<f:option value="Others" />
					</f:select></td><td></td><td>
					<f:errors path="gender"/></td>
			 <tr><td><label for="password">Password</label></td><td>
			<div class="password-input-container">
			<f:input type="password" path="password" class="password-input"
			 placeholder="Enter your password" required="true" /></td><td></td><td>
			<f:errors path="password" /></td>
				 <span class="password-toggle" id="password-toggle"> 
				 <i class="fas fa-eye"></i>
				</span>
			</div>
			<tr><td><label>Address</label></td><td>
			<f:input path="address"  required="true" /></td><td></td><td>
			<f:errors path="address" /></td></tr>  </table>
			<button type="submit" class="btn">Register &rarr;</button>
		</f:form>
	</div>	
	<p>${msg }</p>
	<style>
	
	</style>
	</jsp:attribute></m:master>