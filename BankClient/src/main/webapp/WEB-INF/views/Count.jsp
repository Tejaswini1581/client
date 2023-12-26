<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Count">
	<jsp:attribute name="head">
	
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
		<button style="margin-top: 6%;" class="btn--close-modal" onclick="profile();">&times;</button>
	<c:if test="${not empty list}">
	<center><h1>Session Activity</h1></center>
 <table  id="dtBasicExample" class="table table-striped" cellspacing="0" width="100%">
                    <tr class="table-info" style="background-color: #b7d9ed;">
                        <th scope="col">Login Time</th>
                       <th scope="col">Logout Time</th>
                   </tr>
                    <c:forEach items="${list}" var="v">
                        <tr>
                            <td>${v.loginTime}</td>
                            <td>${v.logoutTime}</td>
                       </tr>
					</c:forEach>
				</table>	</c:if>
	<c:if test="${empty list}">
	<h1>No Session Activity records found</h1>
	</c:if> <br>
	<div class="d-flex justify-content-center" style="margin-right: 250px; padding-left: 10%;"><center>
<button id="printButton" class="btn btn-primary" style="background-color:#2b7199; margin-left: 7%;" >Print Form</button></center>
</div>
<div class="row justify-content-center ">
        <div class="col-md-10">
            <!-- Pagination -->
            <div class="text-center">
                <ul class="pagination" style="align-self: center; margin-top: 10px;">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li
							class="page-item ${pageIndex == i ? 'active' : ''}">
                            <a  class="page-link" href="?pageIndex=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
       </div>
    </div>
<script>

function profile() {
	window.location.href = "http://localhost:9101/profile";
}

	document.getElementById("printButton").addEventListener("click",
			function() {
				// Hide the print button before printing
				document.getElementById("printButton").style.display = "none";

				// Print the form
				window.print();

				// Show the print button again after printing
				document.getElementById("printButton").style.display = "block";
			});
</script>
  <style>
  
  	body
  	{
  		background-color: #dee2e3;
  		font-family: 'Roboto', sans-serif;
  	}
  	table {
                width: 50%;
                margin:0 auto;
                margin-top:10px;
                border-collapse: collapse;
                border: 1px solid #b7d9ed;
            }

            th, td {
                padding: 10px;
                border: 1px solid #b7d9ed;
                font-size: 15px;
            }

            th {
                background-color: #b7d9ed;
                text-align:left;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .pagination {
                list-style-type: none;
                display: flex;
                justify-content: center;
                padding-left: 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                text-decoration: none;
                padding: 5px 10px;
                background-color: #2b7199;
                color: white;
                border-radius: 5px;
            }

            .pagination li.active a {
                background-color: #30658e;
            }

            #printButton {
                background-color: #2b7199;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

  </style> 
        </jsp:attribute></m:master>