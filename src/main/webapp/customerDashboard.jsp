<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
</head>
<body>
    <h2>Welcome, Customer!</h2>
    <ul>
        <li><a href="viewAccountDetails.jsp">View Account Details</a></li>
        <li><a href="requestLoan.jsp">Request Loan</a></li>
        <li><a href="applyFD.jsp">Apply for Fixed Deposit</a></li>
    </ul>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
