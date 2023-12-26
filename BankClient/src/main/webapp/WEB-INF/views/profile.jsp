<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
    <jsp:attribute name="head">
        <meta charset="ISO-8859-1">
    </jsp:attribute>
    <jsp:attribute name="content">
    <button class="btn--close-modal" style="margin-top: 6%;" onclick="main();">&times;</button>
        <center><h2 style="color: green;">${msg}</h2>   </center>
        <center><h2 style="color: red;">${err}</h2>   </center>
        <div class="login-form" style="height: 12%; text-align: center;">
            <h2 class="login-header" style="margin-top: 20px;"><strong>User Details</strong></h2>
            <table class="user-table" style="border-collapse: collapse; width: 80%; margin: 0 auto; margin-top: 20px;">
                <tr>
                    <th>User Id</th>
                    <td>${v.userId }</td>
                </tr>
                <tr>
                    <th>First Name</th>
                    <td>${v.firstName}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>${v.lastName}</td>
                </tr>
                <tr>
                    <th>Email Address</th>
                    <td>${v.mailId}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>${v.phoneNo }</td>
                </tr>
                <tr>
                    <th>Date Of Birth</th>
                    <td>${v.dateOfBirth}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>${v.gender}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${v.address}</td>
                </tr>
                <tr>
                    <th>Account Number</th>
                    <td>${c.accountNo}</td>
                </tr>
                <tr>
                    <th>Account Name</th>
                    <td>${c.accountName }</td>
                </tr>
                <tr>
                    <th>Balance</th>
                    <td>${c.balance}</td>
                </tr>
            </table>
            <input type="submit" class="btn edit-btn" onclick="form1()" value="Edit"/>
            <input type="submit" class="btn edit-btn" onclick="form2()" value="View Session Activity"/>
            <div class="print-button-container">
                <button id="printButton" class="btn print-btn" onclick="printForm()">Print Form</button>
            </div>
        </div>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
        function form1() {
            window.location.href = "http://localhost:9101/editCustomer";
        }
        function form2() {
            window.location.href = "http://localhost:9101/getCount";
        }

            function printForm() {
                var printButton = document.getElementById("printButton");
                printButton.style.display = "none";
                window.print();
                printButton.style.display = "block";
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            th,td{
            font-size: 15px;
            }

            .login-form {
                background-color: #f2f2f2;
                padding: 20px;
                border-radius: 5px;
                margin: 20px auto;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
            }

            .login-header {
                margin-bottom: 20px;
            }

            .user-table {
                width: 100%;
                border-collapse: collapse;
            }

            .user-table th, .user-table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .user-table th {
                width: 30%;
                background-color: #f2f2f2;
            }

            .edit-btn, .print-btn {
                background-color: #2b7199;
                color: white;
                padding: 8px 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
            }

            .edit-btn:hover, .print-btn:hover {
                background-color: #14537d;
            }

            .print-button-container {
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </jsp:attribute>
</m:master>
