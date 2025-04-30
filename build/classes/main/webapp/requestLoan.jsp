<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Loan</title>
</head>
<body>
    <h2>Loan Application</h2>

    <form action="RequestLoanServlet" method="post">
        <label>Amount (₹):</label>
        <input type="number" name="amount" step="1000" required><br><br>

        <button type="submit">Submit Request</button>
    </form>

    <br><a href="customerDashboard.jsp">← Back to Dashboard</a>
</body>
</html>


