<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
</jsp:attribute>
	<jsp:attribute name="content">
            <button style="margin-top: 6%;" class="btn--close-modal" onclick="home();">&times;</button>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  margin: 0;
 
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
  
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
.header{
width: 100%;
}
p{
color: white;
}

</style>
</head>
<body>

<header class="header">
        <nav>
           <img src="${pageContext.request.contextPath}/img/bank2221.png" alt="prospera bank" width="800" >
        </nav>
    </header>
  

    <section class="hero">
        <div class="container">
            <h1>About Us</h1>
            <h6>Your Trusted Financial Partner</h6>
        </div>
    </section>

    <div class="container">
        <section class="about-section">
            <h2>Our History</h2>
            <p>prospera has been a trusted financial institution since 2010. Over the years, we have grown and evolved, always staying true to our core values of integrity, excellence, and customer-centricity.</p>
        </section>

        <section class="about-section">
            <h2>Our Mission</h2>
            <p>At Prospera bank, our mission is to empower individuals, businesses, and communities to achieve their financial goals. We are committed to providing innovative banking solutions and exceptional customer service.</p>
        </section>

        <section class="about-section">
            <h2>Our Vision</h2>
            <p>Our vision is to be the bank of choice for all our stakeholders. We aim to be a leading financial institution known for our reliability, innovation, and social responsibility.</p>
        </section>

        <section class="about-section">
            <h2>Core Values</h2>
            <ul>
                <li><strong>Integrity:</strong> We conduct our business with the highest ethical standards, ensuring transparency and trust in all our interactions.</li>
                <li><strong>Excellence:</strong> We strive for excellence in everything we do, from our products and services to our customer support.</li>
                <li><strong>Customer-Centricity:</strong> Our customers are at the heart of everything we do. We are dedicated to meeting their needs and exceeding their expectations.</li>
            </ul>
        </section>

        <section class="about-section">
        <br><br>
            <h2>Our Team</h2>
            <p>Meet the talented individuals who make Prospera bank a success. Our team is comprised of experienced professionals who are passionate about finance and dedicated to serving you.</p>
        </section>

        <!-- Add more sections for Community Involvement, Financial Strength, Careers, Contact Us, Visit Us, News, Privacy Policy, Legal Information, and Feedback as needed -->

    </div>


<h2 style="text-align:center">Our Team</h2>
<div class="row">
   <div class="column">
    <div class="card">
     <img src="${pageContext.request.contextPath}/img/emp1.webp" alt="Jane" style="width:100%">
      <div class="container">
        <h2>John Doe</h2>
        <pre class="title">Designer</pre>
        <pre>Some text that describes me lorem 
ipsum ipsum lorem.</pre>
        <pre>john@example.com</pre>
        <pre><button class="button">Contact</button></pre>
      </div>
    </div>
  </div>

   <div class="column">
    <div class="card">
     <img src="${pageContext.request.contextPath}/img/emp1.webp" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Dustin Black</h2>
        <pre class="title">Developer</pre>
        <pre>Some text that describes me lorem 
ipsum ipsum lorem.</pre>
        <pre>dustin@example.com</pre>
        <pre><button class="button">Contact</button></pre>
      </div>
    </div>
  </div>
    
    
    
    
    
    <div class="column">
    <div class="card">
     <img src="${pageContext.request.contextPath}/img/emp1.webp" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Mike Wheeler</h2>
        <pre class="title">Designer</pre>
        <pre>Some text that describes me lorem 
ipsum ipsum lorem.</pre>
        <pre>mike@example.com</pre>
        <pre><button class="button">Contact</button></pre>
      </div>
    </div>
  </div>
  
  
  </div>
  
  

    <footer class="footer">
        <div class="container">
            <p>&copy; prospera bank  2023</p>
</div>
    </footer>

</body>
	</jsp:attribute></m:master>
