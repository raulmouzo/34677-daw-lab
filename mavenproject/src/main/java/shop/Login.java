package shop;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String next = request.getParameter("next");

        HttpSession session = request.getSession(true);
        DBAccess conn = DBAccess.getInstance();

        if (user != null && pass != null) {
            int id = conn.checkUserDB(user, pass);
            if (id > 0) {
                session.setAttribute("userId", id);
                session.setAttribute("userName", user);
            } else {
                session.setAttribute("message", "Usuario y/o clave incorrectos");
            }
        } else {
            session.setAttribute("message", "Debe ingresar usuario y contraseña");
        }

        String nextPage = (next != null && !next.isEmpty()) ? next : "index.jsp";        
        response.sendRedirect("login.jsp?next=" + nextPage);
    }
}
