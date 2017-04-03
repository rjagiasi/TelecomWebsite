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
<form action="LoginServlet" method="post">
    <label for="username" class="col-4"><b>Phone No : </b></label>
    <input type="text" name="username" id="username" class="col-8" placeholder="Phone Number">
    <label for="password" class="col-4"><b>Password :</b></label>
    <input type="password" name="password" id="password" class="col-8" placeholder="Password"><br><br>
    <input type="submit" value="Login" class="col-12">
</form>
<%@ include file="footer.jsp" %>

