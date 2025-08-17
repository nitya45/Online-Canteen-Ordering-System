<%@ page import="dao.DBConnection" %>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userType = null;
    String userEmail = null;
    if (session != null) {
        userType = (String) session.getAttribute("userType");
        userEmail = (String) session.getAttribute("email");
    }

    Map<String, String> lastOrder = null;
    List<Map<String, String>> orderList = new ArrayList<>();
    String guestMessage = null;

    if ("guest".equalsIgnoreCase(userType) || session == null) {
        guestMessage = "First order something then see your last orders";
    } else {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM orders WHERE email = ? ORDER BY order_time DESC"
            );
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();

            boolean isFirst = true;
            while (rs.next()) {
                Map<String, String> order = new HashMap<>();
                order.put("orderId", String.valueOf(rs.getInt("id")));
                order.put("orderTime", rs.getTimestamp("order_time").toString());
                order.put("itemList", rs.getString("Food_items"));
                order.put("amount", String.format("%.2f", rs.getDouble("total_amount")));
                order.put("currentState", rs.getString("Order_status"));

                if (isFirst) {
                    lastOrder = order;
                    isFirst = false;
                } else {
                    orderList.add(order);
                }
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            guestMessage = "Error fetching orders: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #2c3e50, #4ca1af);
            color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            background-color: #1e1e1e;
            border: none;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }
        .last-order-box {
            background-color: #343a40;
            padding: 20px;
            border-radius: 12px;
            color: #ffdd57;
            box-shadow: 0 4px 12px rgba(255, 221, 87, 0.3);
        }
        .status-label {
            font-weight: bold;
            animation: blink 1s infinite alternate;
        }
        .status-confirmed { color: #4caf50; }
        .status-preparing { color: #ff9800; }
        .status-ready { color: #2196f3; }
        @keyframes blink {
            from { opacity: 1; }
            to { opacity: 0.8; }
        }
        .table th, .table td {
            vertical-align: middle;
        }
        h2, h4 {
            font-weight: 600;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container mt-5">
        <div class="card p-5">
            <h2 class="mb-4 text-warning">Your Order History</h2>

            <% if (guestMessage != null) { %>
                <div class="alert alert-info"><%= guestMessage %></div>
            <% } else if (lastOrder != null) { %>
                <h4 class="text-light">Last Order</h4>
                <div class="last-order-box">
                    <p><strong>Order ID:</strong> <%= lastOrder.get("orderId") %></p>
                    <p><strong>Date:</strong> <%= lastOrder.get("orderTime") %></p>
                    <p><strong>Items:</strong> <%= lastOrder.get("itemList") %></p>
                    <p><strong>Total Amount:</strong> ₹ <%= lastOrder.get("amount") %></p>
                    <p><strong>Status:</strong>
                        <% String status = lastOrder.get("currentState"); %>
                        <span class="status-label 
                            <%= "Confirmed".equalsIgnoreCase(status) ? "status-confirmed" : "" %>
                            <%= "Preparing".equalsIgnoreCase(status) ? "status-preparing" : "" %>
                            <%= "Ready".equalsIgnoreCase(status) ? "status-ready" : "" %>">
                            <%= status %> -
                            <%= "Confirmed".equalsIgnoreCase(status) ? "Order placed successfully." :
                                "Preparing".equalsIgnoreCase(status) ? "Your order is being prepared." :
                                "Ready".equalsIgnoreCase(status) ? "Your order is ready for pickup." : status %>
                        </span>
                    </p>
                </div>

                <% if (!orderList.isEmpty()) { %>
                    <h4 class="text-light mt-5">Previous Orders</h4>
                    <table class="table table-dark table-hover mt-3">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Items</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (Map<String, String> order : orderList) {
                            String s = order.get("currentState"); %>
                            <tr>
                                <td><%= order.get("orderId") %></td>
                                <td><%= order.get("orderTime") %></td>
                                <td><%= order.get("itemList") %></td>
                                <td>₹ <%= order.get("amount") %></td>
                                <td>
                                    <span class="status-label 
                                        <%= "Confirmed".equalsIgnoreCase(s) ? "status-confirmed" : "" %>
                                        <%= "Preparing".equalsIgnoreCase(s) ? "status-preparing" : "" %>
                                        <%= "Ready".equalsIgnoreCase(s) ? "status-ready" : "" %>">
                                        <%= s %> -
                                        <%= "Confirmed".equalsIgnoreCase(s) ? "Order placed successfully." :
                                            "Preparing".equalsIgnoreCase(s) ? "Being prepared." :
                                            "Ready".equalsIgnoreCase(s) ? "Ready for pickup." : s %>
                                    </span>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <p class="text-white">No previous orders found.</p>
                <% } %>
            <% } else { %>
                <p class="text-white">No orders found.</p>
            <% } %>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>


<%-- 
    Document   : order_history
    Created on : May 27, 2025, 2:24:28 PM
    Author     : prince rajput


<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%
    Map<String, String> lastOrder = (Map<String, String>) request.getAttribute("lastOrder");
    List<Map<String, String>> orderList = (List<Map<String, String>>) request.getAttribute("orderList");
    String guestMessage = (String) request.getAttribute("guestMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #f1f1f1;
        }
        .card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
        }
        .status-label {
            font-weight: bold;
            animation: blink 1s infinite alternate;
        }
        .status-confirmed { color: #4caf50; }
        .status-preparing { color: #ff9800; }
        .status-ready { color: #2196f3; }
        @keyframes blink {
            from { opacity: 1; }
            to { opacity: 0.8; }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card p-5 rounded">
        <h2 class="mb-4 text-white">Your Order History</h2>

        <% if (guestMessage != null) { %>
            <div class="alert alert-info"><%= guestMessage %></div>
        <% } else if (lastOrder != null) { %>
            <h4 class="text-light">Last Order</h4>
            <div class="mb-4 border p-3 rounded">
                <p><strong>Order ID:</strong> <%= lastOrder.get("orderId") %></p>
                <p><strong>Date:</strong> <%= lastOrder.get("orderTime") %></p>
                <p><strong>Items:</strong> <%= lastOrder.get("itemList") %></p>
                <p><strong>Total Amount:</strong> ₹<%= lastOrder.get("amount") %></p>
                <p><strong>Status:</strong> 
                    <% String status = lastOrder.get("currentState"); %>
                    <span class="status-label 
                        <%= "Confirmed".equalsIgnoreCase(status) ? "status-confirmed" : "" %>
                        <%= "Preparing".equalsIgnoreCase(status) ? "status-preparing" : "" %>
                        <%= "Ready".equalsIgnoreCase(status) ? "status-ready" : "" %>">
                        <%= status %> - 
                        <%= "Confirmed".equalsIgnoreCase(status) ? "Order placed successfully." : 
                            "Preparing".equalsIgnoreCase(status) ? "Your order is being prepared." : 
                            "Ready".equalsIgnoreCase(status) ? "Your order is ready for pickup." : status %>
                    </span>
                </p>
            </div>

            <h4 class="text-light">Previous Orders</h4>
            <table class="table table-dark table-bordered mt-3">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Items</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Map<String, String> order : orderList) { %>
                    <tr>
                        <td><%= order.get("orderId") %></td>
                        <td><%= order.get("orderTime") %></td>
                        <td><%= order.get("itemList") %></td>
                        <td>₹<%= order.get("amount") %></td>
                        <td>
                            <% String s = order.get("currentState"); %>
                            <span class="status-label 
                                <%= "Confirmed".equalsIgnoreCase(s) ? "status-confirmed" : "" %>
                                <%= "Preparing".equalsIgnoreCase(s) ? "status-preparing" : "" %>
                                <%= "Ready".equalsIgnoreCase(s) ? "status-ready" : "" %>">
                                <%= s %> - 
                                <%= "Confirmed".equalsIgnoreCase(s) ? "Order placed successfully." : 
                                    "Preparing".equalsIgnoreCase(s) ? "Being prepared." : 
                                    "Ready".equalsIgnoreCase(s) ? "Ready for pickup." : s %>
                            </span>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="text-white">No orders found.</p>
        <% } %>
    </div>
</div>
</body>
</html>
--%>