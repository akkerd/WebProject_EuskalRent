/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Alojamiento;
import Modelo.Entidades.Alquiler;
import Modelo.Entidades.Usuario;
import Modelo.conexionBD.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diegaker
 */
public class RegistroAloj extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        // Obtener la sesion
        HttpSession s = request.getSession(true);
        // Obtener usuario
        Usuario miUsuario = (Usuario) s.getAttribute("usuario");
        
        
        // Recopilar los datos del formulario.
        
        String tipoAlojamiento = request.getParameter("tipoAloj");
        int numHuespedes = Integer.parseInt( request.getParameter("nHuesp") );// Esto deberia ser numHuespedes, no habitaciones
        String barrio = request.getParameter("barrio");            
        String direccion = request.getParameter("buscador");
        // String fotoAlojamiento = (request.getParameter("drop-zone2"); // De aquí recoger el String base64
        String fotoAlojamiento = null;
        float precioNoche = Float.parseFloat( request.getParameter("tarifa") );
        String tipoCancelacion = request.getParameter("politica");
        String comentario = request.getParameter("coment");

        // Para ALQUILER
        String date1 = request.getParameter("date-inicio");
        String date2 = request.getParameter("date-fin");
        String titulo = request.getParameter("titulo");
        // Creo el objeto Alojamiento
        Alojamiento miAlojamiento = new Alojamiento( 0, tipoAlojamiento,numHuespedes,barrio,direccion,fotoAlojamiento,precioNoche,tipoCancelacion,comentario);

        int idUsuario = miUsuario.getIdUsuario();
        Date fechaHoy = new Date();

        // Creo el objeto Alquiler
        Alquiler miAlquiler = new Alquiler(0, miAlojamiento, titulo, fechaHoy, fechaHoy, fechaHoy);

        // Añade un nuevo Alquiler con el último Alojamiento que hay en la lista
        ConexionBD.getConexionBD().añadirAlquiler(miAlquiler, idUsuario);

        request.getRequestDispatcher("index.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
