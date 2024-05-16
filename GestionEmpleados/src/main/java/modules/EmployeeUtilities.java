package modules;

import java.util.ArrayList;

import employee.Employee;

public class EmployeeUtilities {

    public static String employeeHtmlString(ArrayList<Employee> al) {
        String ret = "";
        if (al.size() == 0)
            return ret + "<p class=\"col-12\">No se ha encontrado ningún empleado</p>";
        else {
            for (Employee e : al) {
                ret += String.format(
                        "<div class=\"card col-xl-3 col-lg-4 col-12 my-lg-2 my-1 mx-xl-2 mx-lg-1 custom-border border-dark rounded card-hover p-0 \">"
                                +
                                "<ul class=\"list-group list-group-flush\">" +
                                "<li class=\"list-group-item\">" +
                                "<div class=\"row\">" +
                                "<div class=\"col-9\">" +
                                "<h3 class=\"d-inline\"><i class=\"fa fa-id-card-o\" aria-hidden=\"true\"></i> ID %d</h3>"
                                +
                                "</div>" +
                                "<div class=\"col-3\">" +
                                "<div class=\"d-flex align-items-center\">" +
                                "<form method=\"POST\" action=\"manipulation.jsp\">" +
                                "<input type=\"hidden\" name=\"employeeid\" value=\"%d\">" +
                                "<input type=\"hidden\" name=\"action\" value=\"modify\">" +
                                "<button type=\"submit\" class=\"btn p-0\">" +
                                "<i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>" +
                                "</button>" +
                                "</form>" +
                                "<form method=\"POST\" class=\"d-flex align-items-center\" action=\"domanipulation.jsp\">"
                                +
                                "<input type=\"hidden\" name=\"employeeid\" value=\"%d\">" +
                                "<input type=\"hidden\" name=\"action\" value=\"delete\">" +
                                "<button type=\"submit\" class=\"btn p-0 pl-2\">" +
                                "<i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i>" +
                                "</button>" +
                                "</form>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "<i class=\"fa fa-user-circle\" aria-hidden=\"true\"></i> Nombre y apellidos: <div>%s %s</div>"
                                +
                                "<i class=\"fa fa-briefcase\" aria-hidden=\"true\"></i> Cargo: <div>%s</div>" +
                                "</li>" +
                                "</ul>" +
                                "</div>",
                        e.getId(), e.getId(), e.getId(), e.getName(), e.getSurname(), e.getCharge());
            }
            return ret;
        }
    }

    public static String employeeHtmlString(Employee e) {
        String ret = "";
        if (e == null)
            return ret + "<p class=\"col-12\">No se ha encontrado ningún empleado</p>";
        else {
            ret += String.format(
                    "<div class=\"card col-xl-3 col-lg-4 col-12 my-lg-2 my-1 mx-xl-2 mx-lg-1 custom-border border-dark rounded card-hover p-0 \">"
                            +
                            "<ul class=\"list-group list-group-flush\">" +
                            "<li class=\"list-group-item\">" +
                            "<div class=\"row\">" +
                            "<div class=\"col-9\">" +
                            "<h3 class=\"d-inline\"><i class=\"fa fa-id-card-o\" aria-hidden=\"true\"></i> ID %d</h3>"
                            +
                            "</div>" +
                            "<div class=\"col-3\">" +
                            "<div class=\"d-flex align-items-center\">" +
                            "<form method=\"POST\" action=\"manipulation.jsp\">" +
                            "<input type=\"hidden\" name=\"employeeid\" value=\"%d\">" +
                            "<input type=\"hidden\" name=\"action\" value=\"modify\">" +
                            "<button type=\"submit\" class=\"btn p-0\">" +
                            "<i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>" +
                            "</button>" +
                            "</form>" +
                            "<form method=\"POST\" class=\"d-flex align-items-center\" action=\"domanipulation.jsp\">"
                            +
                            "<input type=\"hidden\" name=\"employeeid\" value=\"%d\">" +
                            "<input type=\"hidden\" name=\"action\" value=\"delete\">" +
                            "<button type=\"submit\" class=\"btn p-0 pl-2\">" +
                            "<i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i>" +
                            "</button>" +
                            "</form>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<i class=\"fa fa-user-circle\" aria-hidden=\"true\"></i> Nombre y apellidos: <div>%s %s</div>"
                            +
                            "<i class=\"fa fa-briefcase\" aria-hidden=\"true\"></i> Cargo: <div>%s</div>" +
                            "</li>" +
                            "</ul>" +
                            "</div>",
                    e.getId(), e.getId(), e.getId(), e.getName(), e.getSurname(), e.getCharge());
            return ret;
        }
    }

}
