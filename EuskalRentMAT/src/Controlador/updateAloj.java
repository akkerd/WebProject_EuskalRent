/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.conexionBD.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Entidades.Alojamiento;
import Modelo.Entidades.Alquiler;
import Modelo.Entidades.Usuario;
import Modelo.Listas.ListaAlquileres;

/**
 *
 * @author joseba
 */
public class updateAloj extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            int idAlquiler = Integer.parseInt(request.getParameter("idAlquiler"));
            int idAlojamiento = Integer.parseInt(request.getParameter("idAlojamiento"));
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            int idUsuario = usuario.getIdUsuario();
            
            String titulo = request.getParameter("titulo");
            String tipoAlojamiento = request.getParameter("tipoAloj");
            int numMax = Integer.parseInt(request.getParameter("nHuesp"));
            String barrio = request.getParameter("barrio");
            String politica = request.getParameter("politica");
            
            
            java.util.Date fechaInicio = (java.util.Date)request.getSession().getAttribute("date-inicio");
            java.util.Date fechaFin = (java.util.Date)request.getSession().getAttribute("date-fin");
            java.util.Date fechaAlquiler = (java.util.Date)request.getSession().getAttribute("fechaAlquiler");
            
            float tarifa = Float.parseFloat(request.getParameter("tarifa"));
            String direccion = request.getParameter("buscador");
            String comentario = request.getParameter("coment");
            
            Alojamiento alojamiento = new Alojamiento(idAlojamiento,tipoAlojamiento,numMax,barrio,direccion,null,tarifa,politica,comentario);
            Alquiler alquiler = new Alquiler(idAlquiler, alojamiento, titulo, fechaAlquiler, fechaInicio, fechaFin);
            ConexionBD con = ConexionBD.getConexionBD();
            con.actualizarAlquiler(alquiler);
            ListaAlquileres ls = con.getListaAlquileresUsuario(idUsuario);
            usuario.setListaAlquileres(ls);
            
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
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
