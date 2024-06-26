/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2024-05-18 22:39:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.User;
import user.UserService;
import connectiontodb.ConnectionPool;

public final class modifyloggeduser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Profile</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    ");
 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");
        else {

        String accessUser = "davidsr";
        String accessPassword = "123456789";
        String accessDbUrl = "jdbc:mysql://localhost:3306/empresa";
        ConnectionPool cp = new ConnectionPool(accessDbUrl, accessUser, accessPassword);
        UserService us = new UserService(cp.getConnection());

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null)
            response.sendRedirect("login.jsp");

        String error = String.valueOf((session.getAttribute("error") != null) ? session.getAttribute("error") : "");

        try {

        User modifiedUser = new User(loggedUser.getId(), username, password);
        int affectedRows = us.update(modifiedUser);
        if (affectedRows == 1) {
            session.setAttribute("error", null);
            session.setAttribute("user", modifiedUser);
            response.sendRedirect("loggeduser.jsp");
        } else {
            session.setAttribute("error", "<p class=\"text-center text-danger\">Se produjo un error modificando</p>");
            response.sendRedirect("loggeduser.jsp");
        }


        } catch (Exception e) {

            session.setAttribute("error", "<p class=\"text-center text-danger m-0 mt-1 p-0\">El usuario introducido ya existe</p>");
            response.sendRedirect("loggeduser.jsp");

        }

        }

    
      out.write("\r\n");
      out.write("\r\n");
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
