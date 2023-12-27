<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Transfer">
	<jsp:attribute name="head">

</jsp:attribute>
	<jsp:attribute name="content">

<center>	<h2 style="color:green; margin-top: 0px;">${msg}</h2></center>
<center>	<h2 style="color:red; margin-top: 0px;">${err}</h2></center>
    <button class="btn--close-modal" style="margin-top: 6%;" onclick="main();">&times;</button>
    <div style="margin-top:3%" class="form-container">
   <!--  <div class="container" style="margin-top: 0px;"> -->
            <div class="form-header">
        <h2>Select a Bank</h2>
        <h3>Transfer Type:</h3>
        <div class="radio-group">
           <label for="sameBank"> <input type="radio" id="sameBank"
               name="bankType" value="sameBank"> Same Bank
            </label>
        </div>
        <div class="radio-group">
            <label for="otherBank"> <input type="radio" id="otherBank"
                name="bankType" value="otherBank"> Other Bank
            </label>
        </div></div>
    <div id="bankFormContainer"></div>
    <!-- Template for the Same Bank Form -->
    <div id="sameBankForm" style="display: none;">
  <f:form action="transfer1" modelAttribute="C">
            <h3 style="color:green; margin-top: -45px;">Transfer To The Same Bank</h3>
            <table style=" margin-top: -5px;">
                <tr>
                    <!-- Your form fields for the same bank -->
                    <td><label for="destinationAccountName"> Account
                            Holder Name:</label></td>
                    <td><f:input type="text" path="destinationAccountName"
                        onkeyup="getAutocompleteSuggestions()" required="required"/>
                        <div id="suggestions"></div> <!--  <input type="text" id="destinationAccountName"
                        name="destinationAccountName"> --> <br></td>
                </tr>
                    <tr>
                    <td><label for="account_No"> Account Number:</label></td>
                    <td><input type="text" id="account_No" type="hidden" name="account_No" required="required"><br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
                <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                    <td><input type="text" id="remarks" name="remarks"><br></td>
                </tr>
                <tr>
                    <td>
                        <!-- Add other form fields here --> <input type="submit"
                        value="Submit">
                    </td>
                </tr>
            </table>
        </f:form>
    </div>
    <!-- Template for the Other Bank Form -->
   
    <div id="otherBankForm" style="display: none;">
  <f:form action="transfer2" modelAttribute="C"> 
    <h3 style="color:green; margin-top: -45px;">Transfer To Other Bank</h3>
            <table style=" margin-top: -5px;">
            
            <tr>
                    <!-- Your form fields for the other bank -->
                    <td><label for="otherBankField" >Account Holder Name:</label></td>
                    <td><input type="text" id="searchInput" name="searchInput" onkeyup="searchSuggestions()"
                        name="otherBankField"/>
                        <div id="suggestionDropdown" class="autocomplete-items"></div><br></td>                       
                </tr>
                 <tr>
                    <td><label for="ifscCode">IFSC Code :</label></td>
                    <td><input type="text" id="ifscCode" name="ifscCode"><br></td>
                </tr>
                    <tr>
                    <td><label for="account_No"> Account Number:</label></td>
                    <td><input type="text" id="account_No" name="account_No"><br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
                <tr>
                <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                    <td><input type="text" id="remarks" name="remarks"><br></td>
                </tr>
                
                  <tr>  <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </f:form>
    </div>
    
    
    <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
input[type="submit"] {
	background-color: #0080ff; /* Change the background color to blue */
	color: white;
	display: block;
	padding: 10px 15px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: darkblue; /* Change the background color on hover */
}
body {
    font-family: Arial, sans-serif;
    background-color: #ADD8E6;
    margin: 40;
   padding: 30;
}
form {
    text-align: center;
}
table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	padding: 0 auto;
	width: 500px;
	text-align: left;
	font-size: 15px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
	margin-bottom:100px;
	margin-top:30px;
}
table td, table th {
    padding: 10px;
    margin: 20 px;
}
.container {
	margin:0 auto;
	max-width: 800px;
	max-height:900px;
	margin-top: 100px;
	margin-bottom: 40px;
	padding: 30px;
	/* background-color: #90EE90; */
	background: linear-gradient(to bottom, lavender, lightblue);
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 100px;
}
 .container label {
            font-size: 15px; /* Set your desired font size */
   }
.bank-container {
	max-width: 60%;
	/* background-color: #90EE90; */
	margin:0 auto;
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
	padding: 10px;
	margin-top: 100px;
	
	
}
h2 {
    margin-top: 22;
}
h3 {
	margin-top: 22;
	font-size:20px;
}

label {
    display: inline-block;
    margin-right: 5px;
    font-weight: bold;
}
input[type="radio"] {
    margin-right: 5px;
}
/* Display radio buttons side by side */
.radio-group {
    display: inline-block;
}
#autocomplete {
    position: relative;
    display: inline-block;
}
#autocomplete input {
    padding: 5px;
}
#suggestions {
    position: absolute;
    width: 100%;
    max-height: 150px;
    overflow-y: auto;
   border: 1px solid #ccc;
    background-color: #fff;
    display: none;
}
.suggestion {
    padding: 8px;
    cursor: pointer;
}
.suggestion:hover {
    background-color: #f2f2f2;
}
.autocomplete-items {
    position: absolute;
    /* border: 1px solid #ccc; */
    background-color: white;
    width: auto;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    max-height: 150px;
    overflow-y: auto;
} 
 .autocomplete-items div {
    padding: 8px;
    cursor: pointer;
} 
.autocomplete-items div:hover {
    background-color: #f1f1f1;
}
</style>


<style>
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

</style>
<script>
function searchSuggestions() {
    const input = $("#searchInput").val().trim();
    const suggestionDropdown = $("#suggestionDropdown");

   // Clear previous suggestions
   suggestionDropdown.empty();

    // Fetch suggestions from your database or predefined list
    const suggestions = getSuggestionsFromDatabase(input);
    // Display suggestions in the dropdown
    suggestions.forEach(suggestion => {
        const suggestionItem = $("<div class='suggestion'></div>");
        suggestionItem.text(suggestion);
       suggestionItem.on("click", function() {
            $("#searchInput").val(suggestion);
            suggestionDropdown.empty(); // Clear suggestions after selection
            autoFillAccountDetails(); // Autofill the form fields
            // Call your additional method here
            yourAdditionalMethod();
        });
        suggestionDropdown.append(suggestionItem);
    });
    // Show or hide the dropdown based on suggestions
    if (suggestions.length > 0) {
        suggestionDropdown.css("display", "block");
    } else {
        suggestionDropdown.css("display", "none");
    }
}
// Replace this function with actual fetching of suggestions from your database
function getSuggestionsFromDatabase(query) {
    // Simulated suggestions for demonstration
    const mockSuggestions = [
       // ... more suggestions
    ];
    $.ajax({
        type : 'GET',
        url : "http://localhost:9100/autosuggestions/"+query,
        dataType : "JSON",
        contentType : "application/json;charset=utf-8",
        async : false,
        success : function(data) {
             for (var i = 0; i < data.length; i++) {
            const accountHolderName = data[i].accountHolderName;
                 mockSuggestions.push(accountHolderName+"-"+data[i].account_No);
            }
        },
        error : function(x, err) {
        }
    });//endofajax
    return mockSuggestions.filter(suggestion =>
        suggestion.toLowerCase().includes(query.toLowerCase())
    );
}
$(document).ready(function() {
    $("input[name='bankType']").change(function() {
        var selectedValue = $("input[name='bankType']:checked").val();
        if (selectedValue === "sameBank") {
            $("#bankFormContainer").html($("#sameBankForm").html());
        } else if (selectedValue === "otherBank") {
            $("#bankFormContainer").html($("#otherBankForm").html());
        }
    });
});
function autoFillAccountDetails() {
     const name = $("#searchInput").val().trim();     
       // Split the suggestion by a specific character or pattern to extract the name
        const parts = name.split('-');
        const accountHolderName = parts[0]; // The first part is the account holder's name
        const account_No = parts[1]; // The first part is the account holder's name
    $.ajax({
        type: 'GET',
        url: "http://localhost:9100/getReceiverAccount/"+ account_No,
        dataType: "JSON",
        contentType: "application/json;charset=utf-8",
        async: false,
        success: function (data) {
            if (data) {
                // Autofill the account details
                document.getElementById("account_No").value = data.account_No;
                document.getElementById("ifscCode").value = data.ifscCode;
           }
        },
        error: function (x, err) {
            // Handle errors
        }
    });
}

    </script>
        </jsp:attribute></m:master>