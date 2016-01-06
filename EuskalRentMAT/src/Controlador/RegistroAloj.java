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
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;


/*import java.io.File;
import java.io.FileInputStream;
import javax.sql.rowset.serial.SerialBlob;
import org.apache.catalina.core.ApplicationPart;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;*/

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
                HttpSession s = request.getSession(true);                       // Obtener la sesion
                
                Usuario miUsuario = (Usuario) s.getAttribute("usuario");        // Obtener usuario
                int idUsuario = miUsuario.getIdUsuario();
                ConexionBD con = ConexionBD.getConexionBD();
                
                String tipoAlojamiento = "";
                int numHuespedes = 0;
                String barrio = "";            
                String direccion = "";
                String ruta = "";
                float precioNoche = 0.00f;
                String tipoCancelacion = "";
                String comentario = "";
                String titulo = "";
                Date fechaHoy = new Date();
                String date1 = "";                                              // Ambas fechas se convierten 
                String date2 = "";                                              // a java.sql.Date después

                // RECOGER DEL FORM
                if( !request.getParameter("tipoAloj").equals("") )
                    tipoAlojamiento = request.getParameter("tipoAloj");
                
                if( !request.getParameter("nHuesp").equals("") )
                    numHuespedes = Integer.parseInt( request.getParameter("nHuesp") );
                
                if( !request.getParameter("barrio").equals("") )
                    barrio = request.getParameter("barrio");  
                
                if( !request.getParameter("buscador").equals("") )
                    direccion = request.getParameter("buscador");
                
                if( !request.getParameter("tarifa").equals("") )
                    precioNoche = Float.parseFloat(request.getParameter("tarifa"));
                
                if( !request.getParameter("politica").equals("") )
                    tipoCancelacion = request.getParameter("politica");
                
                if( !request.getParameter("coment").equals("") )
                    comentario = request.getParameter("coment");
                
                if( !request.getParameter("titulo").equals("") )
                    titulo = request.getParameter("titulo");

                
                // FECHAS

                if( request.getParameter("date-inicio").equals("") )
                    date1 = ""+fechaHoy.getYear()+"-"+fechaHoy.getMonth()+""+ fechaHoy.getDay();
                else
                    date1 = request.getParameter("date-inicio");
                
                
                if( request.getParameter("date-fin").equals("") )
                    date2 = "2999-12-31";
                else
                    date2 = request.getParameter("date-fin");
                
                
                //-----------------------FOTO 2 BASE64----------------------------------
                String fotoDrag = request.getParameter("fotoDrag");
                
                if ( !fotoDrag.equals("") ){
                    
                    ruta = fotoDrag;
                    String[] rutaAux = ruta.split(",");
                    ruta = rutaAux[1];
                }
                
                decodificadorImagen imageDecoder = new decodificadorImagen();
                BufferedImage bi = imageDecoder.decodeToImage(ruta);
                String imagenString = imageDecoder.guardarFotoAlojamientoEnSistema(bi, con.getNextIdAlojamiento());
                
                //-----------------------FIN FOTO 2 BASE64----------------------------------
                
                // CREAR ALOJAMIENTO
                Alojamiento miAlojamiento = new Alojamiento( 0, tipoAlojamiento,numHuespedes,barrio,direccion,imagenString,precioNoche,tipoCancelacion,comentario);
                
                // DAR FORMATO A LAS FECHAS
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date dateIn= formato.parse(date1);
                java.util.Date dateOut = formato.parse(date2);

                java.sql.Date dateEntrada = new java.sql.Date(dateIn.getTime());
                java.sql.Date dateSalida = new java.sql.Date(dateOut.getTime());


                // CREAR ALQUILER
                Alquiler miAlquiler = new Alquiler(0, miAlojamiento, titulo, fechaHoy, dateEntrada, dateSalida);

                // AÑADE ALQUILER Y ALOJAMIENTO A BD
                con.añadirAlquiler(miAlquiler, idUsuario);
                ListaAlquileres ls = con.getListaAlquileresUsuario(idUsuario);
                miUsuario.setListaAlquileres(ls);
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
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