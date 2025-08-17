<%--

<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.DBConnection" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Current Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Current Orders (Admin View)</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Table Number</th>
            <th>Order Details</th>
            <th>Status</th>
            <th>Order Time</th>
            <th>Update Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();

                String sql = 
                    "SELECT id, table_no, food_items, order_status, order_time " +
                    "FROM orders " +
                    "WHERE TRUNC(order_time) = TRUNC(SYSDATE) " +
                    "ORDER BY CASE order_status WHEN 'Pending' THEN 1 ELSE 2 END, order_time DESC";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int orderId     = rs.getInt("id");
                    int tableNumber = rs.getInt("table_no");
                    String itemsCsv = rs.getString("food_items"); // Already contains names
                    String status   = rs.getString("order_status");
                    Timestamp time  = rs.getTimestamp("order_time");
        %>
        <tr>
            <td><%= orderId %></td>
            <td><%= tableNumber %></td>
            <td><%= (itemsCsv != null && !itemsCsv.trim().isEmpty()) ? itemsCsv : "<em>No items</em>" %></td>
            <td><%= status %></td>
            <td><%= time %></td>
            <td>
                <form action="../UpdateOrderStatusServlet" method="post" class="d-flex">
                    <input type="hidden" name="orderId" value="<%= orderId %>">
                    <select name="newStatus" class="form-select form-select-sm me-2" required>
                        <option disabled selected>Change...</option>
                        <option value="Preparing">Preparing</option>
                        <option value="Ready">Ready</option>
                        <option value="Delivered">Delivered</option>
                    </select>
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" class="text-danger">
                Error loading orders: <%= e.getMessage() %>
            </td>
        </tr>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception ignored) {}
                try { if (ps != null) ps.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>


--%>


<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.DBConnection" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Current Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f1f2b5, #135058);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .table-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
        }
        h2 {
            background: linear-gradient(to right, #000000, #333333);
            color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }
        .form-select, .btn {
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn:hover {
            transform: scale(1.05);
            transition: transform 0.2s ease-in-out;
        }
    </style>
</head>
<body>
<div class="container mt-5 table-container">
    <h2 class="text-center mb-4">Current Orders (Admin View)</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Table Number</th>
            <th>Order Details</th>
            <th>Status</th>
            <th>Order Time</th>
            <th>Update Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();

                String sql = 
                    "SELECT id, table_no, food_items, order_status, order_time " +
                    "FROM orders " +
                    "WHERE TRUNC(order_time) = TRUNC(SYSDATE) " +
                    "ORDER BY CASE order_status WHEN 'Pending' THEN 1 ELSE 2 END, order_time DESC";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int orderId     = rs.getInt("id");
                    int tableNumber = rs.getInt("table_no");
                    String itemsCsv = rs.getString("food_items");
                    String status   = rs.getString("order_status");
                    Timestamp time  = rs.getTimestamp("order_time");
        %>
        <tr>
            <td><%= orderId %></td>
            <td><%= tableNumber %></td>
            <td><%= (itemsCsv != null && !itemsCsv.trim().isEmpty()) ? itemsCsv : "<em>No items</em>" %></td>
            <td><%= status %></td>
            <td><%= time %></td>
            <td>
                <form action="../UpdateOrderStatusServlet" method="post" class="d-flex">
                    <input type="hidden" name="orderId" value="<%= orderId %>">
                    <select name="newStatus" class="form-select form-select-sm me-2" required>
                        <option disabled selected>Change...</option>
                        <option value="Preparing">Preparing</option>
                        <option value="Ready">Ready</option>
                        <option value="Delivered">Delivered</option>
                    </select>
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" class="text-danger">
                Error loading orders: <%= e.getMessage() %>
            </td>
        </tr>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception ignored) {}
                try { if (ps != null) ps.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
