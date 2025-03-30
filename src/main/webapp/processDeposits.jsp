<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Process Deposit</title>
</head>
<body>
    <h2>Deposit Money</h2>
    <form action="depositServlet" method="post">
        <label>Account Number:</label>
        <input type="text" name="accountNumber" required><br><br>
        <label>Amount:</label>
        <input type="text" name="amount" required><br><br>
        <button type="submit">Deposit</button>
    </form>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
