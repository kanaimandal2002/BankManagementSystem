<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Staff - Manager</title>
</head>
<body>
    <h2>Add New Staff</h2>
    <%
    String error = request.getParameter("error");
    if ("failed".equals(error)) {
%>
    <p style="color:red;">❌ Failed to add staff. Please try again.</p>
<% } else if ("exists".equals(error)) { %>
    <p style="color:red;">⚠️ Username already exists. Choose another.</p>
<% } else if ("exception".equals(error)) { %>
    <p style="color:red;">⚠️ An error occurred. Please contact support.</p>
<% } %>
    
    <form action="addStaff" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit">Add Staff</button>
    </form>
    <br>
    <a href="managerDashboard.jsp">← Back to Dashboard</a>
</body>
</html>
