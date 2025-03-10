package org.example.demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/LoginDB";
    private static final String DB_USERNAME = "root"; // Default MySQL username
    private static final String DB_PASSWORD = "mysql"; // Your DB password

    // Method to get a database connection
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Loading the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing the connection to the database
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            System.out.println("Database connection successful!"); //Small debugging statement
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found: " + e.getMessage());
        }

        return connection;
    }
}

