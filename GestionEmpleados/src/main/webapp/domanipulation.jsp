<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="connectiontodb.ConnectionPool"%>
<%@page import="employee.Employee"%>
<%@page import="employee.EmployeeService"%>
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
        String action = request.getParameter("action");
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");
        else if (action == null)
            response.sendRedirect("home.jsp");
        else {
            
            String accessUser = "davidsr";
            String accessPassword = "123456789";
            String accessDbUrl = "jdbc:mysql://localhost:3306/empresa";
            ConnectionPool cp = new ConnectionPool(accessDbUrl, accessUser, accessPassword);
            EmployeeService es = new EmployeeService(cp.getConnection());

            long id;
            if (action.equals("delete")) {
                id =  Long.parseLong(request.getParameter("employeeid"));
                es.delete(id);
            }
            else {
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String charge = request.getParameter("charge");
                if (action.equals("modify"))  {
                    id =  Long.parseLong(request.getParameter("employeeid"));
                    es.update(new Employee(id, name, surname, charge));
                } else 
                    es.insert(new Employee(0, name, surname, charge));
            }

            response.sendRedirect("home.jsp");
        }

    %>
    
</body>