package prueba;

import java.io.*; // Paquete entrada y salida (incluye PrintWriter)
import jakarta.servlet.*; // Paquete base Servlets (incluye ServletException)
import jakarta.servlet.http.*; // Paquete HTTP Servlets (incluye HttpServlet)

public class Hola extends HttpServlet {

    // Método que se llama cuando hay una petición GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("texto.jsp");
    }

    // Método que se llama cuando hay una petición POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Al no tener código no se hace nada al recibir la petición
    }
}