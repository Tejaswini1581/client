<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="mm"%>
<m:master title="Home page">
	<jsp:attribute name="head">
                      <a href="#AboutUs">About Us</a>
	<br>
    </jsp:attribute>
<jsp:attribute name="content">
   <header class="header1">
    <div class="header__title1"
			style="margin-top: 200px; margin-bottom: 100px">
        <div class="content-container1">
            <div class="text-content">
                <h1>
                    When
                   <span class="highlight1">banking</span> meets<br>
                    <span class="highlight1">minimalist</span>
                </h1>
                <h4>A simpler banking experience for a simpler life.</h4>
                <button class="btn--text1 btn--scroll-to">Know more &DownArrow;</button>
            </div>
            <div class="image-content1">
                <img src="img/firstimg.png" class="header__img1"
						alt="Minimalist bank items">
            </div>
        </div>
   </div>
   <!-- class="header__img1" -->
</header>
        <div>
       <section class="section1">
      <div class="section__title1">
        <h3 class="section__description1">Features</h3>
        <h3 class="section__header1">
          Everything you need in a modern bank and more.
       </h3>
      </div>   
        <div class="features1">
            <div class="features_box1">
                <img src="/img/loan.png" alt="Loans">
                <h2>Loans</h2>
                <p>We offer a range of loan options to meet your financial needs. Our loans are designed to be flexible and tailored to your requirements, interest rates and repayment terms that suit your budget and timeline.</p>
            </div>
           <div class="features_box1">
                <img src="/img/security.png" alt="Security">
                <h2>Security</h2>
                <p>Your financial security is paramount.  ensuring your peace of mind while managing your finances we employ the latest advancements to create a fortified defense against cyber threats.</p>
            </div>
             <div class="features_box1">
                <img src="/img/privacy.png" alt="Privacy">
                <h2>Privacy</h2>
                <p>We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data. By using our services, you agree to the practices described in this policy.
</p>
            </div>
        </div>
		</div>
         <div class="about-us1">

<%--                 <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/aboutus.css">

--%>        
            <h2>About Us</h2>
            <a name=AboutUs>
            <p>Welcome to our bank, where we strive to provide exceptional financial services to our customers.</p>
            <p>With a commitment to transparency, security, and customer satisfaction, we have been serving the community for decades.</p>
            <p>Our dedicated team of professionals is here to assist you in achieving your financial goals.</p>	
		</div>
        </a>         
                    <div class="contact-info1">
                 <h2>Contact Us</h2>
            <p>If you have any questions or concerns, feel free to reach out to us:</p>
                <p>Phone: <span>8247022317</span>
		</p>
                <!-- You can add more contact information as needed -->
            </div>
                <footer class="footer1">
        <ul class="footer__nav1">
            <li class="footer__item1"><a class="footer__link1"
				href="#">About</a>
           </li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Pricing</a>
            </li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Terms
                   of Use</a></li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Privacy
                    Policy</a></li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Careers</a>
            </li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Blog</a>
            </li>
            <li class="footer__item1"><a class="footer__link1"
				href="#">Contact
                    Us</a></li>
        </ul>
        <img src="${pageContext.request.contextPath}/img/icon.png"
				alt="Logo" class="footer__logo1">
    </footer>
            <link rel="shortcut icon" type="image/png" href="img/icon.png">
        <link
			href="https://fonts.googleapis.com/css?family=Poppins:200,400,500,600&display=swap"
			rel="stylesheet">
        <link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet"
			href="${pageContext.request.contextPath}/styles/style2.css">
<%--                 <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/aboutus.css">
--%>        
    </jsp:attribute>
</m:master>