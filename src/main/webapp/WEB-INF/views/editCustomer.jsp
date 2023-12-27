<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
	
	</jsp:attribute>
	<jsp:attribute name="content">
	
	<div class="example">
		<div class="modal hidden" style="width:40%; margin: 30 auto; ">
		<button class="btn--close-modal" onclick="profile();">&times;</button>
		
	<h2 style="margin-left:7%" class="modal__header"> Update your  <span class="highlight">Profile</span> here
		</h2>
		<f:form action="updateCustomer" modelAttribute="c" class="modal__form"><table>
                      <tr class="error-list"><td><label>User Id</label></td><td>
                        <f:input path="userId" readonly="true" value="${c.userId }"/></td><td>
                       </td>
                     </tr>
                        
                        <tr class="error-list"><td><label>First Name</label></td><td> 
                        <f:input path="firstName"  required="true" /></td><td>
                        <f:errors class="ee"  path="firstName" /></td></tr>
                        
                        <tr class="error-list"><td><label>Last Name</label></td><td>
                        <f:input path="lastName"  required="true" /></td><td>
                        <f:errors class="ee"  path="lastName" /></td></tr>

                        <tr class="error-list"><td><label>Email Address</label></td><td> 
                        <f:input path="mailId" class="emailID"  required="true" /></td><td>
                        <f:errors class="ee"  path="mailId"/></td></tr>

                        <tr class="error-list"><td><label>Phone Number</label></td><td> 
                        <f:input path="phoneNo"  class="phoneNum"  required="true" /></td><td>
                        <f:errors class="ee"  path="phoneNo" /></td></tr>

                        <tr class="error-list"><td><label>Date Of Birth</label></td><td> 
                        <f:input path="dateOfBirth"  required="true"  type="Date"/></td><td>
                        <f:errors class="ee"  path="dateOfBirth"  /></td></tr>

                        <tr class="error-list"><td><label>Gender</label></td><td>
                        <f:select path="gender" required="true" >
                            <f:option value="">select</f:option>
                            <f:option value="Male" />
                            <f:option value="Female" />
                            <f:option value="Transgender" />
                            <f:option value="Others" />
                        </f:select></td><td>
                        <f:errors class="ee"  path="gender"/></td></tr>

                        <tr class="error-list"><td><label for="password">Password</label></td><td>
                        <div class="password-input-container">
                            <f:input type="password" path="password" class="password-input" placeholder="Enter your password" required="true" /></td><td>
                            <f:errors class="ee"  path="password" /></td></tr>
                            <span class="password-toggle" id="password-toggle"> 
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>

                        <tr class="error-list"><td><label>Address</label></td><td>
                        <f:input path="address"  required="true" /></td><td>
                        <f:errors class="ee"  path="address" /></td></tr>

        <tr><td></td><td><button type="submit" class="btn">Confirm &rarr;</button> </td></tr>
          </table>
		</f:form>
	</div>	
	</div>
	<div class="overlay hidden"></div>
	<p>${msg }</p><style>
            .error-list {
                list-style: none;
                padding: 0;
            }
            .error-list li {
                margin-bottom: 10px;
            }
            .ee{
            color:red;
            font-size: 13px;
            font-weight: 400;
            }
            .btn {
  display: inline-block;
  background-color: #B19CD9; /* Change this to your desired background color */
  font-size: 1.6rem;
  font-family: inherit;
  font-weight: 500;
  border: none;
  align-self:center;
  border-radius: 10rem;
  cursor: pointer;
  transition: all 0.3s;
  color: white; /* Text color */
}
            
        </style>
        <script>

        $(document).ready(function() {
    		

            $(".emailID").blur(function() {
               var a=$("#mailId").val();
       		$.ajax({
       			type : "GET",
       			url : "http://localhost:9100/getCustomerByMailId/" + a,
       			dataType : "text",
       			async : false,
       			contentType : "application/json;charset=utf-8",
       			success : function(data) {
       				alert("Mail ID already in use")
       				$("#mailId").val("");
       			},
       			error : function(x, err) {
       				//it is new mail id
       				//alert("readyState " + x.readyState);
       				//alert("responseText " + x.responseText);
       			}
       		});//end of ajax
           	});//end of accept  
           	

            $(".phoneNum").blur(function() {
               var a=$("#phoneNo").val();
       		$.ajax({
       			type : "GET",
       			url : "http://localhost:9100/getCustomerByPhoneNo/" + a,
       			dataType : "text",
       			async : false,
       			contentType : "application/json;charset=utf-8",
       			success : function(data) {
       				alert("phone number already in use")
       				$("#phoneNo").val("");
       			},
       			error : function(x, err) {
       				//it is new mail id
       				//alert("readyState " + x.readyState);
       				//alert("responseText " + x.responseText);
       			}
       		});//end of ajax
           	});//end of accept  
       	});//end of doc

        function profile() {
        	window.location.href = "http://localhost:9101/profile";
        }
        </script>
	</jsp:attribute></m:master>