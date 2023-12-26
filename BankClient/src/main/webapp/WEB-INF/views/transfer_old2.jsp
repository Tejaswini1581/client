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
    <h2><a:out value="${msg}"></a:out> </h2>
		<button style="padding-top: 5%" class="btn--close-modal" onclick="main();">&times;</button>
    <div class="container" >
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
                             <h2>Transfer To The Same Bank  </h2>
            <table>
                <tr>
                    <!-- Your form fields for the same bank -->
                    <td><label for="destinationAccountName"> Account
                            Holder Name:</label></td>
                    <td>
                    <f:select path="destinationAccountName" cssClass="select2" id="mySelect"
                        required="required">
                        <option value="">Select an account</option> 
                        <a:forEach var="t" items="${list}">
                            <f:option value="${t.accountName}" >
                    ${t.accountName} - ${t.accountNo}
                </f:option>
                        </a:forEach>
                    </f:select>
                    
                   
                    </td>
                </tr>
              <%--    <tr>
                    <td><label for="account_No"> Account No:</label></td>
                    <td><f:input type="text" id="account_No" name="account_No" required="required"/><br></td>
                </tr> --%>
                 <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td><input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
               
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
         <h2>Transfer To Other Bank   </h2>
               <tr>
                    <!-- Your form fields for the other bank -->
                    <td><label for="otherBankField">Account Holder Name:</label></td>

                   <td>
                   <f:input path="destinationAccountName" type="text" cssClass="select2" required="required"/>
                    
                    
                   <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td><input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
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
                </tr>
                <!-- Add other form fields here -->
               <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </f:form>
   </div>	<script src="${pageContext.request.contextPath}/scripts/transfer.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css"
    rel="stylesheet" />
<!-- <script
    src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
      <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ADD8E6;
            margin: 40;
            padding: 30;
       }
         form {
        text-align: center;
    }
     .hidden {
            display: none;
        }
    table{
margin-left: auto;  
margin-right: auto;  
border-collapse: collapse;    
width: 500px;  
text-align: left;  
font-size: 20px;  
    }
     table td,
table th {
    padding: 10px;
    margin: 10     px;
}
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #90EE90;
            border-radius: 5px;
           box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
       }
        /* Display radio buttons side by side */
      
    </style> -->
       <link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/transfer.css"> 
   <script>
        $(document).ready(function() {
            $('.select2').select2();
        });
        
      
    </script>
        </jsp:attribute></m:master>