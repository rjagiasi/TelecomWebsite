<%-- 
    Document   : header
    Created on : 29 Mar, 2017, 1:09:34 AM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/global.css">
    </head>
    <body>

        <header>
            <h1 style="display: inline-block;">Telecom</h1>
            <img src="imgs/logo.png" alt="Logo" id="logo" />
        </header>

        <div class="row" id="middle_section">
            <nav class="col-3 col-m-1 menu">
                <ul>

                    <%
                        Cookie[] cookies = null;
                        cookies = request.getCookies();
                        int found = 0;
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("name")) {
                                    found = 1;
                    %>
                    <li><a href="Logout">Logout</a></li>
                    <li><a href="home.jsp">Dashboard</a></li>
                        <%
                            }

                            if (cookie.getName().equals("pre_post")) {
                                if (Integer.parseInt(cookie.getValue()) == 0) {
                        %>
                    <li><a href="recharge.jsp">Recharge</a></li>
                        <%
                        } else {
                        %>
                    <li><a href="Bill">Bill Payment</a></li>
                        <%
                                        }
                                    }

                                }
                            }

                            if (found == 0) {
                        %>
                    <li><a href="index.jsp">Login</a></li>
                    <li><a href="register.jsp">New Connection</a></li>
                        <%
                            }
                        %>



                    <!--				<li>Prepaid</li>
                                                    <li>Postpaid</li>
                                                    <li>My Account</li>
                                                    <li>Recharge</li>-->
                    <li><a href="contact.jsp">Find a Store</a></li>
                </ul>
            </nav>

            <main id="feed" class="col-9 col-m-2">

