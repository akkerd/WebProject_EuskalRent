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
import Modelo.Entidades.Usuario;
import Modelo.conexionBD.ConexionBD;
import java.awt.image.BufferedImage;
import Modelo.Entidades.Usuario;

/**
 *
 * @author joseba
 */
public class updateUser extends HttpServlet {

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
            Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
            String nombre = request.getParameter("nombre-perfil");
            String email = request.getParameter("email-perfil");
            String foto = usuario.getFotoPerfil();
            int telefono = Integer.parseInt(request.getParameter("tel-perfil"));
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
                String imagenString = imageDecoder.guardarFotoUsuarioEnSistema(bi, con.getNextIdAlojamiento());
                
                //-----------------------FIN FOTO 2 BASE64----------------------------------
                if( foto != imagenString){
                foto = imagenString;
            }
            String pass = request.getParameter("pwd-perfil");
            Usuario usuario1 = (Usuario) request.getSession().getAttribute("usuario");
            int idUsuario = usuario1.getIdUsuario();
            
            Usuario user = new Usuario(idUsuario,nombre,email,foto,telefono,null);
            
            con.actualizarUsuario(user, pass);
            Usuario usuario2 = con.buscarUsuario(email, pass);
            request.getSession().setAttribute("usuario", usuario2);
            
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
