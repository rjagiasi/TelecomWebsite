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
<%    Cookie[] cookies_list = null;
    cookies_list = request.getCookies();
    int pre_post = 0;
    int found_cookie = 0;
    int user_id = -1;
    for (Cookie cookie : cookies_list) {
        if (cookie.getName().equals("user_id")) {
            user_id = Integer.parseInt(cookie.getValue());
        }

        if (cookie.getName().equals("pre_post")) {
            pre_post = Integer.parseInt(cookie.getValue());
            if (pre_post == 0) {
%>
<p>Prepaid Account</p>
<%
} else {
%>
<p>Postpaid Account</p>
<%
        }
    }
    if (cookie.getName().equals("name")) {
        found_cookie = 1;
%>
<p id="loggedin_username">Name: <%=cookie.getValue()%></p>
<%
        }
    }

    if (found_cookie == 0) {
%>
<p>Incorrect phone no or Password</p>
<%
    }
%>

<script>
    if (window.XMLHttpRequest) {
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = processrequest;
        httpRequest.open('GET', 'GetDashboard', true);
        httpRequest.send(null);

    }


    function processrequest() {
        // process the server response
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            var xml = httpRequest.responseXML;

//                var node = xml.getElementsByTagName('phone_no').item(0);
//                var childnodes = node.childNodes;
//                var txt = "Phone No : " + childnodes[0].data

            var txt = "";

            var root = xml.getElementsByTagName('dashboard')[0];
            var children = root.childNodes;
            for (var i = 0; i < children.length; i++) {
//                    alert(children[i].childNodes[0].data);
//                    alert(children[i].tagName);
                if (i != 4)
                    txt += "<p><b>" + children[i].tagName.replace(/_/g, " ") + " : </b>" + children[i].childNodes[0].data;

                if (i == 1)
                    txt += " &#x20b9;";
                else if (i == 2)
                    txt += " MB";

                if (i != 4)
                    txt += "</p>";

                if (i == 4) {
                    var packs = children[i].getElementsByTagName('Pack');
                    txt += "<br/><p style=\"font-size: 20px; color: #01579B;\">" + children[i].tagName.replace(/_/g, " ") + "</p>";

                    txt += "<div id=\"pack_details_div\"><table id = \"pack_details_table\"><tr>";

                    var topics = packs[0].childNodes;
                    for (var k = 0; k < topics.length; k++) {
                        txt += "<th>" + topics[k].tagName.replace(/_/g, " ") + "</th>";
                    }
                    txt += "</tr>";

                    for (var j = 0; j < packs.length; j++) {
                        var pack_detail_nodes = packs[j].childNodes;

                        txt += "<tr>";

                        for (var k = 0; k < pack_detail_nodes.length; k++) {
                            txt += "<td>" + pack_detail_nodes[k].childNodes[0].data + "</td>";
                        }

                        txt += "</tr>";
                    }

                    txt += "</table></div>";
                }
            }


            document.getElementById("ac_details").innerHTML = txt;
        }
    }


</script>

<div id="ac_details"></div>

<%@ include file="footer.jsp" %>
