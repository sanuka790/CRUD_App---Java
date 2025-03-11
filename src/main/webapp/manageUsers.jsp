<%--
  Created by IntelliJ IDEA.
  User: Sanuka Wasala
  Date: 3/10/2025
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="org.example.demo1.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/manageusers.css">
    <title>Manage Users</title>
</head>
<body>

<h2>Manage Users</h2>

<!-- Form to create a new user -->
<h3>Create New User</h3>
<form action="createUser" method="post" enctype="multipart/form-data">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br><br>

    <label for="profilePicture">Profile Picture:</label><br>
    <input type="file" id="profilePicture" name="profilePicture" accept="image/*"><br><br>

    <input type="submit" value="Create User">
</form>

<hr>

<!-- Table to display all users -->
<h3>All Users</h3>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Password</th>
        <th>Profile Picture</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users";
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String profilePicture = rs.getString("profile_picture"); // The path to the profile picture
    %>
    <tr>
        <td><%= id %></td>
        <td><%= username %></td>
        <td><%= password %></td>
        <td>

            <img src="getProfilePicture?id=<%= id %>" width="50" height="50"  alt="*"/>
        </td>


        <td>
            <!-- Link to update user -->
            <a href="updateUserForm.jsp?id=<%= id %>">Update</a> |
            <!-- Link to delete user -->
            <a href="deleteUser?id=<%= id %>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
        </td>
    </tr>
    <%
                }
            }
        } catch (SQLException e) {
            out.println("Error fetching data - " + e.getMessage());
        }
    %>
    </tbody>
</table>

<br>
<a href="index.jsp">Go back to login</a>

</body>
</html>
