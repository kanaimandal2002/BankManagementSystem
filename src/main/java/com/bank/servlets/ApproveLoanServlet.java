package com.bank.servlets;

import com.bank.utils.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/approveLoanServlet")
public class ApproveLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loanId = request.getParameter("loanId");
        String status = request.getParameter("status");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE loan_requests SET status=? WHERE loan_id=?");
            ps.setString(1, status);
            ps.setString(2, loanId);
            ps.executeUpdate();
            response.sendRedirect("approveLoans.jsp");  // Redirect after processing loan
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("approveLoans.jsp?error=Error Processing Loan");
        }
    }
}
