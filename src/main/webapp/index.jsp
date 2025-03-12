<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <title>Login</title>
</head>
<body>
<div class="login-container">
    <h2>Login Page</h2>

    <form action="login" method="post">
        <div class="input-container">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required placeholder="Enter your username">
        </div>

        <div class="input-container">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password">
        </div>

        <input type="submit" value="Login" class="submit-btn">
    </form>
</div>
</body>
</html>
