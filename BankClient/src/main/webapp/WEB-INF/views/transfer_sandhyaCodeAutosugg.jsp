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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	width: 500px;
	text-align: left;
	font-size: 20px;
}
table td, table th {
	padding: 10px;
	margin: 10 px;
}
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
.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #90EE90;
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}
h2 {
	margin-top: 22;
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
	border: 1px solid #ccc;
	background-color: white;
	width: 100%;
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

<script>
function home() {
    window.location.href = "http://localhost:9101/mainpage";
}
function searchSuggestions() {
    const input = document.getElementById("searchInput");
    const inputValue = input.value.trim(); 
  const suggestionDropdown = document.getElementById("suggestionDropdown"); 
    // Clear previous suggestions
    suggestionDropdown.innerHTML = "";
    // Fetch suggestions from your database or predefined list
    const suggestions = getSuggestionsFromDatabase(inputValue);
    // Display suggestions in the dropdown
    suggestions.forEach(suggestion => {
        const suggestionItem = document.createElement("div");
       suggestionItem.textContent = suggestion;
        suggestionItem.addEventListener("click", () => {
           input.value = suggestion;
           suggestionDropdown.innerHTML = ""; // Clear suggestions after selection
        });
       suggestionDropdown.appendChild(suggestionItem);
    });
    // Show or hide the dropdown based on suggestions
    if (suggestions.length > 0) {
        suggestionDropdown.style.display = "block";
   } else {
        suggestionDropdown.style.display = "none";
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
            alert("heyyyy");
             for (var i = 0; i < data.length; i++) {
                 const accountHolderName = data[i].accountHolderName;
                 mockSuggestions.push(suggestion);
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
    </script>
	<button class="btn--close-modal" onclick="home();">&times;</button>
<div class="container">
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
		</div>
	</div>
	<div id="bankFormContainer"></div>
	<!-- Template for the Same Bank Form -->
	<div id="sameBankForm" style="display: none;">
	<form>
			<h3>Transfer To The Same Bank</h3>
			<table>
				<tr>
					<!-- Your form fields for the same bank -->
					<td><label for="destinationAccountName"> Account
							Holder Name:</label></td>
				<td><input type="text" id="destinationAccountName"
					name="destinationAccountName"
						onkeyup="getAutocompleteSuggestions()" required>
						<div id="suggestions"></div> <!--  <input type="text" id="destinationAccountName"
                        name="destinationAccountName"> --> <br></td>
				</tr>
				<tr>
					<td><label for="amount"> Amount:</label></td>
					<td><input type="text" id="amount" name="amount" required><br></td>
				<tr>
					<td><label for="remarks"> Remarks:</label></td>
					<td><input type="text" id="remarks" name="remarks" required><br></td>
				</tr>
				<tr>
				<td>
					<!-- Add other form fields here --> <input type="submit"
					value="Submit">
					</td>
				</tr>
			</table>
	</form>
	</div>
	<!-- Template for the Other Bank Form -->
	<div id="otherBankForm" style="display: none;">
		<form>
		<table>
				<h3>Transfer To Other Bank</h3>
				<tr>
					<!-- Your form fields for the other bank -->
					<td><label for="otherBankField">Account Holder Name:</label></td>
					<td><input type="text" id="searchInput"
						onkeyup="searchSuggestions()" name="otherBankField">
						<div id="suggestionDropdown" class="autocomplete-items"></div> <br></td>
				</tr>
				<td><input type="submit" value="Submit"></td>
				</tr>
		</table>
		</form>
	</div>
        </jsp:attribute></m:master>