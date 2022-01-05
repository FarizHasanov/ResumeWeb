<%--
  Created by IntelliJ IDEA.
  User: FarizHasanov
  Date: 26.12.2021
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.company.entity.User" %>
<%@page import="com.company.dao.inter.UserDaoInter" %>
<%@page import="com.mycompany.main.Context" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/users.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>JSP Page</title>

</head>
<body>
<%
    UserDaoInter userDao = Context.instanceUserDao();
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityIdStr = request.getParameter("nId");
    Integer nationalityId = null;
    if (nationalityIdStr != null && !nationalityIdStr.trim().isEmpty()) {
        nationalityId = Integer.parseInt(nationalityIdStr);
    }
    List<User> list = userDao.getAll(name, surname, nationalityId);
%>

<div class="container mycontainer">
    <div class="row">
        <div class="col-4">
            <form action="users.jsp" method="GET">
                <div class="form-group">
                    <label style="color: indigo">Name</label>
                    <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label style="color: indigo">Surname</label>
                    <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search">
            </form>
        </div>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th style="color: teal">NAME</th>
                <th style="color: teal">SURNAME</th>
                <th style="color: teal">NATIONALITY</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User u : list) {
            %>
            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td><%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%>
                </td>
                <td>
                    <form action="userdetails" method="POST">
                        <input type="hidden" name="id" value="<%=u.getId()%>"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button class="btn btn-danger" type="submit" value="delete">
                            <i class="fas fa-user-minus"></i>
                        </button>
                    </form>
                    <form action="userdetails" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>"/>
                        <input type="hidden" name="action" value="update"/>
                        <button class="btn btn-secondary" type="submit" value="update">
                            <i class="fas fa-user-edit"></i>
                        </button>
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
