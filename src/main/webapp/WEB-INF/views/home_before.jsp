<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="mm"%>
<m:master title="Home page">
	<jsp:attribute name="head">
<link rel="shortcut icon" type="image/png" href="img/icon.png">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,400,500,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/style.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/master_old_style.css"> 
	
</jsp:attribute>
	<jsp:attribute name="content">
	
	
	<%-- 
	<div class="content" style="margin-top: 0;">
    <div id="carouselExample" class="carousel slide"
            data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExample" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carouselExample" data-slide-to="1"></li>
                <li data-target="#carouselExample" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-inner" style="position: relative;">
    <div class="carousel-item active">
    <img
        src="${pageContext.request.contextPath}/img/firstimg.png"
        style="height: 800px; margin-top: 0; margin-bottom: 0;"
       class="d-block w-100"
        alt="Slide 1">
    <div class="carousel-caption" style="position: absolute; left: 0; top: 50%; transform: translateY(-50%);">
        <h1 style="padding-left: 0;">
            When
           <span class="highlight">banking</span> meets<br>
            <span class="highlight">minimalist</span>
        </h1>
        <h4>A simpler banking experience for a simpler life.</h4>
    </div>
</div>
               <div class="carousel-item">
                    <img
                        src="${pageContext.request.contextPath}/img/img 3.jpg"
                       style="height: 800px" class="d-block w-100 " alt="Slide 2">
                </div>
               <div class="carousel-item">
                    <img
                        src="${pageContext.request.contextPath}/img/bank_6.jpg"
                        style="height: 800px" class="d-block w-100 " alt="Slide 3">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExample"
                role="button" data-slide="prev">
                <span class="carousel-control-prev-icon"
                aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
            </a>
           <a class="carousel-control-next" href="#carouselExample"
               role="button" data-slide="next">
                <span class="carousel-control-next-icon"
               aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
      </div>
        <div class="features"style="margin-top:0px">
            <div class="features_box">
                <img src="/img/loan.jpg" alt="Loans">
                <h2>Loans</h2>
                <p>We offer a range of loan options to meet your financial needs. Our loans are designed to be flexible and tailored to your requirements, interest rates and repayment terms that suit your budget and timeline.</p>
          </div>
           <div class="features_box">
                <img src="/img/securityimg.jpg" alt="Security">
                <h2>Security</h2>
                <p>Your financial security is paramount.  ensuring your peace of mind while managing your finances we employ the latest advancements to create a fortified defense against cyber threats.</p>
            </div>
            <div class="features_box">
                <img src="/img/privacy.jpg" alt="Privacy">
                <h2>Privacy</h2>
                <p>We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data. By using our services, you agree to the practices described in this policy.
</p>
            </div>
        </div>        
        <div class="about-us">
                   <h2>About Us</h2>
            <a name=AboutUs>
            <p>Welcome to our bank, where we strive to provide exceptional financial services to our customers.</p>
            <p>With a commitment to transparency, security, and customer satisfaction, we have been serving the community for decades.</p>
            <p>Our dedicated team of professionals is here to assist you in achieving your financial goals.</p>
        </div>
        </a>
                    <div class="contact-info">
        <h2>Contact Us</h2>
            <p>If you have any questions or concerns, feel free to reach out to us:</p>
                <p>Phone: <span>8247022317</span></p>
                <!-- You can add more contact information as needed -->
            </div>
        <footer class="footer">
        <ul class="footer__nav">
            <li class="footer__item"><a class="footer__link" href="#">About</a>
            </li>
            <li class="footer__item"><a class="footer__link" href="#">Pricing</a>
            </li>
           <li class="footer__item"><a class="footer__link" href="#">Terms
                  of Use</a></li>
            <li class="footer__item"><a class="footer__link" href="#">Privacy
                    Policy</a></li>
            <li class="footer__item"><a class="footer__link" href="#">Careers</a>
            </li>
            <li class="footer__item"><a class="footer__link" href="#">Blog</a>
           </li>
            <li class="footer__item"><a class="footer__link" href="#">Contact
                   Us</a></li>
       </ul>
        <img src="${pageContext.request.contextPath}/img/icon.png" alt="Logo"
            class="footer__logo">
    </footer> --%>
	
	
	
	
	<header class="header">
		<div class="header__title">
			<h1>
				When
				<!-- Green highlight effect -->
				<span class="highlight">banking</span> meets<br> <span
					class="highlight">minimalist</span>
			</h1>
			<h4>A simpler banking experience for a simpler life.</h4>
			<button class="btn--text btn--scroll-to">Learn more
				&DownArrow;</button>
			<img src="img/hero.png" class="header__img"
				alt="Minimalist bank items">
		</div></header>
	
	
	
	<div id="msg">
	<p>${msg}</p>
	</div>
	
	<section class="section" id="section--1">
		<div class="section__title">
			<h2 class="section__description">Features</h2>
			<h3 class="section__header">Everything you need in a modern bank
				and more.</h3>
		</div>

		<div class="features">
			<img src="${pageContext.request.contextPath}/img/digital-lazy.jpg"
				data-src="/img/digital.jpg" alt="Computer"
				class="features__img lazy-img">
			<div class="features__feature">
				<div class="features__icon">
					<svg>
              <use xlink:href="img/icons.svg#icon-monitor"></use>
            </svg>
				</div>
				<h5 class="features__header">100% digital bank</h5>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde
					alias sint quos? Accusantium a fugiat porro reiciendis saepe
					quibusdam debitis ducimus.</p>
			</div>

			<div class="features__feature">
				<div class="features__icon">
					<svg>
              <use xlink:href="img/icons.svg#icon-trending-up"></use>
            </svg>
				</div>
				<h5 class="features__header">Watch your money grow</h5>
				<p>Nesciunt quos autem dolorum voluptates cum dolores dicta fuga
					inventore ab? Nulla incidunt eius numquam sequi iste pariatur
					quibusdam!</p>
			</div>
			<img src="${pageContext.request.contextPath}/img/grow-lazy.jpg"
				data-src="${pageContext.request.contextPath}/img/grow.jpg"
				alt="Plant" class="features__img lazy-img"> <img
				src="img/card-lazy.jpg" data-src="img/card.jpg" alt="Credit card"
				class="features__img lazy-img">
			<div class="features__feature">
				<div class="features__icon">
					<svg>
              <use
							xlink:href="${pageContext.request.contextPath}/img/icons.svg#icon-credit-card"></use>
            </svg>
				</div>
				<h5 class="features__header">Free debit card included</h5>
				<p>Quasi, fugit in cumque cupiditate reprehenderit debitis animi
					enim eveniet consequatur odit quam quos possimus assumenda dicta
					fuga inventore ab.</p>
			</div>
		</div>
	</section>

	<section class="section" id="section--2">
		<div class="section__title">
			<h2 class="section__description">Operations</h2>
			<h3 class="section__header">Everything as simple as possible,
				but no simpler.</h3>
		</div>

		<div class="operations">
			<div class="operations__tab-container">
				<button
					class="btn operations__tab operations__tab--1 operations__tab--active"
					data-tab="1">
					<span>01</span>Instant Transfers
				</button>
				<button class="btn operations__tab operations__tab--2" data-tab="2">
					<span>02</span>Instant Loans
				</button>
				<button class="btn operations__tab operations__tab--3" data-tab="3">
					<span>03</span>Instant Closing
				</button>
			</div>
			<div
				class="operations__content operations__content--1 operations__content--active">
				<div class="operations__icon operations__icon--1">
					<svg>
              <use
							xlink:href="${pageContext.request.contextPath}/img/icons.svg#icon-upload"></use>
            </svg>
				</div>
				<h5 class="operations__header">Tranfser money to anyone,
					instantly! No fees, no BS.</h5>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat.</p>
			</div>

			<div class="operations__content operations__content--2">
				<div class="operations__icon operations__icon--2">
					<svg>
              <use
							xlink:href="${pageContext.request.contextPath}/img/icons.svg#icon-home"></use>
            </svg>
				</div>
				<h5 class="operations__header">Buy a home or make your dreams
					come true, with instant loans.</h5>
				<p>Duis aute irure dolor in reprehenderit in voluptate velit
					esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum.</p>
			</div>
			<div class="operations__content operations__content--3">
				<div class="operations__icon operations__icon--3">
					<svg>
              <use
							xlink:href="${pageContext.request.contextPath}/img/icons.svg#icon-user-x"></use>
            </svg>
				</div>
				<h5 class="operations__header">No longer need your account? No
					problem! Close it instantly.</h5>
				<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa
					qui officia deserunt mollit anim id est laborum. Ut enim ad minim
					veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
					ex ea commodo consequat.</p>
			</div>
		</div>
	</section>

	<section class="section" id="section--3">
		<div class="section__title section__title--testimonials">
			<h2 class="section__description">Not sure yet?</h2>
			<h3 class="section__header">Millions of Bankists are already
				making their lifes simpler.</h3>
		</div>

		<div class="slider">
			<div class="slide">
				<div class="testimonial">
					<h5 class="testimonial__header">Best financial decision ever!</h5>
					<blockquote class="testimonial__text">Lorem ipsum
						dolor sit, amet consectetur adipisicing elit. Accusantium quas
						quisquam non? Quas voluptate nulla minima deleniti optio ullam
						nesciunt, numquam corporis et asperiores laboriosam sunt,
						praesentium suscipit blanditiis. Necessitatibus id alias
						reiciendis, perferendis facere pariatur dolore veniam autem esse
						non voluptatem saepe provident nihil molestiae.</blockquote>
					<address class="testimonial__author">
						<img src="${pageContext.request.contextPath}/img/user-1.jpg"
							alt="" class="testimonial__photo">
						<h6 class="testimonial__name">Aarav Lynn</h6>
						<p class="testimonial__location">San Francisco, USA</p>
					</address>
				</div>
			</div>

			<div class="slide">
				<div class="testimonial">
					<h5 class="testimonial__header">The last step to becoming a
						complete minimalist</h5>
					<blockquote class="testimonial__text">Quisquam itaque
						deserunt ullam, quia ea repellendus provident, ducimus neque ipsam
						modi voluptatibus doloremque, corrupti laborum. Incidunt numquam
						perferendis veritatis neque repellendus. Lorem, ipsum dolor sit
						amet consectetur adipisicing elit. Illo deserunt exercitationem
						deleniti.</blockquote>
					<address class="testimonial__author">
						<img src="${pageContext.request.contextPath}/img/user-2.jpg"
							alt="" class="testimonial__photo">
						<h6 class="testimonial__name">Miyah Miles</h6>
						<p class="testimonial__location">London, UK</p>
					</address>
				</div>
			</div>

			<div class="slide">
				<div class="testimonial">
					<h5 class="testimonial__header">Finally free from old-school
						banks</h5>
					<blockquote class="testimonial__text">Debitis, nihil
						sit minus suscipit magni aperiam vel tenetur incidunt commodi
						architecto numquam omnis nulla autem, necessitatibus blanditiis
						modi similique quidem. Odio aliquam culpa dicta beatae quod
						maiores ipsa minus consequatur error sunt, deleniti saepe aliquid
						quos inventore sequi. Necessitatibus id alias reiciendis,
						perferendis facere.</blockquote>
					<address class="testimonial__author">
						<img src="${pageContext.request.contextPath}/img/user-3.jpg"
							alt="" class="testimonial__photo">
						<h6 class="testimonial__name">Francisco Gomes</h6>
						<p class="testimonial__location">Lisbon, Portugal</p>
					</address>
				</div>
			</div>

			<button class="slider__btn slider__btn--left">&larr;</button>
			<button class="slider__btn slider__btn--right">&rarr;</button>
			<div class="dots"></div>
		</div>
	</section>

	<section class="section section--sign-up">
		<div class="section__title">
			<h3 class="section__header">The best day to join Bankist was one
				year ago. The second best is today!</h3>
		</div>
		<button class="btn btn--show-modal">Open your free account
			today!</button>
	</section>

	<footer class="footer">
		<ul class="footer__nav">
			<li class="footer__item"><a class="footer__link" href="#">About</a>
			</li>
			<li class="footer__item"><a class="footer__link" href="#">Pricing</a>
			</li>
			<li class="footer__item"><a class="footer__link" href="#">Terms
					of Use</a></li>
			<li class="footer__item"><a class="footer__link" href="#">Privacy
					Policy</a></li>
			<li class="footer__item"><a class="footer__link" href="#">Careers</a>
			</li>
			<li class="footer__item"><a class="footer__link" href="#">Blog</a>
			</li>
			<li class="footer__item"><a class="footer__link" href="#">Contact
					Us</a></li>
		</ul>
		<img src="${pageContext.request.contextPath}/img/icon.png" alt="Logo"
			class="footer__logo">
		<p class="footer__copyright">&copy; Copyright by Sarah Petit</p>
	</footer>

	
	
	</jsp:attribute></m:master>
