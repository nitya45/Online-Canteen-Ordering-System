<%-- 
    Document   : dashboard
    Created on : Apr 29, 2025, 8:52:55 PM
    Author     : prince rajput
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard-container {
            margin-top: 80px;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        .dashboard-container h2 {
            font-weight: 700;
            color: #343a40;
        }
        .btn-custom {
            margin: 10px 10px 0 0;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
<div class="container dashboard-container">
    <h2 class="text-center mb-4">Admin Dashboard</h2>
    <div class="text-center">
        <a href="addRemoveItems.jsp" class="btn btn-success btn-custom">Add and Remove Item</a>
        <a href="viewCurrentOrders.jsp" class="btn btn-warning btn-custom">View Current Orders</a>
        <a href="../adminPanel.jsp" class="btn btn-primary btn-custom">All Orders</a>
        <a href="viewMenuItems.jsp" class="btn btn-info btn-custom">All Menu Items</a>
        <a href="../logout.jsp" class="btn btn-danger btn-custom">Logout</a>
    </div>
</div>
</body>
</html>

