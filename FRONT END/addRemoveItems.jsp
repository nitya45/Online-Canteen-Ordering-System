
<%--
<%@page import="java.sql.*,dao.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Manage Menu Items</h2>

    <% String msg = (String) session.getAttribute("menuMessage");
       if (msg != null) { %>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= msg %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
            session.removeAttribute("menuMessage");
       }
    %>

    <form action="../MenuItemServlet" method="post" class="mb-4">
        <input type="hidden" name="action" value="add" />
        <div class="mb-3">
            <label>Food Name</label>
            <input type="text" name="name" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="number" name="price" step="0.01" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Image URL</label>
            <input type="text" name="image" class="form-control" required placeholder="/example.com/image.jpg" />
        </div>
        <div class="mb-3">
            <label>Food Category</label>
            <select name="category" class="form-control" required>
                <option value="">Select Category</option>
                <option value="Soft Drink">Soft Drink</option>
                <option value="Fast Food">Fast Food</option>
                <option value="Thali">Thali</option>
                <option value="Nasta">Nasta</option>
                <option value="Ice-Cream">Ice-Cream</option>
                <option value="Maggie">Maggie</option>
                <option value="South Indian">South Indian</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Add Item</button>
    </form>

    <h4>Current Menu Items</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Food Name</th>
                <th>Description</th>
                <th>Price (₹)</th>
                <th>Category</th>
<!--                <th>Image</th>-->
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement("SELECT * FROM menu_items");
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getString("TYPE_OF_FOOD") %></td>
                <%--   <td>
                    <% if (rs.getString("IMAGE_PATH") != null && !rs.getString("IMAGE_PATH").isEmpty()) { %>
                        <img src="<%= rs.getString("IMAGE_PATH") %>" width="100" height="70" alt="food image" onerror="this.src='https://via.placeholder.com/100x70?text=No+Image'">
                    <% } else { %>
                        <span>No Image</span>
                    <% } %>
</td> 
                
                
                
                
                
                <td>
                    <form action="../MenuItemServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm"
                                onclick="return confirm('Are you sure you want to delete this item?');">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error loading menu: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


--%>



<!DOCTYPE html>
<%@page import="java.sql.*,dao.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }
%>
<html>
<head>
    <title>Manage Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            min-height: 100vh;
        }
        .glass {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }
        .form-control, .form-select {
            border-radius: 0.75rem;
        }
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-success {
            background: linear-gradient(to right, #11998e, #38ef7d);
            border: none;
        }
        .btn-danger {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            border: none;
        }
        h2, h4 {
            text-shadow: 1px 1px 2px #aaa;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="glass">
        <h2 class="text-center mb-4">Manage Menu Items</h2>

        <% String msg = (String) session.getAttribute("menuMessage");
           if (msg != null) { %>
            <div class="alert alert-info alert-dismissible fade show" role="alert">
                <%= msg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <%
                session.removeAttribute("menuMessage");
           }
        %>

        <form action="../MenuItemServlet" method="post" class="mb-5">
            <input type="hidden" name="action" value="add" />
            <div class="mb-3">
                <label>Food Name</label>
                <input type="text" name="name" class="form-control" required />
            </div>
            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label>Price</label>
                <input type="number" name="price" step="0.01" class="form-control" required />
            </div>
            <div class="mb-3">
                <label>Image URL</label>
                <input type="text" name="image" class="form-control" required placeholder="/example.com/image.jpg" />
            </div>
            <div class="mb-3">
                <label>Food Category</label>
                <select name="category" class="form-select" required>
                    <option value="">Select Category</option>
                    <option value="Soft Drink">Soft Drink</option>
                    <option value="Fast Food">Fast Food</option>
                    <option value="Thali">Thali</option>
                    <option value="Nasta">Nasta</option>
                    <option value="Ice-Cream">Ice-Cream</option>
                    <option value="Maggie">Maggie</option>
                    <option value="South Indian">South Indian</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Add Item</button>
        </form>

        <h4 class="text-center">Current Menu Items</h4>
        <table class="table table-bordered mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Food Name</th>
                    <th>Description</th>
                    <th>Price (₹)</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                try (Connection conn = DBConnection.getConnection();
                     PreparedStatement ps = conn.prepareStatement("SELECT * FROM menu_items");
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getDouble("price") %></td>
                    <td><%= rs.getString("TYPE_OF_FOOD") %></td>
                    <td>
                        <form action="../MenuItemServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Are you sure you want to delete this item?');">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error loading menu: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
