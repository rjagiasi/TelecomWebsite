<%-- 
    Document   : show_info
    Created on : 31 Mar, 2017, 10:57:15 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<p> This is your phone number : <b>
<%
    out.println(request.getAttribute("number"));
%>
</b></p>

<p>Login with this number and password given earlier</p>

<%@ include file="footer.jsp" %>