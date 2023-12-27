<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
    <jsp:attribute name="head">
	
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="modal" style="width:40%">
            <button class="btn--close-modal" onclick="home();">&times;</button>
            <h2 class="modal__header">
                Open your bank account <br> in just <span class="highlight">5 minutes</span>
            </h2>
            <f:form action="insertCustomer1" modelAttribute="C" class="modal__form"><table>
            
            
                        <f:input path="userId" type="hidden" value="U10001"/>
                        
                        <tr class="error-list"><td><label>First Name</label></td><td> 
                        <f:input path="firstName"  required="true" /></td><td>
                        <f:errors class="ee"  path="firstName" /></td></tr>
                        
                        <tr class="error-list"><td><label>Last Name</label></td><td>
                        <f:input path="lastName"  required="true" /></td><td>
                        <f:errors class="ee"  path="lastName"/></td></tr>

                        <tr class="error-list"><td><label>Email Address</label></td><td> 
                        <f:input path="mailId" class="emailID" required="true" /></td><td>
                        <f:errors class="ee"  path="mailId"/></td></tr>

                        <tr class="error-list"><td><label>Phone Number</label></td><td> 
                        <f:input path="phoneNo" class="phoneNum"  required="true" /></td><td>
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

        <tr><td></td><td><button type="submit" class="btn">Register &rarr;</button> </td></tr>
          </table>  </f:form>
        </div>	
        <p>${msg }</p>
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
            
        </script>
        
        
        <style>
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
            .modal {
             overflow: hidden;
              height: auto;
  margin-top: 30rem;
  position: relative;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #f3f3f3;
  padding: 5rem 6rem 1rem;
  box-shadow: 0 4rem 6rem rgba(0, 0, 0, 0.3);
  z-index: 1000;
  transition: all 0.5s;
}

.modal__header {
  font-size: 3.25rem;
  margin-bottom: 4.5rem;
  line-height: 1.5;
}

.modal__form {
  margin: 0 3rem;
  display: grid;
  grid-template-columns: 1fr 0fr;
  align-items: center;
  gap: 2.5rem;
}

.modal__form label {
  font-size: 1.7rem;
  font-weight: 500;
}

.modal__form input {
  font-size: 1.7rem;
  padding: 1rem 1.5rem;
  border: 1px solid #ddd;
  border-radius: 0.5rem;
}

.modal__form button {
  grid-column: 1 / span 2;
  justify-self: center;
  margin-top: 1rem;
}
.modal__form select {
  font-size: 2rem;
  font-weight: 500;
}

.btn--close-modal {
  font-family: inherit;
  color: inherit;
  position: absolute;
  top: 0.5rem;
  right: 2rem;
  font-size: 4rem;
  cursor: pointer;
  border: none;
  background: none;
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
    </jsp:attribute>
</m:master>
