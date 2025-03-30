<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
</head>
<body>
    <h2>Welcome, Manager!</h2>
    <ul>
        <li><a href="addStaff.jsp">Add Staff</a></li>
        <li><a href="approveLoans.jsp">Approve Loans</a></li>
        <li><a href="manageCustomers.jsp">Manage Customers</a></li>
    </ul>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
