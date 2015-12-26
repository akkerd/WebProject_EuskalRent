
package Modelo.conexionBD;


import Modelo.Entidades.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ConexionBD {
    
    private static ConexionBD ConexionBD = new ConexionBD();
    InitialContext initContext;
    DataSource ds;
    /**
    * Constructor que establece los datos de la conexion y llama al metodo
    * conexionBD para crear la conexion.
    *
    */
    public ConexionBD(){
        abrirConexion();
    } 
    /**
    * Metodo que devuelve el objeto unico para el patron singleton.
    * @return ConexionBD
    */
    public static ConexionBD getConexionBD() {
        if(ConexionBD == null) {
            ConexionBD = new ConexionBD();
      }
      return ConexionBD;
    }
    
    /**
    * Metodo para establecer la conexion con la base de datos.
    *
    * @return boolean que indica si la conexion se a realizado con exito.
    * 
    */

    public void abrirConexion(){
        try{
           this.initContext = new InitialContext();
           this.ds = (DataSource)initContext.lookup("java:comp/env/jdbc/ConexionMySQL");
        }
        catch(Exception e){
            e.printStackTrace();
        }   
    }
    
    public Connection getConexion(){
        Connection cn;
        try {
            cn = this.ds.getConnection();
            return cn;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }       
    }

    /**
    * Metodo para cerrar la conexion.
    * 
    * @return booleano que indica si la conexion se ha cerrado.
    * 
    */
    public boolean cerrarConexion(Connection cn){
        try {
            cn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }  
    /**
    * Metodo para recuperar los datos de un usuario despues de comprobar si existe y si su contraseña es valida.
    * 
    * @return Usuario validado
    * 
    */
    public Usuario buscarUsuario(String email, String contraseña){       
        try{           
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT * FROM USUARIOS WHERE email = '" + email + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return null;
            }
            String pass = rs.getString("pass");
            if (!contraseña.equals(pass) ) {
                cerrarConexion(conexion);
                return null;
            }
            Usuario user = new Usuario (rs.getInt("idUsuario"),rs.getString("nombreCompleto"),rs.getString("email"),rs.getString("fotoPerfil"),rs.getInt("telefono"),rs.getString("descripcion"));
            cerrarConexion(conexion);
            return user;   
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /*public ListaReservas getListaReservas(int idUsuario){
        
    }*/
}

