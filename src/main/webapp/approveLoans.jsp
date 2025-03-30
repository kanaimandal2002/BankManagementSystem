<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Approve Loans</title>
</head>
<body>
    <h2>Approve Loan Requests</h2>
    <form action="approveLoanServlet" method="post">
        <label>Loan ID:</label>
        <input type="text" name="loanId" required><br><br>
        <label>Status:</label>
        <select name="status">
            <option value="Approved">Approve</option>
            <option value="Rejected">Reject</option>
        </select><br><br>
        <button type="submit">Submit</button>
    </form>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
