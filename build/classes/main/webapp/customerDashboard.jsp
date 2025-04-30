<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
</head>
<body>
    <h1>Welcome Customer</h1>
    <%
    String loanStatus = request.getParameter("loan");
    if ("submitted".equals(loanStatus)) {
%>
    <p style="color:green;">✅ Loan request submitted successfully!</p>
<% } %>
    
    <ul>
        <li><a href="#">View Account Details</a></li>
        <li><a href="#">Request Info Update</a></li>
        <li><a href="#">Apply for FD / RD</a></li>
        <li><a href="requestLoan.jsp">Apply for Loan</a></li>

        <li><a href="#">Submit Grievance</a></li>
    </ul>
</body>
</html>
