<%-- 
    Document   : recharge
    Created on : 3 Apr, 2017, 11:09:13 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
Recharge your prepaid account<br/><br/>
<form action="Recharge" method="post">
<label for="username" class="col-4"><b>Amount : </b></label>
<input type="text" name="amount" id="amount" class="col-8" placeholder="Amount">
</form>
<%@ include file="footer.jsp" %>
