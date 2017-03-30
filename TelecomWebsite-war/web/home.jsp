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
    Cookie[] cookies_list = null;
    cookies_list = request.getCookies();
    int found_cookie = 0;
    for (Cookie cookie : cookies_list) {
        if (cookie.getName().equals("name")) {
            found_cookie = 1;
%>
<p>Welcome <%=cookie.getValue()%></p>
<%
        }
    }

    if (found_cookie == 0) {
%>
<p>Incorrect Phone No or Password</p>
<%
    }
%>
<%@ include file="footer.jsp" %>
