<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Transfer">
    <jsp:attribute name="head">
    <meta charset="UTF-8">
    <title>Bank Selection</title>
    
      
</jsp:attribute>
    <jsp:attribute name="content">
 <center>	<h2 style="color:green;">${done}</h2></center>
 <center>	<h2 style="color:red;">${msg}</h2></center>
  
    <div style="margin-top:3%" class="form-container">
		<button class="btn--close-modal" onclick="main();">&times;</button>
    <div class="container"  style="margin-top:2%">
        <h2>Select a Bank</h2>
        <h3>Transfer Type:</h3>
        <div class="radio-group">
          <label for="sameBank">
               <input type="radio" id="sameBank" name="bankType" value="sameBank">
                Same Bank
            </label>
        </div>
        <div class="radio-group">
           <label for="otherBank">
                <input type="radio" id="otherBank" name="bankType" value="otherBank">
                Other Bank
            </label>
        </div>
   </div>   
    <div id="bankFormContainer"></div>
    <!-- Template for the Same Bank Form -->
    <div id="sameBankForm" style="display: none; " >   
        <f:form action = "transfer1" modelAttribute= "C">
                             <h3 style="color: #004d00;">Transfer To The Same Bank  </h3>
            <table>
                <tr>
                    <!-- Your form fields for the same bank -->
                    <td><label for="destinationAccountName"> Account
                            Holder Name:</label></td>
                    <td>
                    
                    <f:input path="destinationAccountName" type="text" required="required" class="Acc"/>
                   
                    </td>
            
                   <!--  <input type="text" id="destinationAccountName"
                        name="destinationAccountName"> --> <!-- 
                     <td>   <div class="error">Account holder doesn't exist</div></td> -->
                </tr>
              <%--    <tr>
                    <td><label for="account_No"> Account No:</label></td>
                    <td><f:input type="text" id="account_No" name="account_No" required="required"/><br></td>
                </tr> --%>
                 <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td>
                    
                    <select type="text" id="account_ID" name="account_ID"
                        required="required">
                        <option value="">Select an account</option>
                        <a:forEach var="aa" items="${account_ID}">
                            <f:option value="${aa.accountNo}">
                    ${aa.accountNo}
                </f:option>
                        </a:forEach></select>
                    
                    <input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
                       <!-- <td> <div class="error">Account number doesn't exist</div></td> -->
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td><!-- 
                       <td> <div class="error">Amount must be a number</div></td> -->
               
                <tr>
                    <td>
                        <!-- Add other form fields here --> <input type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </f:form>
    </div>
    <!-- Template for the Other Bank Form -->
    <div id="otherBankForm" style="display: none;">
        <f:form action = "transfer2" modelAttribute= "C">
        <table>
         	<h3 style="color: #004d00;">Transfer To Other Bank   </h3>
               <tr>
                    <!-- Your form fields for the other bank -->
                    <td><label for="otherBankField">Account Holder Name:</label></td>

                   <td>
                   
                    <f:input type="text" path="destinationAccountName" required="required"/></td>
              <!--        <td>   <div class="error">Account holder doesn't exist</div></td> -->
                    
                   <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td><input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
                       <!-- <td> <div class="error">Account number doesn't exist</div></td> -->
                </tr>
                   
                 <!--   <input type="text" id="otherBankField"
                        name="otherBankField"> -->
                 <%-- <tr>
                    <td><label for="account_No"> Account No:</label></td>
                    <td><f:input type="text" id="account_No" name="account_No" required="required"/><br></td>
                </tr> --%>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
                    <!--    <td> <div class="error">Amount must be a number</div></td> -->
                </tr>
                <!-- Add other form fields here -->
               <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </f:form>
   </div></div>
    	<script>
	</script>
   
   <style>
   .form-container {
	width: 50%;
	height: 700px;
	margin: 200px auto;
	padding: 30px;
	border: 1px solid #ccc;
	border-radius: 2px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}
.error {
	color: #d9534f;
	font-size: 15px;
}
   </style>
   <link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/transfer.css"> 
	
	<script src="${pageContext.request.contextPath}/scripts/transfer.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        </jsp:attribute></m:master>