package org.apache.jsp.waiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import Order.Order;

public final class waiter_005fdashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Waiter Dashboard</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-light\">\n");
      out.write("<div class=\"container mt-5\">\n");
      out.write("    <h2 class=\"text-center mb-4\">Waiter Dashboard</h2>\n");
      out.write("\n");
      out.write("    <table class=\"table table-bordered table-hover\">\n");
      out.write("        <thead class=\"table-dark\">\n");
      out.write("        <tr>\n");
      out.write("            <th>Order ID</th>\n");
      out.write("            <th>Table Number</th>\n");
      out.write("            <th>Status</th>\n");
      out.write("            <th>Action</th>\n");
      out.write("        </tr>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
 List<Order> orders = (List<Order>) request.getAttribute("orders");
           for(Order o : orders) { 
              if ("Ready".equals(o.getOrderStatus())) { 
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( o.getId() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( o.getTableNo() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( o.getOrderStatus() );
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"MarkDeliveredServlet\" method=\"post\">\n");
      out.write("                    <input type=\"hidden\" name=\"orderId\" value=\"");
      out.print( o.getId() );
      out.write("\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-success btn-sm\">Mark as Delivered</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");
 } } 
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"></script>\n");
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
