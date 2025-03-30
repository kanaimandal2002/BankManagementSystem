<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
</head>
<body>
    <h2>Welcome, Staff!</h2>
    <ul>
        <li><a href="processDeposits.jsp">Process Deposits</a></li>
        <li><a href="processWithdrawals.jsp">Process Withdrawals</a></li>
        <li><a href="manageFD.jsp">Manage Fixed Deposits</a></li>
    </ul>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
