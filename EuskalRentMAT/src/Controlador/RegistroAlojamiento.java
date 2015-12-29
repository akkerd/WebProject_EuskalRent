/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.HttpSession;

import Modelo.Entidades.Alojamiento;
import Modelo.Entidades.Alquiler;
import Modelo.Listas.ListaAlojamientos;
import Modelo.Entidades.Usuario;
import Modelo.conexionBD.ConexionBD;

//import java.util.Calendar;
import java.util.Date;
/**
 *
 * @author Diegaker
 */
public class RegistroAlojamiento extends HttpServlet {
    
    private Connection con;
    private Statement set;
    private ResultSet rs;
    String cad;
    
    Date fechaHoy;
    @Override
    public void init(ServletConfig cfg) throws ServletException {
        String sURL = "jdbc:mysql://localhost:3306/euskalrent";
        super.init(cfg);
        String userName = "root";
        String password = "root";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(sURL, userName, password);
            System.out.println("Se ha conectado");
        } catch (Exception e) {
            System.out.println("No se ha conectado");
        }
    }
    
    // NECESITAMOS ESTO DE AQUI ABAJO?
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
        } finally {
            out.close();
        }
    }*/

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
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
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
    
    
    /*
    private int idAlojamiento;
    private String tipoAlojamiento;
    private int numHabitaciones;
    private String barrio;
    private String direccion;
    private String fotoAlojamiento;
    private int precioNoche;
    private String tipoCancelacion;
    private String comentario;
    private String titulo;
    private String piso;
    */
    
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Obtener la sesion
        HttpSession s = request.getSession(true);
        // Obtener usuario
        Usuario miUsuario = (Usuario) request.getSession().getAttribute("usuario");
        
        if( miUsuario == null ){
            // Redirigir
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
            rd.forward(request,response);
        }else{
    
            // Incrementamos el numero de alojamientos para usarlo como id
            // int numAlojamiento += 1;
            String tipoAlojamiento = request.getParameter("tipoAloj");
            int numHuespedes = Integer.parseInt( request.getParameter("nHuesp") );// Esto deberia ser numHuespedes, no habitaciones
            String barrio = request.getParameter("barrio");
            String direccion = request.getParameter("buscador");
            String fotoAlojamiento = request.getParameter("drop-zone2"); // De aquí recoger el String base64
            int precioNoche = Integer.parseInt( request.getParameter("tarifa") );
            String tipoCancelacion = request.getParameter("politica");
            String comentario = request.getParameter("coment");
            //String titulo = request.getParameter("titulo");
            
            // Creo el objeto Alojamiento
            Alojamiento miAlojamiento = new Alojamiento( 0, tipoAlojamiento,numHuespedes,barrio,direccion,fotoAlojamiento,precioNoche,tipoCancelacion,comentario);
            int idUsuario = miUsuario.getIdUsuario();
            
            fechaHoy = new Date();
            
            // Creo el objeto Alquiler
            Alquiler miAlquiler = new Alquiler(0, miAlojamiento, fechaHoy, fechaHoy, fechaHoy);
            
            // addAlojamientoBD();
            ConexionBD.getConexionBD().añadirAlojamiento(miAlojamiento);
            
           // POSIBLE SOLUCION AL TEMA DE LOS IDs
            ListaAlojamientos miListaAlojamientos = ConexionBD.getConexionBD().getListaAlojamientos();
            int numAlojamientos = miListaAlojamientos.getNumeroAumentos();
            
            // addAlquilerBD
            ConexionBD.getConexionBD().añadirAlquiler(miAlquiler, idUsuario, numAlojamientos+1);
            
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/perfil.jsp");
            rd.forward(request,response);
        }
    }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Este Servlet sirve para crear un Alojamiento";
    }// </editor-fold>

}
