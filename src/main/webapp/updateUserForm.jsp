<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/updateuserform.css">
    <title>Update User</title>
</head>
<body>

<h2>Update User</h2>

<!-- Form to update the user details -->
<form action="updateUser" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" required value="<%= request.getParameter("username") %>"><br><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required value="<%= request.getParameter("password") %>"><br><br>

    <label for="profilePicture">Profile Picture (Leave blank if no change):</label><br>
    <input type="file" id="profilePicture" name="profilePicture" accept="image/*"><br><br>

    <input type="submit" value="Update User">
</form>

<!-- Navigation Links as Buttons -->
<br>
<a href="manageUsers.jsp" class="button">Go back to manage users</a>

</body>
</html>
