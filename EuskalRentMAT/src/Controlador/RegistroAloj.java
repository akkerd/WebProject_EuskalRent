/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Alojamiento;
import Modelo.Entidades.Alquiler;
import Modelo.Entidades.Usuario;
import Modelo.Listas.ListaAlquileres;
import Modelo.conexionBD.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.awt.image.BufferedImage;

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
            try{
                // Obtener la sesion
                HttpSession s = request.getSession(true);
                // Obtener usuario
                Usuario miUsuario = (Usuario) s.getAttribute("usuario");
                int idUsuario = miUsuario.getIdUsuario();
                ConexionBD con = ConexionBD.getConexionBD();

                // Recopilar los datos del formulario.

                String tipoAlojamiento = request.getParameter("tipoAloj");
                int numHuespedes = Integer.parseInt( request.getParameter("nHuesp") );// Esto deberia ser numHuespedes, no habitaciones
                String barrio = request.getParameter("barrio");            
                String direccion = request.getParameter("buscador");
                
                //-----------------------FOTO 2 BASE64----------------------------------
                String fotoDrag = request.getParameter("fotoDrag");
                String ruta = "";
                if ( !fotoDrag.equals("") ){
                    
                    ruta = fotoDrag;
                    String[] rutaAux = ruta.split(",");
                    ruta = rutaAux[1];
                }
                
                decodificadorImagen imageDecoder = new decodificadorImagen();
                BufferedImage bi = imageDecoder.decodeToImage(ruta);
                String imagenString = imageDecoder.guardarFotoAlojamientoEnSistema(bi, con.getNextIdAlojamiento());
                
                //-----------------------FIN FOTO 2 BASE64----------------------------------
                
                
                
                
                float precioNoche = Float.parseFloat(request.getParameter("tarifa"));
                String tipoCancelacion = request.getParameter("politica");
                String comentario = request.getParameter("coment");

                // Para ALQUILER
                String date1 = request.getParameter("date-inicio");
                String date2 = request.getParameter("date-fin");
                String titulo = request.getParameter("titulo");
                // Creo el objeto Alojamiento
                Alojamiento miAlojamiento = new Alojamiento( 0, tipoAlojamiento,numHuespedes,barrio,direccion,imagenString,precioNoche,tipoCancelacion,comentario);

                
                Date fechaHoy = new Date();
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");


                    java.util.Date dateIn= formato.parse(date1);
                    java.util.Date dateOut = formato.parse(date2);

                    java.sql.Date dateEntrada = new java.sql.Date(dateIn.getTime());
                    java.sql.Date dateSalida = new java.sql.Date(dateOut.getTime());
                    
                    

                // Creo el objeto Alquiler
                Alquiler miAlquiler = new Alquiler(0, miAlojamiento, titulo, fechaHoy, dateEntrada, dateSalida);

                // Añade un nuevo Alquiler con el último Alojamiento que hay en la lista
                con.añadirAlquiler(miAlquiler, idUsuario);
                ListaAlquileres ls = con.getListaAlquileresUsuario(idUsuario);
                miUsuario.setListaAlquileres(ls);
                
                request.getRequestDispatcher("perfil.jsp").forward(request, response);
             }
                catch(Exception e){
                    e.printStackTrace();
                }
        }
         finally {
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
