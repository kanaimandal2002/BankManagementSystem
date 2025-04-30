<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Account Details</title>
</head>
<body>
    <h2>Account Details</h2>
    <p>Account Number: <%= session.getAttribute("username") %></p>
    <p>Balance: <!-- Add logic to show the balance here --></p>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
