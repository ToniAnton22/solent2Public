<%-- 
    Document   : jspexample3-modify
    Created on : 4 Nov 2021, 14:38:19
    Author     : Brother
--%>

<%-- 
    Document   : example3-modify
    Created on : 4 Nov 2021, 14:36:32
    Author     : Brother
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.solent.oodd.webexercise1.model.User" %>
<%
    // retreive the stored users list from the session
    List<User> users = (List<User>) session.getAttribute("usersList");
    if (users == null) {
        users = new ArrayList<User>();
        session.setAttribute("usersList", users);
    }
    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");
    String index = request.getParameter("index");
    int i = Integer.parseInt(index);
    User newUser = users.get(i);
    // find what action to perform on the page
    String action = request.getParameter("action");
    if ("modifyUser".equals(action)) {
        newUser.setAddress(address);
        newUser.setName(name);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3d</title>
    </head>
    <body>
        <h1>Modify User table</h1>

        <h2>Modify user</h2>
        <form action="./jspexample3-modify.jsp" method="get">
            <p>user name <input type="text" name="userName" value="<%= newUser.getName()%>"></p>
            <p>user address <input type="text" name="userAddress" value="<%= newUser.getAddress()%>"></p>
            <input type="hidden" name="action" value="modifyUser">
            <input type="hidden" name="index" value="<%=index%>">
            <button type="submit" >modify user</button>
        </form> 
        <br>
        <form action="./jspexample3.jsp" method="get">
            <button type="submit" >return to user list</button>
        </form> 
        <br>
        <a href="./" >back to index page</a>
    </body>
</html>