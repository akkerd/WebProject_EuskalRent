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
import Modelo.Listas.ListaAlquileres;
import Modelo.Entidades.Alquiler;
import Modelo.conexionBD.ConexionBD;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;

/**
 *
 * @author joseba
 */
public class buscarAloj extends HttpServlet {

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
            ConexionBD con = ConexionBD.getConexionBD();
            
            String barrio = request.getParameter("barrio");
            String fechaEntrada = request.getParameter("date1");
            String fechaSalida = request.getParameter("date2");
           
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            try{
            java.util.Date dateIn= formato.parse(fechaEntrada);
            java.util.Date dateOut = formato.parse(fechaSalida);
            
            java.sql.Date dateEntrada = new java.sql.Date(dateIn.getTime());
            java.sql.Date dateSalida = new java.sql.Date(dateOut.getTime());
            
          
            
            ListaAlquileres listaAlquileres = con.getListaAlquileresPorFechaBarrio(dateEntrada, dateSalida, barrio);
            if(listaAlquileres != null){
                request.getSession().setAttribute("listaAlquileres", listaAlquileres);
                request.getSession().setAttribute("fechaEntrada", dateEntrada);
                request.getSession().setAttribute("fechaSalida", dateSalida);
            }
            else{
                listaAlquileres = new ListaAlquileres();
            }
            request.getRequestDispatcher("busqueda.jsp").forward(request, response);

            }
            catch(Exception e){
                e.printStackTrace();
            }
            
            
            
            
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
