<%-- 
    Document   : index
    Created on : Mar 26, 2017, 9:07:43 PM
    Author     : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
	Hello
        <form action="LoginServlet" method="post">
            <input type="text" name="username"><br><br>
            <input type="password" name="password"><br><br>
            <input type="submit" value="Login">
        </form>
<%@ include file="footer.jsp" %>

