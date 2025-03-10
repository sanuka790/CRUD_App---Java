<%--
  Created by IntelliJ IDEA.
  User: Sanuka Wasala
  Date: 3/10/2025
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Update User</title>
</head>
<body>

<h2>Update User</h2>

<form action="updateUser" method="post">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" required value="<%= request.getParameter("username") %>"><br><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required value="<%= request.getParameter("password") %>"><br><br>

    <input type="submit" value="Update User">
</form>

<br>
<a href="manageUsers.jsp">Go back to manage users</a>

</body>
</html>

