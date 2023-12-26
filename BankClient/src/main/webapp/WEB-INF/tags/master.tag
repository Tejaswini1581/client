<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" rtexprvalue="true" required="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="aa"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/png" href="img/icon.png">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,400,500,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/login_user_admin.css">
<title>Prospera Bank</title>
<style>
.circular-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
}

.circular-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
function home() {
	window.location.href = "http://localhost:9101/home";
}
function main() {
	window.location.href = "http://localhost:9101/mainpage";
}
	$(document).ready(function() {
		

		
        $("input[name='bankType']").change(function() {
            var selectedValue = $("input[name='bankType']:checked").val();
            if (selectedValue === "sameBank") {
              $("#bankFormContainer").html($("#sameBankForm").html());
          } else if (selectedValue === "otherBank") {
                $("#bankFormContainer").html($("#otherBankForm").html());
            }
        });//input[name='bankType']

       
    		
        $(".Acc").blur(function() {
        var a=$("#destinationAccountName").val();
		$.ajax({
			type : "GET",
			url : "http://localhost:9100/getAccountByName/" + a,
			dataType : "text",
			async : false,
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				$("#account_ID").val(data);
			},
			error : function(x, err) {
				alert("readyState " + x.readyState);
				alert("responseText " + x.responseText);
			}
		});//end of ajax
	});//end of accept  
	
		$(".status1").click(function() {
			var a = $(this).val();
			a = a + "ed";
			var b = $(this).closest("tr").find(".userid").text();
			var $myDiv = $(this).closest("tr");
			$.ajax({
				type : "PUT",
				url : "http://localhost:9100/updateCustomer/" + a + "/" + b,
				dataType : "text",
				async : false,
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					$myDiv.remove();
					location.reload();
				},
				error : function(x, err) {
					alert("readyState " + x.readyState);
					alert("responseText " + x.responseText);
				}
			});//end of ajax
		});//end of accept 
	});
          document.addEventListener('contextmenu', function (e) {
            e.preventDefault();
        });  
</script>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script> 


</head>
<body>
	<header style="width:100%;" class="header">
		<nav style="background-color: #3c3c5d ; width:100%;" class="nav">
			<img src="${pageContext.request.contextPath}/img/logobank.png"
				alt="Bankist logo" class="nav__logo" id="logo"
				data-version-number="3.0">
			<aa:choose>
				<aa:when
					test="${sessionScope.user!=null}">
					<style>
			body
		{
				background-image: url('/img/bg11.avif');
				background-size:cover;
			}
		</style>
					<ul class="nav__links">
						<li class="nav__item"><a class="nav__link" href="/deposit"
							style="color: #ffffff">Deposit</a></li>
						<li class="nav__item"><a class="nav__link" href="/withdraw"
							style="color: #ffffff">Withdraw</a></li>
						<li class="nav__item"><a class="nav__link" href="/transfer"
							style="color: #ffffff">Transfer</a></li>
						<li class="nav__item"><a class="nav__link"
							href="/transactionDetails" style="color: #ffffff">Transaction
								Details</a></li>
						<li class="nav__item"><a class="nav__link" href="/balance"
							style="color: #ffffff">Check Balance</a></li>
						<li class="nav__item">
							<div class="dropdown">
								<div class="circular-image">
									<img src="/img/profileimg.png" alt="Profile Pic">
								</div>
								<i class="fa fa-caret-down"></i>

								<!-- <button class="dropbtn">
									profile pic <i class="fa fa-caret-down"></i>
								</button> -->
								<div class="dropdown-content ">
									<a class="nav__link" href="/profile">Profile</a>
									<a class="nav__link" href="logout">Logout</a>
								</div>
							</div>
						</li>
					</ul>
				</aa:when>
				
				
				<aa:when
					test="${sessionScope.adminID!=null}">
					<style>
			body
		{
				background-image: url('/img/bg11.avif');
				background-size:cover;
			}
		</style>
					<ul class="nav__links" style="padding-left: 80%">
						<li class="nav__item"  style="color: #ffffff; margin-left: -25%;"	>
									<a class="nav__link" href="logoutAdmin" style="color: #ffffff;">Logout</a>
						</li>
					</ul>
				</aa:when>
				
				
				
				
				<aa:otherwise>
					<ul class="nav__links">
						<li class="nav__item"><a class="nav__link" href="/aboutus"
							style="color: #ffffff">About Us</a></li>
						<li class="nav__item"><a class="nav__link" href="/contactus"
							style="color: #ffffff">Contact Us</a></li>
						<li class="nav__item"><a class="nav__link" href="/help"
							style="color: #ffffff; margin-right:35px;">Help</a></li>
						<li><div class="dropdown" >
								<button class="dropbtn">
									Login <i class="fa fa-caret-down"></i>
								</button>
								<div class="dropdown-content">
									<a class="nav__link" href="http://localhost:9101/loginCustomer" style="color:black;">User</a>
									<a class="nav__link" href="loginAdmin" style="color:black;">Admin</a>
								</div>
							</div></li>
					</ul>
				</aa:otherwise>
			</aa:choose>
		</nav>


	</header>

	<jsp:invoke fragment="content"></jsp:invoke>
</body>
</html>
