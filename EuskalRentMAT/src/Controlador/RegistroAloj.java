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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.rowset.serial.SerialBlob;
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
                ConexionBD con = ConexionBD.getConexionBD();

                // Recopilar los datos del formulario.

                String tipoAlojamiento = request.getParameter("tipoAloj");
                int numHuespedes = Integer.parseInt( request.getParameter("nHuesp") );// Esto deberia ser numHuespedes, no habitaciones
                String barrio = request.getParameter("barrio");            
                String direccion = request.getParameter("buscador");
                
                //-----------------------PARA LA FOTO----------------------------------
                String fotoDrag = request.getParameter("fotoDrag");
                String ruta = null;

                if ( fotoDrag.equals("") ){
                    ruta = "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";
                }else{
                    ruta = fotoDrag;
                    String[] rutaAux = ruta.split(",");
                    ruta = rutaAux[1];
                }
                
                decodificadorImagen decoder = new decodificadorImagen();
                SerialBlob fotoBlob = decoder.decodeToImage(ruta);
                
                String fotoStringFuncionaOstia = decoder.encodeToImage(fotoBlob);
                
                /*else{
                    // Recoger del request la imagen con "getPart()", si no, no funciona
                    ApplicationPart fotoFilePart = (ApplicationPart) request.getPart("file");
                    FileInputStream fileContent = (FileInputStream) fotoFilePart.getInputStream();

                    // Se comprueba que se ha recibido una foto, si no no la guarda
                    if (fileContent != null) {

                    // Esta ruta es relativa al ordenador en el que está el Servlet
                    // Si se instala en un servidor habría que escribir la ruta del ordenador del servidor
                        ruta = "C:\\Users\\Diegaker\\AppData\\Roaming\\NetBeans\\8.0.2\\apache-tomcat-8.0.15.0_base\\work\\Catalina\\localhost\\EuskalRentMAT\\";

                    // Este "File" contiene la carpeta de archivos que se guardan
                        File folder = new File("C:\\Users\\Diegaker\\AppData\\Roaming\\NetBeans\\8.0.2\\apache-tomcat-8.0.15.0_base\\work\\Catalina\\localhost\\EuskalRentMAT");
                        File[] listOfFiles = folder.listFiles();

                    // Se obtiene el último elemento añadido a la carpeta
                        int numFiles = listOfFiles.length;
                        File imagen = listOfFiles[numFiles-1];

                        ruta = ruta + imagen.getName();
                    } else {
                        ruta = null;
                        System.out.println("No se ha podido guardar la foto correctamente");
                    }
                }*/
                //------------------------- FIN FOTO -------------------------------------

                float precioNoche = Float.parseFloat(request.getParameter("tarifa"));
                String tipoCancelacion = request.getParameter("politica");
                String comentario = request.getParameter("coment");

                // Para ALQUILER
                // FECHAS
                Date fechaHoy = new Date();
                String date1 = request.getParameter("date-inicio");
                String date2 = request.getParameter("date-fin");

                if(date1.equals("") ){
                    date1 = fechaHoy.toString();
                }
                if( date2.equals("") ){
                    date2 = "2999-12-31";
                }
                // FIN FECHAS
                String titulo = request.getParameter("titulo");
                // Creo el objeto Alojamiento
                Alojamiento miAlojamiento = new Alojamiento( 0, tipoAlojamiento,numHuespedes,barrio,direccion,fotoBlob,precioNoche,tipoCancelacion,comentario);

                int idUsuario = miUsuario.getIdUsuario();
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
