<%-- 
    Document   : show_info
    Created on : 31 Mar, 2017, 10:57:15 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>


<%
    out.println(request.getAttribute("info"));
%>


<%@ include file="footer.jsp" %>