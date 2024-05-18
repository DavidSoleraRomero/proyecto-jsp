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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null)
            response.sendRedirect("register.jsp");
        else {

            String accessUser = "davidsr";
            String accessPassword = "123456789";
            String accessDbUrl = "jdbc:mysql://localhost:3306/empresa";
            ConnectionPool cp = new ConnectionPool(accessDbUrl, accessUser, accessPassword);
            UserService us = new UserService(cp.getConnection());

            try {

                us.insert(new User(0, username, password));
                session.setAttribute("error", null);
                response.sendRedirect("login.jsp");

            } catch (Exception e) {

                session.setAttribute("error", "<p class=\"text-center text-danger\">El usuario introducido ya existe<br>Ingrese uno diferente</p>");
                response.sendRedirect("register.jsp");

            }

        }

        }

    %>

</body>