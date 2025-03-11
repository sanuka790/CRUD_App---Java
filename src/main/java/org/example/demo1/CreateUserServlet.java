package org.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lombok.SneakyThrows;

import java.io.*;
import java.sql.*;

@WebServlet("/createUser")
@MultipartConfig  // Enable multipart form data for file uploads
public class CreateUserServlet extends HttpServlet {

    @SneakyThrows
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the file part from the request
        Part filePart = request.getPart("profilePicture");  // "profilePicture" is the form input field name for the file
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Convert the uploaded file into a byte array
        byte[] profilePictureBytes = null;
        if (filePart != null) {
            InputStream inputStream = filePart.getInputStream();  // Get the input stream of the uploaded file
            profilePictureBytes = new byte[inputStream.available()];
            inputStream.read(profilePictureBytes);  // Read the file into the byte array
        }

        // Insert the user data into the database, including the profile picture as BLOB
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO users (username, password, profile_picture) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setBytes(3, profilePictureBytes);  // Set the byte array as the BLOB
                stmt.executeUpdate();
            }
        }

        // Redirect to the user list page
        response.sendRedirect("userList.jsp");
    }
}
