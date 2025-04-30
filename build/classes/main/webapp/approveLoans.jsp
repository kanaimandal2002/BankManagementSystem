<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bank.utils.DBConnection" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Approve Loan Requests</title>
</head>
<body>
    <h2>Loan Requests (Pending)</h2>

    <%
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM loan_requests WHERE status = 'Pending'"
            );
            ResultSet rs = ps.executeQuery();
    %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Amount</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("customer_username") %></td>
                <td><%= rs.getDouble("amount") %></td>
                <td>
                    <form action="LoanActionServlet" method="post" style="display:inline;">
                        <input type="hidden" name="loanId" value="<%= rs.getInt("id") %>">
                        <button type="submit" name="action" value="approve">Approve</button>
                        <button type="submit" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    <%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching loan requests.</p>");
            e.printStackTrace();
        }
    %>

    <br><a href="managerDashboard.jsp">← Back to Dashboard</a>
</body>
</html>

