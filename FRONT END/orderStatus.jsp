<%-- 
    Document   : orderStatus
    Created on : May 1, 2025, 9:30:14 AM
    Author     : prince rajput


<%@page import="dao.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%@ page session="true" %>
<%
    String mobile = (String)session.getAttribute("mobile");

    String orderStatus = "Preparing"; // Default
    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT order_status FROM orders WHERE mobile = ? ORDER BY order_time DESC FETCH FIRST 1 ROWS ONLY");
        ps.setString(1, mobile);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            orderStatus = rs.getString("order_status");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Status</title>
    <meta http-equiv="refresh" content="5"> <!-- Refresh every 5 seconds -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container text-center mt-5">
    <div class="card shadow-lg p-5">
        <h2>Order Status for <b><%= session.getAttribute("username") %></b></h2>
        <h4 class="mt-4">
            <% if(orderStatus.equalsIgnoreCase("Preparing")) { %>
                <span class="badge bg-warning text-dark">Preparing ??</span>
            <% } else if(orderStatus.equalsIgnoreCase("Ready")) { %>
                <span class="badge bg-primary">Ready ?</span>
            <% } else if(orderStatus.equalsIgnoreCase("Delivered")) { %>
                <span class="badge bg-success">Delivered ??</span>
            <% } else { %>
                <span class="badge bg-secondary">Unknown</span>
            <% } %>
        </h4>
        <p class="mt-3">This page refreshes automatically every 5 seconds ?</p>
    </div>
</div>

</body>
</html>
--%>  <%-- 
<%@ page import="dao.DBConnection" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%@ page session="true" %>
<%
    String mobile = (String)session.getAttribute("mobile");
    String username = (String)session.getAttribute("username");
    String orderStatus = "Preparing";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "SELECT order_status FROM orders WHERE mobile = ? ORDER BY order_time DESC FETCH FIRST 1 ROWS ONLY")) {
        ps.setString(1, mobile);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) orderStatus = rs.getString("order_status");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    int progress;
String statusLower = orderStatus.toLowerCase();
if ("preparing".equals(statusLower)) {
    progress = 33;
} else if ("ready".equals(statusLower)) {
    progress = 66;
} else if ("delivered".equals(statusLower)) {
    progress = 100;
} else {
    progress = 0;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Order Status</title>
  <meta http-equiv="refresh" content="5" />
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- AOS -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>AOS.init({ duration: 600, once: true });</script>
</head>
<body class="bg-gray-900 text-white font-sans flex items-center justify-center min-h-screen">
     <%@ include file="navbar.jsp" %>
  <div class="relative p-8 bg-gray-800 bg-opacity-60 backdrop-blur-lg rounded-2xl shadow-2xl transform transition-transform duration-500 hover:scale-105" data-aos="zoom-in">
    <h2 class="text-3xl font-bold text-center mb-4">Order Status for <span class="text-indigo-400"><%=username%></span></h2>
    <div class="flex items-center justify-center space-x-4 mt-6">
      <!-- Preparing -->
      <div class="status-pill flex items-center px-4 py-2 rounded-full shadow-inner transition-all duration-300 <%=orderStatus.equalsIgnoreCase("Preparing")?"bg-yellow-500 scale-110": "bg-gray-700"%>">
        <i class="fas fa-cog animate-spin mr-2"></i>
        <span class="font-semibold">Preparing</span>
      </div>
      <!-- Ready -->
      <div class="status-pill flex items-center px-4 py-2 rounded-full shadow-inner transition-all duration-300 <%=orderStatus.equalsIgnoreCase("Ready")?"bg-blue-500 scale-110": "bg-gray-700"%>">
        <i class="fas fa-utensils mr-2"></i>
        <span class="font-semibold">Ready</span>
      </div>
      <!-- Delivered -->
      <div class="status-pill flex items-center px-4 py-2 rounded-full shadow-inner transition-all duration-300 <%=orderStatus.equalsIgnoreCase("Delivered")?"bg-green-500 scale-110": "bg-gray-700"%>">
        <i class="fas fa-check-circle mr-2"></i>
        <span class="font-semibold">Delivered</span>
      </div>
    </div>
    <!-- Progress Bar -->
    <div class="w-full bg-gray-700 rounded-full h-4 mt-8 overflow-hidden">
      <div class="h-4 bg-indigo-500 transition-all duration-1000 ease-in-out" style="width: <%=progress%>%"></div>
    </div>
    <p class="mt-2 text-center text-gray-300">Progress: <%=progress%>%</p>
    <p class="mt-4 text-center text-gray-400 italic">This page refreshes automatically every 5 seconds.</p>
  </div>

  <!-- Font Awesome -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>

--%> 
<%@ page import="dao.DBConnection" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%@ page session="true" %>
<%
    String mobile = (String)session.getAttribute("mobile");
    String username = (String)session.getAttribute("username");
    String orderStatus = "Preparing";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "SELECT order_status FROM orders WHERE mobile = ? ORDER BY order_time DESC FETCH FIRST 1 ROWS ONLY")) {
        ps.setString(1, mobile);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) orderStatus = rs.getString("order_status");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    int progress;
    String statusLower = orderStatus.toLowerCase();
    if ("preparing".equals(statusLower)) {
        progress = 33;
    } else if ("ready".equals(statusLower)) {
        progress = 66;
    } else if ("delivered".equals(statusLower)) {
        progress = 100;
    } else {
        progress = 0;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Order Status</title>
  <meta http-equiv="refresh" content="30" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>AOS.init({ duration: 800, once: true });</script>
  <style>
    body { font-family: 'Inter', sans-serif; background-color: #111827; }
    .card-3d {
      background: #1f2937;
      border-radius: 1rem;
      box-shadow: 0 10px 25px rgba(0,0,0,0.4);
      transform-style: preserve-3d;
      transition: transform 0.5s ease, box-shadow 0.5s ease;
    }
    .card-3d:hover {
      transform: perspective(1000px) rotateX(4deg) rotateY(-4deg) scale(1.03);
    }
    .progress-animate {
      animation: growBar 1s ease-out forwards;
    }
    @keyframes growBar {
      from { width: 0; }
      to { width: <%=progress%>% }
    }
  </style>
</head>
<body class="flex flex-col min-h-screen bg-gray-900 text-white">
  <%@ include file="navbar.jsp" %>
  <main class="flex-1 flex items-center justify-center p-6">
    <div class="card-3d p-8 w-full max-w-xl" data-aos="flip-left">
      <h2 class="text-3xl font-bold text-center mb-6">Order Status for <span class="text-indigo-400"><%=username%></span></h2>

      <div class="flex items-center justify-around mb-8">
        <div class="flex flex-col items-center transition transform duration-300 <%=orderStatus.equalsIgnoreCase("Preparing") ? "scale-110" : "opacity-50"%>">
          <div class="bg-yellow-500 rounded-full h-16 w-16 flex items-center justify-center shadow-lg animate-bounce">
            <i class="fas fa-cog fa-lg animate-spin"></i>
          </div>
          <p class="mt-2 text-sm">Preparing</p>
        </div>

        <div class="flex flex-col items-center transition transform duration-300 <%=orderStatus.equalsIgnoreCase("Ready") ? "scale-110" : "opacity-50"%>">
          <div class="bg-blue-500 rounded-full h-16 w-16 flex items-center justify-center shadow-lg">
            <i class="fas fa-utensils fa-lg"></i>
          </div>
          <p class="mt-2 text-sm">Ready</p>
        </div>

        <div class="flex flex-col items-center transition transform duration-300 <%=orderStatus.equalsIgnoreCase("Delivered") ? "scale-110" : "opacity-50"%>">
          <div class="bg-green-500 rounded-full h-16 w-16 flex items-center justify-center shadow-lg">
            <i class="fas fa-check fa-lg"></i>
          </div>
          <p class="mt-2 text-sm">Delivered</p>
        </div>
      </div>

      <div class="w-full bg-gray-700 rounded-full h-4 overflow-hidden">
        <div class="h-4 bg-indigo-500 progress-animate rounded-full" style="width: <%=progress%>%"></div>
      </div>
      <p class="mt-2 text-center text-indigo-300">Progress: <%=progress%>%</p>
      <p class="mt-4 text-center text-gray-400 italic">This page refreshes every 30 seconds.</p>
    </div>
  </main>

  <%@ include file="footer.jsp" %>

  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>


