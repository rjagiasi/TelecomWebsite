<%-- 
    Document   : index
    Created on : Mar 26, 2017, 9:07:43 PM
    Author     : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ include file="header.jsp" %>
<%  for (Cookie cookie : request.getCookies()) {
        if (cookie.getName().equals("user_id")) {
            response.sendRedirect("home.jsp");
        }
    }
%>
<div class="col-8">
    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="imgs/adv1.png" style="width:100%">
        </div>

        <div class="mySlides fade">
            <img src="imgs/adv2.png" style="width:100%">
        </div>
    </div>
    <br>
    <div style="text-align:center">
        <span class="dot"></span> 
        <span class="dot"></span> 
    </div>
</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000);
}
</script>

<div class="col-4">
    <form action="LoginServlet" method="post">
        <input type="text" name="username" id="username" class="col-12" placeholder="Phone Number">
        <input type="password" name="password" id="password" class="col-12" placeholder="Password"><br><br>
        <input type="submit" value="Login" class="col-12">
    </form>
</div>

<%@ include file="footer.jsp" %>

