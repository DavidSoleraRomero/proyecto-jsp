<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="employee.EmployeeService"%>
<%@page import="connectiontodb.ConnectionPool"%>
<%@page import="java.util.ArrayList" %>
<%@page import="modules.Utilities"%>
<%@page import="modules.EmployeeUtilities"%>
<%@page import="employee.Employee" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Enlace de estilo propio -->
    <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
    <!-- Enlace a Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Enlace a FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./assets/img/logo-favicon.png">
    <title>Home</title>
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");

        String username = "<p id=\"userlogged\" class=\"m-0 pl-2\">" + ((loggedUser != null) ? loggedUser.getUsername() : "") + "</p>";

    %>
    

    <div class="container text-center">
        <nav class="navbar bg-body-tertiary px-0 position-sticky top-0 bg-white border-bottom border-dark">
            <div class="container-fluid px-0 d-flex justify-content-between align-items-center">
                <div>
                    <a id="gemp" class="navbar-brand d-flex align-items-center text-dark m-0" href="home.jsp">
                        <img src="./assets/img/logo-favicon.png" alt="Home's favicon" class="d-inline-block align-text-top w-50px">
                        <p class="m-0 pr-2">Gestión Empleados</p>
                    </a>
                </div>
                <a id="nav-username" class="nav-link d-flex align-items-center text-dark p-0" href="loggeduser.jsp">
                    <%= username %>
                    <img class="w-50px border-end border-dark" src="./assets/img/UserIcon.png" alt="User's icon">
                </a>
            </div>
        </nav>

        <h1 class="text-dark mt-4">Formatos</h1>
        <h2 class="text-dark">Nombre de usuario</h2>
        <p class="text-danger m-0 my-1">Mínimo 4 carácteres de largo</p>
        <p class="text-danger m-0 my-1">Máximo 15 carácteres de largo</p>
        <p class="text-danger m-0 my-1">Solo puede contener letras y números</p><br>
        <h2 class="text-dark">Contraseña</h2>
        <p class="text-danger m-0 my-1">Mínimo 6 carácteres de largo</p>
        <p class="text-danger m-0 my-1">Mínimo 1 mayúscula</p>
        <p class="text-danger m-0 my-1">Mínimo 1 minúscula</p>
        <p class="text-danger m-0 my-1">Mínimo 1 dígito</p>
        <p class="text-danger m-0 my-1 mb-3">Mínimo 1 caracter especial</p>
        <a href="home.jsp"><button class="btn btn-dark">VOLVER - HOME</button></a>
        <a href="loggeduser.jsp"><button class="btn btn-dark">VOLVER - PERFIL</button></a>
    </div>

</body>