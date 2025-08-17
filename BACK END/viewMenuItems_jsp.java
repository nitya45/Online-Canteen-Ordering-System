package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import dao.DBConnection;

public final class viewMenuItems_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <title>View Menu Items</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(to right, #f8f9fa, #e0f7fa);\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("        }\n");
      out.write("        .container {\n");
      out.write("            background: #ffffff;\n");
      out.write("            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);\n");
      out.write("            border-radius: 15px;\n");
      out.write("            padding: 30px;\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #00796b;\n");
      out.write("        }\n");
      out.write("        .btn-primary:hover, .btn-danger:hover {\n");
      out.write("            transform: scale(1.05);\n");
      out.write("            transition: transform 0.2s;\n");
      out.write("        }\n");
      out.write("        .table {\n");
      out.write("            border-radius: 10px;\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-light\">\n");
      out.write("<div class=\"container mt-5\">\n");
      out.write("    <h2 class=\"mb-4 text-center\">Menu Items</h2>\n");
      out.write("    <table class=\"table table-bordered table-hover table-striped\">\n");
      out.write("        <thead class=\"table-dark\">\n");
      out.write("        <tr>\n");
      out.write("            <th>ID</th>\n");
      out.write("            <th>Food Name</th>\n");
      out.write("            <th>Description</th>\n");
      out.write("            <th>Price (₹)</th>\n");
      out.write("            <th>Actions</th>\n");
      out.write("        </tr>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("        ");
 
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();
                ps = conn.prepareStatement("SELECT id, name, description, price FROM menu_items ORDER BY id");
                rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
        
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print( id );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("name") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("description") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( String.format("%.2f", rs.getDouble("price")) );
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"editItem.jsp?id=");
      out.print( id );
      out.write("\" class=\"btn btn-sm btn-primary\">Edit</a>\n");
      out.write("                    <a href=\"DeleteMenuItemServlet?id=");
      out.print( id );
      out.write("\" class=\"btn btn-sm btn-danger\"\n");
      out.write("                       onclick=\"return confirm('Are you sure you want to delete this item?');\">Delete</a>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        ");
 
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error loading menu items</td></tr>");
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
