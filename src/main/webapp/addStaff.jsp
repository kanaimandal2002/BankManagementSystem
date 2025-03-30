<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Staff - Manager</title>
</head>
<body>
    <h2>Add New Staff</h2>
    <form action="addStaffServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>
        <label>Password:</label>
        <input type="password" name="password" required><br><br>
        <label>Role:</label>
        <select name="role">
            <option value="Staff">Staff</option>
        </select><br><br>
        <button type="submit">Add Staff</button>
    </form>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
