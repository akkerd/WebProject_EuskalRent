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
import Modelo.Entidades.Reserva;
import Modelo.conexionBD.ConexionBD;
import java.text.SimpleDateFormat;
import java.util.*;
import Modelo.Entidades.Usuario;
import Modelo.Listas.ListaReservas;
import Modelo.Entidades.Alquiler;

/**
 *
 * @author joseba
 */
public class registroReserva extends HttpServlet {

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
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            Alquiler alquiler = (Alquiler) request.getSession().getAttribute("alquiler");
            int idUsuario = usuario.getIdUsuario();
            int idAlquiler = alquiler.getIdAlquiler();
            Date fechaHoy = new Date();
   
            Date dateEntrada = (Date)request.getSession().getAttribute("fechaEntrada");
            Date dateSalida = (Date) request.getSession().getAttribute("fechaSalida");
            String fe = dateEntrada.toString();
            String fa = dateSalida.toString();
            
            
            Reserva reserva = new Reserva(0,idAlquiler,fechaHoy,dateEntrada,dateSalida);
            con.añadirReserva(reserva, idUsuario, idAlquiler);
            ListaReservas ls = con.getListaReservas(idUsuario);
            usuario.setListaReservas(ls);
            // Quitamos el saldo al usuario que realiza la reserva
            float precioTotal = alquiler.getPrecioTotal(dateEntrada, dateSalida);
            float saldoUsuario = usuario.getSaldo();
            float salfoFinal = saldoUsuario - precioTotal;
            usuario.setSaldo(salfoFinal);
            con.actualizarUsuarioSinPass(usuario);
            // Actualizamos el saldo del usuario propietario
            con.actualizarSaldoporAlquiler(idAlquiler,precioTotal);
            
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
