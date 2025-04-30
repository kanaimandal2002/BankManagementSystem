package com.bank.servlets;

import com.bank.utils.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/RequestLoanServlet")
public class RequestLoanServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.html");
            return;
        }

        String customer = (String) session.getAttribute("username");
        String amountStr = request.getParameter("amount");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO loan_requests (customer_username, amount, status) VALUES (?, ?, 'Pending')"
            );
            ps.setString(1, customer);
            ps.setDouble(2, Double.parseDouble(amountStr));
            ps.executeUpdate();

            response.sendRedirect("customerDashboard.jsp?loan=submitted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("requestLoan.jsp?error=exception");
        }
    }
}
