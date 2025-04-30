<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
</head>
<body>

    <h1>Welcome Manager</h1>
    
    <% String status = request.getParameter("status");
   if ("success".equals(status)) { %>
    <p style="color:green;">✅ a Staff added successfully!</p>
<% } %>

    
    
    <ul>
        <li><a href="addStaff.jsp">Add Staff</a></li>

        <li><a href="#">Approve Loans</a></li>
        <li><a href="#">Authorize Cheque Payments</a></li>
        <li><a href="#">Approve Customer Signups</a></li>
        <li><a href="#">Approve FD/RD Accounts</a></li>
    </ul>
</body>
</html>
