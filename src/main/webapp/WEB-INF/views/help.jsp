<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Help">
	<jsp:attribute name="head">
	

</jsp:attribute>
	<jsp:attribute name="content">
            <button style="margin-top: 6%;" class="btn--close-modal" onclick="home();">&times;</button>
	<style>
	@import url("https://fonts.googleapis.com/css?family=Montserrat");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  font-family: "Montserrat", sans-serif;
  background-color: #34495e;
  color: #fff;
	font-size: 15px;
}
h1 {
  text-align: center;
  margin: 2rem 0;
  font-size: 2.5rem;
}

.accordion {
  width: 90%;
  max-width: 1000px;
  margin: 2rem auto;
}
.accordion-item {
  background-color: #fff;
  color: #111;
  margin: 1rem 0;
  border-radius: 0.5rem;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.25);
}
.accordion-item-header {
  padding: 0.5rem 3rem 0.5rem 1rem;
  min-height: 3.5rem;
  line-height: 1.25rem;
  font-weight: bold;
  display: flex;
  align-items: center;
  position: relative;
  cursor: pointer;
}
.accordion-item-header::after {
  content: "\002B";
  font-size: 2rem;
  position: absolute;
  right: 1rem;
}
.accordion-item-header.active::after {
  content: "\2212";
}
.accordion-item-body {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
.accordion-item-body-content {
  padding: 1rem;
  line-height: 1.5rem;
  border-top: 1px solid;
  border-image: linear-gradient(to right, transparent, #34495e, transparent) 1;
}

@media (max-width: 767px) {
  html {
    font-size: 14px;
  }
}
	
	
	</style>
	<h1>FAQ'S</h1>

<div class="accordion">
  <div class="accordion-item">
    <div class="accordion-item-header">
      How do I enroll in online banking?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
       Enrolling in online banking is simple. Visit our website and click on the "Enroll" or "Sign Up" link. Follow the instructions to create your online banking account.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
     What can I do through online banking?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
        With online banking, you can check your account balances, view transaction history, transfer funds between accounts, pay bills, set up account alerts, and more. It's a convenient way to manage your finances from anywhere.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
      What are the steps to transfer money?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
        <ul style="padding-left: 1rem;">
          <li><strong>Log In:</strong> Sign in to your online banking or mobile banking account.</li><br>
          <li><strong>Select Transfer:</strong> Navigate to the "Transfer to same bank or other bank" section.</li><br>
          <li><strong>Choose Recipient:</strong> Add the recipient's name, account number.</li><br>
          <li><strong>Enter Amount:</strong> Specify the amount you want to transfer.</li><br>
          <li><strong>Confirmation:</strong> Receive a confirmation message for the successful transfer.</li><br>
          <li><strong>Record Transaction:</strong> Keep a record of the transaction for your records.</li><br>
          <li><strong>Logout: </strong>Safely log out of your online banking account.</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
     How do I close my account?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
      To close your account, visit one of our branches or contact our customer support team. Ensure all outstanding transactions are cleared before closing the account.
        </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
     How can I protect my online banking account from fraud?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
       Protect your online banking account by regularly updating your password, using secure and unique passwords, enabling two-factor authentication, and monitoring your account for suspicious activity.
      </div>
    </div>
  </div>
</div>
<script>
const accordionItemHeaders = document.querySelectorAll(
		  ".accordion-item-header"
		);

		accordionItemHeaders.forEach((accordionItemHeader) => {
		  accordionItemHeader.addEventListener("click", (event) => {
		    // Uncomment in case you only want to allow for the display of only one collapsed item at a time!

		    const currentlyActiveAccordionItemHeader = document.querySelector(
		      ".accordion-item-header.active"
		    );
		    if (
		      currentlyActiveAccordionItemHeader &&
		      currentlyActiveAccordionItemHeader !== accordionItemHeader
		    ) {
		      currentlyActiveAccordionItemHeader.classList.toggle("active");
		      currentlyActiveAccordionItemHeader.nextElementSibling.style.maxHeight = 0;
		    }
		    accordionItemHeader.classList.toggle("active");
		    const accordionItemBody = accordionItemHeader.nextElementSibling;
		    if (accordionItemHeader.classList.contains("active")) {
		      accordionItemBody.style.maxHeight = accordionItemBody.scrollHeight + "px";
		    } else {
		      accordionItemBody.style.maxHeight = 0;
		    }
		  });
		});

</script>
	</jsp:attribute></m:master>
