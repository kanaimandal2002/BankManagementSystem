package com.bank.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bank.utils.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoanActionServlet")
public class LoanActionServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String loanId = request.getParameter("loanId");
        String action = request.getParameter("action");

        if (loanId == null || action == null) {
            response.sendRedirect("approveLoans.jsp?error=missing");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE loan_requests SET status = ? WHERE id = ?"
            );
            ps.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            ps.setInt(2, Integer.parseInt(loanId));
            ps.executeUpdate();
            response.sendRedirect("approveLoans.jsp?status=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("approveLoans.jsp?error=exception");
        }
    }
}
