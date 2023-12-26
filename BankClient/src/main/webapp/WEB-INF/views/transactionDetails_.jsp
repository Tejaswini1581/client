<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
	<jsp:attribute name="head">
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
    <c:if test="${not empty list}">
    <div class="row justify-content-center">
        <div class="col-md-10">
 <table  id="dtBasicExample" style="margin-left: 10%; " class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                    <tr>
                        <th class="th-sm">Transaction Date</th>
                        <th class="th-sm">Description</th>
                        <th class="th-sm">Reference No</th>
                        <th class="th-sm">Debit</th>
                        <th class="th-sm">Credit</th>
                       <th class="th-sm">Balance</th>
                  </tr>
                    <c:forEach items="${list}" var="v">
                        <tr>
                            <td>${v.timeStamp }</td>
                            <td>${v.type}</td>
                            <td class="userid">${v.id }</td>
                            <td>${v.deposit}</td>
                            <td>${v.withdraw}</td>
                            <td>${v.remarks }</td>
                      </tr>
                    </c:forEach>
                </table>
                </div>
                </div>
                    </c:if>
    <c:if test="${empty list}">
    <h1>No Transaction records found</h1>
    </c:if>
    <div style=" padding-left: 3%;" class="d-flex justify-content-center"
			style="margin-right: 250px;"><center>
<button id="printButton" class="btn btn-primary" >Print Form</button></center>
</div>
<div class="row justify-content-center ">
        <div class="col-md-10">
            <!-- Pagination -->
            <div class="text-center">
                <ul class="pagination" style=" padding-left: 24%;">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li
							class="page-item ${pageIndex == i ? 'active' : ''}">
                            <a class="page-link" href="?pageIndex=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
       </div>
    </div>
<script>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style>

  	body
  	{
  		background-color: #dee2e3;
  		font-family: 'Roboto', sans-serif;
  	}

  </style>
  	

        </jsp:attribute></m:master>