<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="connectiontodb.ConnectionPool"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Enlace de estilo propio -->
    <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
    <!-- Enlace a Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Profile</title>
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");

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
        } else 
            session.setAttribute("error", "<p class=\"text-center text-danger\">Se produjo un error modificando</p>");

        response.sendRedirect("loggeduser.jsp");

        } catch (Exception e) {

            session.setAttribute("error", "<p class=\"text-center text-danger m-0 mt-1 p-0\">El usuario introducido ya existe</p>");
            response.sendRedirect("loggeduser.jsp");

        }

    %>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>