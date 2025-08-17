package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if(session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("../index.jsp");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <title>Admin Dashboard</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(to right, #f8f9fa, #e9ecef);\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("        }\n");
      out.write("        .dashboard-container {\n");
      out.write("            margin-top: 80px;\n");
      out.write("            background: rgba(255, 255, 255, 0.85);\n");
      out.write("            border-radius: 20px;\n");
      out.write("            padding: 40px;\n");
      out.write("            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);\n");
      out.write("            backdrop-filter: blur(10px);\n");
      out.write("        }\n");
      out.write("        .dashboard-container h2 {\n");
      out.write("            font-weight: 700;\n");
      out.write("            color: #343a40;\n");
      out.write("        }\n");
      out.write("        .btn-custom {\n");
      out.write("            margin: 10px 10px 0 0;\n");
      out.write("            font-weight: 600;\n");
      out.write("            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);\n");
      out.write("            transition: transform 0.2s ease, box-shadow 0.2s ease;\n");
      out.write("        }\n");
      out.write("        .btn-custom:hover {\n");
      out.write("            transform: translateY(-2px);\n");
      out.write("            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"container dashboard-container\">\n");
      out.write("    <h2 class=\"text-center mb-4\">Admin Dashboard</h2>\n");
      out.write("    <div class=\"text-center\">\n");
      out.write("        <a href=\"addRemoveItems.jsp\" class=\"btn btn-success btn-custom\">Add and Remove Item</a>\n");
      out.write("        <a href=\"viewCurrentOrders.jsp\" class=\"btn btn-warning btn-custom\">View Current Orders</a>\n");
      out.write("        <a href=\"../adminPanel.jsp\" class=\"btn btn-primary btn-custom\">All Orders</a>\n");
      out.write("        <a href=\"viewMenuItems.jsp\" class=\"btn btn-info btn-custom\">All Menu Items</a>\n");
      out.write("        <a href=\"../logout.jsp\" class=\"btn btn-danger btn-custom\">Logout</a>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
