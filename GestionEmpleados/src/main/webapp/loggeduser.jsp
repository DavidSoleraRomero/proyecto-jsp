<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="java.util.ArrayList" %>
<%@page import="modules.UserUtilities"%>
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
    <!-- Enlace a FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./assets/img/logo-favicon.png">
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

        ArrayList<User> users = us.requestAll("");
        String passwordType = (request.getParameter("viewPassword") != null && request.getParameter("viewPassword").equals("view")) ? "text" : "password";
        String eyeValue = (passwordType == null || passwordType.equals("password")) ? "view" : "hide";
        String eyeStyle = (eyeValue.equals("view")) ? "fa fa-eye" : "fa fa-eye-slash";

        // Obtiene error de validación de credenciales
        String error = (request.getParameter("error") != null) ? request.getParameter("error") : "";
        
        // Obtiene error de usuario existente si no hay error de credenciales
        if (error.equals(""))
            error = String.valueOf((session.getAttribute("error") != null) 
                                        ? session.getAttribute("error") : "<p class=\"invisible m-0 mt-1 p-0\">invisible</p>");
        String username = (loggedUser != null) ? loggedUser.getUsername() : "";
        String password = (loggedUser != null) ? loggedUser.getPassword() : "";

    %>

    <div class="container p-0">

        <nav class="navbar bg-body-tertiary px-0 position-sticky top-0 bg-light border-bottom border-dark">
            <div class="container-fluid px-0 d-flex justify-content-between align-items-center">
                <div>
                    <a id="gemp" class="navbar-brand d-flex align-items-center text-dark m-0" href="home.jsp">
                        <img src="./assets/img/logo-favicon.png" alt="Home's favicon" class="d-inline-block align-text-top w-50px">
                        <p class="m-0 pr-2">Gestión Empleados</p>
                    </a>
                </div>
                <a class="nav-link d-flex align-items-center text-dark invisible p-0" href="loggeduser.jsp">
                    <img class="w-50px" src="./assets/img/UserIcon.png" alt="User's icon">
                </a>
            </div>
        </nav>

        <div class="container pt-5">
            <div class="row">
                <div class="col-md-6 col-12 d-flex align-items-center justify-content-center flex-column text-center">
                    <h2>Icono de <%= username %></h2>
                    <img class="w-50" src="./assets/img/UserIcon.png" alt="User's icon"><br>
                    <button class="btn btn-dark" disabled>CAMBIAR ICONO</button>
                    <p><i>No disponible actualmente</i></p>
                </div>
                <div class="col-md-6 col-12 d-flex align-items-center justify-content-center flex-column position-relative">
                    <form method="POST" id="modifyCredentialsForm" class="w-50 d-flex justify-content-center align-items-center flex-column">
                        <div class="mt-3 w-100">
                            <label for="username">Usuario</label>
                            <input type="text" required class="form-control" name="username" id="username" value="<%= username %>">
                        </div>
                        <div class="mt-3 w-100">
                            <label for="password">Contraseña</label>
                            <input type="<%= passwordType %>" required class="form-control" name="password" id="password" value="<%= password %>">
                        </div>
                        <%= error %>
                        <button class="btn btn-dark mt-1" type="submit">MODIFICAR</button>
                    </form>
                    <form method="POST" class="w-100 d-flex justify-content-center align-items-center flex-column" action="logout.jsp">
                        <button class="btn btn-danger mt-2">CERRAR SESIÓN</button>
                        <div class="m-0 w-100 invisible">
                            <input type="password" name="password" required class="form-control m-0" value="<%= password %>">
                        </div>
                    </form>
                    <form class="position-absolute top-43-4 right-27" method="POST" action="loggeduser.jsp">
                        <button type="submit" class="btn">
                            <input type="hidden" value="<%= eyeValue %>" name="viewPassword">
                            <i class="<%= eyeStyle %>" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="container p-0">
            <h1>Resultados - Tabla de USUARIOS</h1>
            <div class="row mb-5">
            <%= UserUtilities.userHtmlString(users) %>
            </div>
        </div>

    </div>

    <script>
        document.getElementById('modifyCredentialsForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            const usernamePattern = /^[a-zA-Z0-9]{4,15}$/;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){6,}$/;

            let valid = true;
            let message = '';

            if (!usernamePattern.test(username)) {
                valid = false;
                message += '<a class=\"text-center text-danger m-0 mt-1 p-0\" href=\"infocredentials.jsp\"><u>Formato erroneo</u></a>';
            }

            if (!passwordPattern.test(password) && valid) {
                valid = false;
                message += '<a class=\"text-center text-danger m-0 mt-1 p-0\" href=\"infocredentials.jsp\""><u>Formato erroneo</u></a>';
            }

            if (valid) {
                const encodedUsername = encodeURIComponent(username);
                const encodedPassword = encodeURIComponent(password);
                window.location.href = `modifyloggeduser.jsp?username=${encodedUsername}&password=${encodedPassword}`;
            } else {
                const encodedError = encodeURIComponent(message);
                window.location.href = `loggeduser.jsp?error=${encodedError}`;
            }
        });
    </script>
</body>