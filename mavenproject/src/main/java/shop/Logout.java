package shop;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); 

        if (session != null) {
            session.invalidate();
        }
        
        String next = request.getParameter("next");

        if (next == null || next.isEmpty()) {
            next = "index.html"; 
        }

        response.sendRedirect(next);
    }
}
