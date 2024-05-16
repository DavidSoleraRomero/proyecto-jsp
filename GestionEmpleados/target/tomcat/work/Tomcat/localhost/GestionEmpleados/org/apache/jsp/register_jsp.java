/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2024-05-15 18:48:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.User;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"es\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <!-- Enlace de estilo propio -->\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"./assets/css/styles.css\">\r\n");
      out.write("    <!-- Enlace a Bootstrap -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n");
      out.write("    <!-- Favicon -->\r\n");
      out.write("    <link rel=\"icon\" type=\"image/x-icon\" href=\"./assets/img/logo-favicon.png\">\r\n");
      out.write("    <title>Register</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"h-100 pt-5\">\r\n");
      out.write("\r\n");
      out.write("    ");
 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser != null) 
            response.sendRedirect("home.jsp");
        
        String error = String.valueOf((session.getAttribute("error") != null) ? session.getAttribute("error") : "");

        if (error.contains("inválidos")) {
            session.setAttribute("error", "");
            error = "";
        }

    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container pt-4\">\r\n");
      out.write("        <form method=\"POST\" action=\"registerindb.jsp\" class=\"w-perso m-auto p-3 py-4 d-flex justify-content-center align-items-center flex-column custom-border border-dark rounded\">\r\n");
      out.write("            <img class=\"w-25\" src=\"./assets/img/logo-favicon.png\" alt=\"Web logo\"> \r\n");
      out.write("            <h1 class=\"text-center\">Registro</h1>\r\n");
      out.write("            <div class=\"mt-3 w-100\">\r\n");
      out.write("                <label for=\"username\">Usuario</label>\r\n");
      out.write("                <input type=\"text\" name=\"username\" required class=\"form-control\" name=\"username\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"my-3 w-100\">\r\n");
      out.write("                <label for=\"password\">Contraseña</label>\r\n");
      out.write("                <input type=\"password\" name=\"password\" required class=\"form-control\" name=\"password\">\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
      out.print( error );
      out.write("\r\n");
      out.write("            <a href=\"login.jsp\" class=\"text-center text-dark\">¿Ya tienes una cuenta? Inicie sesión aquí</a>\r\n");
      out.write("            <button type=\"submit\" class=\"btn btn-dark mb-1 mt-3\">REGISTRO</button>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("</body>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
