package org.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/updateUser")
@MultipartConfig  // Enable multipart form data for file uploads
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user data from form
        String userId = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Retrieve the uploaded file part (profile picture)
        Part filePart = request.getPart("profilePicture");  // "profilePicture" is the form field name for the file
        byte[] profilePictureBytes = null;

        if (filePart != null && filePart.getSize() > 0) {  // Check if a new file is uploaded
            // Convert the uploaded file to a byte array
            InputStream inputStream = filePart.getInputStream();
            profilePictureBytes = new byte[inputStream.available()];
            inputStream.read(profilePictureBytes);
        }

        // Update user in the database, including the profile picture if uploaded
        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE users SET username = ?, password = ?, profile_picture = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                if (profilePictureBytes != null) {
                    stmt.setBytes(3, profilePictureBytes);  // Store the profile picture as a BLOB
                } else {
                    stmt.setNull(3, java.sql.Types.BLOB);  // If no new image, set BLOB to NULL
                }
                stmt.setInt(4, Integer.parseInt(userId));
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error updating user: " + e.getMessage());
            return;
        }

        // Redirect to the user list page
        response.sendRedirect("userList.jsp");
    }
}
