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
    <button class="btn--close-modal" style="margin-top: 6%;" onclick="main();">&times;</button>
	<c:if test="${not empty list}">
	<center><h1 style="font-size: 40px;">Transaction Details</h1></center>
 <table  id="dtBasicExample" class="table table-striped" cellspacing="0" width="100%">
 					<tr align="center" class="noBorder">
 					<td colspan="6"><div class="qwp"><strong>Bank Name:</strong> PROSPERA</div></td>
 					</tr>
 					<tr align="center" class="noBorder">
 					<td colspan="6"><div class="qwp"><strong>Account Number:</strong> ${aq.accountNo }</div></td>
 					</tr>
 					<tr align="center" class="noBorder">
 					<td colspan="6"><div class="qwp"><strong>Account Name:</strong> ${aq.accountName}</div></td>
 					</tr>
 					<tr class="noBorder"><td colspan="6"></td></tr>
                    <tr class="table-info" style="background-color: #b7d9ed;">
                        <th scope="col">Transaction Date</th>
                        <th scope="col">Description</th>
                        <th scope="col">Reference No</th>
                        <th scope="col">Debit</th>
                        <th scope="col">Credit</th>
                       <th scope="col">Balance</th>
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
				</table>	</c:if>
	<c:if test="${empty list}">
	<h1>No Transaction records found</h1>
	</c:if> <br>
	<center>
<div class="d-flex justify-content-center" style="margin-right: 250px; padding-left: 10%;">
	<button id="printButton" class="btn btn-primary" style="background-color:#2b7199; margin-left: 7%;" >Export to PDF</button>
	<button  class="btn btn-primary pert" style="background-color:#2b7199; margin-left: 0%;border: none;
    padding: 10px 20px;
    cursor: pointer; border-radius: 5px !important;" onclick="exportToExcel()">Export to Excel</button>
</div>
</center>


<div class="row justify-content-center " >
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
	document.getElementById("printButton").addEventListener("click",
			function() {
				// Hide the print button before printing
				document.getElementById("printButton").style.display = "none";

				// Print the form
				window.print();

				// Show the print button again after printing
				document.getElementById("printButton").style.display = "block";
			});
	function exportToExcel() {
        const table = document.getElementById("dtBasicExample");
        const ws = XLSX.utils.table_to_sheet(table);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
        XLSX.writeFile(wb, "table2.xlsx"); // This line will trigger a file download
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.full.min.js"></script>
  <style>
  
  	body
  	{
  		background-color: #dee2e3;
  		font-family: 'Roboto', sans-serif;
  	}
  	tr.noBorder td {
  border: 0;
}
strong{
color: #484890;
}
.pert:hover{
color: black !important;
}
  	table {
  	
                width: 100%;
                border-collapse: collapse;
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
                background-color: #7ba7c9;
                color: white;
                border-radius: 5px;
            }
            .qwp{
            color: #4444a1;
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
            #printButton:hover{
color: black !important;
}

  </style> 
        </jsp:attribute></m:master>