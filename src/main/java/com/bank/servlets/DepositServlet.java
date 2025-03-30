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

@WebServlet("/depositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE accounts SET balance = balance + ? WHERE account_number = ?");
            ps.setDouble(1, amount);
            ps.setString(2, accountNumber);
            ps.executeUpdate();
            response.sendRedirect("staffDashboard.jsp");  // Redirect after deposit
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("processDeposits.jsp?error=Error Processing Deposit");
        }
    }
}
