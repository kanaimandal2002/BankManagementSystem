package com.bank.servlets;

import com.bank.utils.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/addStaff")
public class AddStaffServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffUsername = request.getParameter("username");
        String staffPassword = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users (username, password, role) VALUES (?, ?, 'Staff')"
            );
            ps.setString(1, staffUsername);
            ps.setString(2, staffPassword);
            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("managerDashboard.jsp?status=success");
            } else {
                response.sendRedirect("addStaff.jsp?error=failed");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            response.sendRedirect("addStaff.jsp?error=exists");
        } catch (Exception e) {
            e.printStackTrace(); // optional server log
            response.sendRedirect("addStaff.jsp?error=exception");
        }
	}
}
