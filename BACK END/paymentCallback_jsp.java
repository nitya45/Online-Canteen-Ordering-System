package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import javax.servlet.*;

public final class paymentCallback_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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

    String paymentId = request.getParameter("razorpay_payment_id");
    if (paymentId == null || paymentId.isEmpty()) {
        response.sendRedirect("payment.jsp?error=paymentMissing");
        return;
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Processing Payment...</title>\n");
      out.write("    <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    <style>\n");
      out.write("        .spinner {\n");
      out.write("            border: 4px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            border-top: 4px solid #4ade80;\n");
      out.write("            border-radius: 50%;\n");
      out.write("            width: 48px;\n");
      out.write("            height: 48px;\n");
      out.write("            animation: spin 1s linear infinite;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @keyframes spin {\n");
      out.write("            0% { transform: rotate(0deg); }\n");
      out.write("            100% { transform: rotate(360deg); }\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-gray-900 text-white min-h-screen flex items-center justify-center\">\n");
      out.write("    <form id=\"forwardForm\" action=\"Prince\" method=\"POST\">\n");
      out.write("        <input type=\"hidden\" name=\"razorpay_payment_id\" value=\"");
      out.print( paymentId );
      out.write("\">\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    <div class=\"text-center\">\n");
      out.write("        <div class=\"spinner mx-auto mb-4\"></div>\n");
      out.write("        <h2 class=\"text-xl font-semibold text-green-400 animate-pulse\">Processing your payment...</h2>\n");
      out.write("        <p class=\"text-gray-300 mt-2\">Please wait while we redirect you to the confirmation page.</p>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        setTimeout(() => {\n");
      out.write("            document.getElementById('forwardForm').submit();\n");
      out.write("        }, 1500);\n");
      out.write("    </script>\n");
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
