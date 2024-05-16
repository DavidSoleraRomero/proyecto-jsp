<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="connectiontodb.ConnectionPool"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser != null) 
            response.sendRedirect("home.jsp");
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
            else {

                loggedUser = us.validateCredentials(username, password);
                if (loggedUser != null) {
                    session.setAttribute("user", loggedUser);
                    session.setAttribute("error", null);
                    response.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("error", "<p class=\"text-center text-danger\">Usuario y / o contraseña inválidos</p>");
                    response.sendRedirect("login.jsp");
                }
                
            }

        }
    %>

</body>