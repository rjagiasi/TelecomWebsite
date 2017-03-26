<%-- 
    Document   : index
    Created on : Mar 26, 2017, 9:07:43 PM
    Author     : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet" method="post">
            <input type="text" name="username"><br><br>
            <input type="password" name="password"><br><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
