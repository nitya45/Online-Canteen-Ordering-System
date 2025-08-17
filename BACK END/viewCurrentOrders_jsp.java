package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import dao.DBConnection;

public final class viewCurrentOrders_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>View Current Orders</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(to right, #f1f2b5, #135058);\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("        }\n");
      out.write("        .table-container {\n");
      out.write("            background: rgba(255, 255, 255, 0.9);\n");
      out.write("            padding: 30px;\n");
      out.write("            border-radius: 20px;\n");
      out.write("            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            background: linear-gradient(to right, #000000, #333333);\n");
      out.write("            color: white;\n");
      out.write("            padding: 15px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 15px rgba(0,0,0,0.3);\n");
      out.write("        }\n");
      out.write("        .form-select, .btn {\n");
      out.write("            box-shadow: 0 4px 10px rgba(0,0,0,0.2);\n");
      out.write("        }\n");
      out.write("        .table th, .table td {\n");
      out.write("            vertical-align: middle;\n");
      out.write("        }\n");
      out.write("        .btn:hover {\n");
      out.write("            transform: scale(1.05);\n");
      out.write("            transition: transform 0.2s ease-in-out;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"container mt-5 table-container\">\n");
      out.write("    <h2 class=\"text-center mb-4\">Current Orders (Admin View)</h2>\n");
      out.write("    <table class=\"table table-bordered table-hover\">\n");
      out.write("        <thead class=\"table-dark\">\n");
      out.write("        <tr>\n");
      out.write("            <th>Order ID</th>\n");
      out.write("            <th>Table Number</th>\n");
      out.write("            <th>Order Details</th>\n");
      out.write("            <th>Status</th>\n");
      out.write("            <th>Order Time</th>\n");
      out.write("            <th>Update Status</th>\n");
      out.write("        </tr>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( orderId );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( tableNumber );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( (itemsCsv != null && !itemsCsv.trim().isEmpty()) ? itemsCsv : "<em>No items</em>" );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( status );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( time );
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"../UpdateOrderStatusServlet\" method=\"post\" class=\"d-flex\">\n");
      out.write("                    <input type=\"hidden\" name=\"orderId\" value=\"");
      out.print( orderId );
      out.write("\">\n");
      out.write("                    <select name=\"newStatus\" class=\"form-select form-select-sm me-2\" required>\n");
      out.write("                        <option disabled selected>Change...</option>\n");
      out.write("                        <option value=\"Preparing\">Preparing</option>\n");
      out.write("                        <option value=\"Ready\">Ready</option>\n");
      out.write("                        <option value=\"Delivered\">Delivered</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary btn-sm\">Update</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");

                }
            } catch (Exception e) {
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td colspan=\"6\" class=\"text-danger\">\n");
      out.write("                Error loading orders: ");
      out.print( e.getMessage() );
      out.write("\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");

            } finally {
                try { if (rs != null) rs.close(); } catch (Exception ignored) {}
                try { if (ps != null) ps.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
