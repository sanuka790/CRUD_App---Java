
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="org.example.demo1.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/userlist.css">
    <title>All Users</title>
</head>
<body>

<h2>All Users</h2>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Password</th>
        <th>Profile Picture</th>
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
    %>
    <tr>
        <td><%= id %></td>
        <td><%= username %></td>
        <td><%= password %></td>
        <td>
            <img src="getProfilePicture?id=<%= id %>" width="50" height="50"  alt="*"/>
        </td>

    </tr>
    <%
                }
            }
        } catch (SQLException e) {
            out.println("Error fetching data: " + e.getMessage());
        }
    %>
    </tbody>
</table>

<br>
<a href="index.jsp" class="button">Go back to login</a>

<br>
<a href="manageUsers.jsp" class="button">Manage Users</a>



</body>
</html>

