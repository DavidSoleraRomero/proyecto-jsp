package modules;

import java.util.ArrayList;

import user.User;

public class UserUtilities {

    public static String userHtmlString(ArrayList<User> al) {
        if (al.size() == 0)
            return "<p>No se ha encontrado ningún usuario</p>";
        else {
            String ret = "";
            for (User u : al) {
                ret += String.format(
                        "<div class=\"card col-xl-3 col-lg-4 col-12 my-lg-2 my-1 mx-xl-2 mx-lg-1 custom-border border-dark rounded card-hover p-0\">"
                                +
                                "<ul class=\"list-group list-group-flush\">" +
                                "<li class=\"list-group-item\">" +
                                "<h3><i class=\"fa fa-id-card-o\" aria-hidden=\"true\"></i> ID %d</h3>"
                                +
                                "<i class=\"fa fa-user-circle d-inline\" aria-hidden=\"true\"> Usuario: <div>%s</div></i>"
                                +
                                "</li>" +
                                "</ul>" +
                                "</div>",
                        u.getId(), u.getUsername());
            }
            return ret;
        }
    }

}
