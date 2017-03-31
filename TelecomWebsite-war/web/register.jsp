<%-- 
    Document   : register
    Created on : 30 Mar, 2017, 8:05:11 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<script type="text/javascript">
    function validatePassword() {
        var password = document.getElementById("password").value, confirm_password = document.getElementById("confirm_password").value;
        if (password != confirm_password) {
            document.getElementById("confirm_password").setCustomValidity("Passwords Don't Match");
        } else {
            document.getElementById("confirm_password").setCustomValidity('');
        }
    }
</script>
<form action="RmiClient" method="post">
    <b class="col-4">Name:</b>
    <input type="text" name="name" placeholder="First_name  Last_name"  class ="col-8" autofocus/>

    <b class="col-4">D.O.B.:</b>
    <input type="date" name="dob" placeholder="enter your date of birth here" class ="col-8"/>

    <b class="col-4">Address:</b> 
    <textarea name="address" rows="4" placeholder="enter your address here" class ="col-8"></textarea>

    <b class="col-4">Network Circle:</b>
    <input list="Network_Circle" class ="col-8" name="network_circle">
    <datalist id="Network_Circle">
        <option value="Mumbai">
        <option value="Kalyan">
        <option value="Aurangabad">
        <option value="Pune">
    </datalist>

    <b class="col-4" placeholder="Adhar Number">Aadhar Number:</b>
    <input type="number" max="999999999999" min="100000000000" class="col-8" name="aadhar" placeholder="Aadhar Number">

    <b class="col-4">Email:</b>
    <input type="email" name="email" placeholder="Email" class ="col-8">

    <b class="col-4">Connection Type:</b>
    <input type="radio" name="Connection_type" value="0" checked>Pre-paid<br>
    <input type="radio" name="Connection_type" value="1">Post-paid<br>


    <b class="col-4">Password:</b>
    <input id="password" type="password" name="password" onkeyup="validatePassword()" placeholder="password" class ="col-8">

    <b class="col-4">Confirm Password:</b>
    <input id="confirm_password" type="password" onkeyup="validatePassword()" placeholder="password" class ="col-8">

<!--    <b class="col-4">Photo:</b>
    <input class="col-8" type="file" name="fileupload" value="fileupload" id="fileupload">-->

    <input class="col-12" type="submit" value="Submit">
</form> 


<%@ include file="footer.jsp" %>
