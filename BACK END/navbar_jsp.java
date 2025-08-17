package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- Tailwind CDN -->\n");
      out.write("<script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("<!-- AOS (Animate on Scroll) -->\n");
      out.write("<link href=\"https://unpkg.com/aos@2.3.1/dist/aos.css\" rel=\"stylesheet\">\n");
      out.write("<script src=\"https://unpkg.com/aos@2.3.1/dist/aos.js\"></script>\n");
      out.write("<script>\n");
      out.write("  AOS.init();\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<!-- Navbar -->\n");
      out.write("<nav class=\"fixed top-0 left-0 w-full z-50 backdrop-blur-md bg-black bg-opacity-30 shadow-xl\">\n");
      out.write("  <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">\n");
      out.write("    <div class=\"flex items-center justify-between h-16\">\n");
      out.write("      <!-- Logo -->\n");
      out.write("      <a href=\"menu.jsp\" class=\"flex items-center space-x-3\">\n");
      out.write("        <img src=\"./images/png-original.png\" class=\"h-10 w-10 object-cover transform hover:scale-110 transition duration-300 ease-in-out\" alt=\"Canteen Logo\">\n");
      out.write("       \n");
      out.write("      </a>\n");
      out.write("\n");
      out.write("      <!-- Toggle -->\n");
      out.write("      <div class=\"md:hidden\">\n");
      out.write("        <button id=\"mobile-menu-button\" class=\"text-white focus:outline-none\">\n");
      out.write("          <i class=\"fas fa-bars text-xl\"></i>\n");
      out.write("        </button>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- Links -->\n");
      out.write("      <div id=\"navbar-content\" class=\"hidden md:flex md:items-center space-x-6\">\n");
      out.write("        <a href=\"menu.jsp\" class=\"text-white hover:text-gray-300 transition transform hover:scale-105 duration-300\">\n");
      out.write("          <i class=\"fas fa-utensils mr-1\"></i> Menu\n");
      out.write("        </a>\n");
      out.write("        <a href=\"userDetails.jsp?tableNo=");
      out.print(session.getAttribute("tableNo"));
      out.write("\" class=\"text-white hover:text-gray-300 transition transform hover:scale-105 duration-300\">\n");
      out.write("          <i class=\"fas fa-user mr-1\"></i> Your Details\n");
      out.write("        </a>\n");
      out.write("        <a href=\"order_history.jsp\" class=\"text-white hover:text-gray-300 transition transform hover:scale-105 duration-300\">\n");
      out.write("          <i class=\"fas fa-receipt mr-1\"></i> Order Summary\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <!-- Search Bar -->\n");
      out.write("        <div class=\"relative\">\n");
      out.write("          <input type=\"text\" placeholder=\"Search...\" class=\"px-3 py-1 rounded-full bg-gray-800 text-white focus:outline-none\" id=\"searchInput\" onkeyup=\"searchMenu()\">\n");
      out.write("          <i class=\"fas fa-search absolute right-3 top-2 text-white\"></i>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Profile / Logout -->\n");
      out.write("        <div class=\"flex items-center space-x-4\">\n");
      out.write("          <div class=\"text-white bg-white bg-opacity-10 px-4 py-2 rounded-full\">\n");
      out.write("            <i class=\"fas fa-user-circle mr-1\"></i>\n");
      out.write("            <span>");
      out.print(session.getAttribute("username") != null ? session.getAttribute("username") : "Guest");
      out.write("</span>\n");
      out.write("          </div>\n");
      out.write("          <a href=\"logout.jsp\" class=\"text-white border border-white px-4 py-2 rounded-full hover:bg-white hover:text-black transition duration-300\">\n");
      out.write("            <i class=\"fas fa-sign-out-alt mr-1\"></i> Admin Login\n");
      out.write("          </a>\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <!-- Mobile Menu -->\n");
      out.write("  <div id=\"mobile-menu\" class=\"md:hidden hidden bg-black bg-opacity-30 backdrop-blur-md px-4 py-4 space-y-3\">\n");
      out.write("    <a href=\"menu.jsp\" class=\"block text-white\">Menu</a>\n");
      out.write("    <a href=\"userDetails.jsp?tableNo=");
      out.print(session.getAttribute("tableNo"));
      out.write("\" class=\"block text-white\">Your Details</a>\n");
      out.write("    <a href=\"order_history.jsp\" class=\"block text-white\">Order Summary</a>\n");
      out.write("    <a href=\"logout.jsp\" class=\"block text-white\">Admin Login</a>\n");
      out.write("   \n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("  document.getElementById('mobile-menu-button').addEventListener('click', () => {\n");
      out.write("    document.getElementById('mobile-menu').classList.toggle('hidden');\n");
      out.write("  });\n");
      out.write("  \n");
      out.write("     function searchMenu() {\n");
      out.write("        const query = document.getElementById('searchInput').value.toLowerCase();\n");
      out.write("        const items = document.querySelectorAll('.menu-item');\n");
      out.write("\n");
      out.write("        items.forEach(item => {\n");
      out.write("            const name = item.dataset.name;\n");
      out.write("            const type = item.dataset.type.toLowerCase();\n");
      out.write("            item.style.display = (name.includes(query) || type.includes(query)) ? 'block' : 'none';\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<!-- Font Awesome -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\n");
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
