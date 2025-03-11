package org.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/getProfilePicture")
public class GetProfilePictureServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id"); // Get user ID from request
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT profile_picture FROM users WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, Integer.parseInt(userId));
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    byte[] profilePictureBytes = rs.getBytes("profile_picture");
                    if (profilePictureBytes != null) {
                        response.setContentType("image/jpeg");  // Set the content type for images
                        response.getOutputStream().write(profilePictureBytes);  // Write image to response stream
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
