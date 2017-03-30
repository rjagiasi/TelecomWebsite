<%-- 
    Document   : home
    Created on : 30 Mar, 2017, 8:50:21 PM
    Author     : rohan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="loginBeanPackage.LoginSessionBeanLocal"%>
<%@page import="loginBeanPackage.LoginSessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
    Cookie[] cookies = null;
    cookies = request.getCookies();
    int found = 0;
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("name")) {
            found = 1;
%>
<p>Welcome <%=cookie.getValue()%></p>
<%
        }
    }

    if (found == 0) {
%>
<p>Incorrect Phone No or Password</p>
<%
    }
%>
<%@ include file="footer.jsp" %>
