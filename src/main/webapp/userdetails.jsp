<%--
  Created by IntelliJ IDEA.
  User: FarizHasanov
  Date: 27.12.2021
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.company.entity.User" %>
<%@page import="com.company.dao.inter.UserDaoInter" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@page import="com.mycompany.main.Context" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
%>
<div>
    <form action="userdetails" method="POST">
        <input type="hidden" name="id" value="<%=user.getId()%>"/>
        <label>name</label>
        <input type="text" name="name" value="<%=user.getName()%>"/>
        </br> </br>
        <label>surname</label>
        <input type="text" name="surname" value="<%=user.getSurname()%>"/>
        <input type="submit" name="save" value="Save">
    </form>
</div>
</body>
</html>