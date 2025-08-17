package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import dao.DBConnection;

public final class kitchen_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Kitchen Dashboard</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <!-- Auto-refresh every 5 seconds -->\n");
      out.write("    <meta http-equiv=\"refresh\" content=\"5\">\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-light\">\n");
      out.write("<div class=\"container mt-5\">\n");
      out.write("    <h2 class=\"text-center mb-4\">Kitchen Dashboard 🍽️</h2>\n");
      out.write("    <div class=\"card\">\n");
      out.write("        <div class=\"card-body\">\n");
      out.write("            <table class=\"table table-bordered table-hover text-center\">\n");
      out.write("                <thead class=\"table-dark\">\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Order ID</th>\n");
      out.write("                        <th>Table No</th>\n");
      out.write("                        <th>Food Items</th>\n");
      out.write("                        <th>Status</th>\n");
      out.write("                        <th>Update Status</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                ");

                    Connection con = null;
                    PreparedStatement ps = null, psNames = null;
                    ResultSet rs = null, rsNames = null;

                    try {
                        con = DBConnection.getConnection();
                        String sql = 
                            "SELECT id, table_no, food_items, order_status " +
                            "FROM orders " +
                            "WHERE order_status != 'Delivered' " +
                            "ORDER BY id DESC";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            int orderId     = rs.getInt("id");
                            String tableNo  = rs.getString("table_no");
                            String itemsCsv = rs.getString("food_items");
                            String status   = rs.getString("order_status");

                            // Resolve item IDs to names
                            List<String> names = new ArrayList<>();
                            if (itemsCsv != null && !itemsCsv.trim().isEmpty()) {
                                String[] ids = itemsCsv.split("\\s*,\\s*");
                                String placeholders = String.join(",", Collections.nCopies(ids.length, "?"));
                                String nameSql = "SELECT name FROM menu_items WHERE id IN (" + placeholders + ")";
                                psNames = con.prepareStatement(nameSql);
                                for (int i = 0; i < ids.length; i++) {
                                    psNames.setInt(i + 1, Integer.parseInt(ids[i]));
                                }
                                rsNames = psNames.executeQuery();
                                while (rsNames.next()) {
                                    names.add(rsNames.getString("name"));
                                }
                                rsNames.close();
                                psNames.close();
                            }
                            String displayNames = names.isEmpty()
                                ? "<em>No items</em>"
                                : String.join(", ", names);
                
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( orderId );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( tableNo );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( displayNames );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( status );
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <form action=\"UpdateOrderStatusServlet\" method=\"post\" class=\"d-flex justify-content-center\">\n");
      out.write("                                <input type=\"hidden\" name=\"orderId\" value=\"");
      out.print( orderId );
      out.write("\">\n");
      out.write("                                <select name=\"newStatus\" class=\"form-select w-50\" required>\n");
      out.write("                                    <option value=\"\" disabled selected>Select</option>\n");
      out.write("                                    <option value=\"Preparing\">Preparing</option>\n");
      out.write("                                    <option value=\"Ready\">Ready</option>\n");
      out.write("                                    <option value=\"Delivered\">Delivered</option>\n");
      out.write("                                </select>\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary ms-2\">Update</button>\n");
      out.write("                            </form>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                ");

                        }
                    } catch (Exception e) {
                
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"5\" class=\"text-danger\">\n");
      out.write("                            Error loading orders: ");
      out.print( e.getMessage() );
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                ");

                    } finally {
                        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
                        try { if (ps != null) ps.close(); } catch (Exception ignore) {}
                        try { if (con != null) con.close(); } catch (Exception ignore) {}
                    }
                
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
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
