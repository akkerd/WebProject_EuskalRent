
package Modelo.conexionBD;


import Modelo.Entidades.Alojamiento;
import Modelo.Entidades.Alquiler;
import Modelo.Entidades.Reserva;
import Modelo.Entidades.Usuario;
import Modelo.Listas.ListaAlquileres;
import Modelo.Listas.ListaReservas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Date;
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
    /*********************************************
    *** METODOS DE BUSQUEDA
    **********************************************/
    
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
            /* Comprobamos de que el usuario exista */
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return null;
            }
            
            /* Comprobamos que la contraeña coincida */
            if (!contraseña.equals(rs.getString("pass")) ) {
                cerrarConexion(conexion);
                return null;
            }
            /* Guardamos las reservas del usuario */
            ListaReservas listaReservas = getListaReservas(rs.getInt("idUsuario"));
            /* Guardamos los alquileres del usuario */
            ListaAlquileres listaAlquileres = getListaAlquileresUsuario(rs.getInt("idUsuario"));
            /* Guardamos los datos de usuario */
            Usuario user = new Usuario (rs.getInt("idUsuario"),rs.getString("nombreCompleto"),rs.getString("email"),rs.getString("fotoPerfil"),rs.getFloat("saldo"),rs.getInt("telefono"),rs.getString("descripcion"),listaReservas,listaAlquileres);
            /* Guardamos las reservas del usuario */
            
            cerrarConexion(conexion);
            return user;   
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
    * Metodo para recuperar todas las reservas de un usuario (Se llamara al cargar un usuario).
    * 
    * @return ListaReservas
    * 
    */
    public ListaReservas getListaReservas(int idUsuario){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT * FROM reservas WHERE IdUsuario ='" + idUsuario + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            /* Creamos la lista de reservas */
            ListaReservas listaReservas = new ListaReservas();
            /* Recorremos y guardamos el resultado de la sentencia sql*/
            while(rs.next()){                
                listaReservas.añadirReserva(new Reserva(rs.getInt("idReserva"),rs.getInt("idAlquiler"),rs.getDate("fechaReserva"),rs.getDate("fechaEntrada"),rs.getDate("fechaSalida")));
            }
            return listaReservas;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
    * Metodo para recuperar todos los alquileres de un usuario (Se llamara al cargar un usuario).
    * 
    * @return ListaAlquileres
    */
    public ListaAlquileres getListaAlquileresUsuario(int idUsuario){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT * FROM alquiler WHERE IdUsuario ='" + idUsuario + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            /* Creamos la lista de alquileres */
            ListaAlquileres listaAlquileres = new ListaAlquileres();
            /* Recorremos y guardamos el resultado de la sentencia sql*/
            while(rs.next()){
                Alojamiento alojamiento = getAlojamiento(rs.getInt("idAlojamiento"));
                Alquiler alquiler = new Alquiler(rs.getInt("idAlquiler"),alojamiento,rs.getString("titulo"),rs.getDate("fechaAlquiler"),rs.getDate("fechaInicio"),rs.getDate("fechaFin"));
                listaAlquileres.añadirAlquiler(alquiler);
            }
            return listaAlquileres;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
    * Metodo para recuperar el alojamiento de cada alquiler. (Se llamara al cargar un alquiler).
    * 
    * @return Alojamiento
    */
    public Alojamiento getAlojamiento(int idAlojamiento){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT * FROM alojamiento WHERE IdAlojamiento ='" + idAlojamiento + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            /* Comprobamos de que el alojamiento exista */
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return null;
            }
            /* Creamos el alojamiento */
            Alojamiento alojamiento = new Alojamiento(rs.getInt("idAlojamiento"),rs.getString("tipoAlojamiento"),rs.getInt("numHuespedes"),rs.getString("barrio"),rs.getString("direccion"),rs.getString("fotoAlojamiento"),rs.getInt("precioNoche"),rs.getString("tipoCancelacion"),rs.getString("Comentario"));

            return alojamiento;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    /**
    * Metodo para recuperar todos los alquileres.
    * 
    * @return ListaAlquileres
    */
    public ListaAlquileres getListaAlquileres(){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT * FROM alquiler";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            /* Creamos la lista de alquileres */
            ListaAlquileres listaAlquileres = new ListaAlquileres();
            /* Recorremos y guardamos el resultado de la sentencia sql*/
            while(rs.next()){
                Alojamiento alojamiento = getAlojamiento(rs.getInt("idAlojamiento"));
                Alquiler alquiler = new Alquiler(rs.getInt("idAlquiler"),alojamiento,rs.getString("titulo"),rs.getDate("fechaAlquiler"),rs.getDate("fechaInicio"),rs.getDate("fechaFin"));
                listaAlquileres.añadirAlquiler(alquiler);
            }
            return listaAlquileres;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
    * Metodo para recuperar todas las reservas asociadas a los alquileres de un usuario
    * 
    * @return ListaReservas
    * 
    */
    public ListaReservas getListaReservasPorAlquileres(int idUsuario){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT R.* FROM reservas R inner join alquiler Q on ( R.idAlquiler = Q.idAlquiler  ) where Q.idUsuario='" + idUsuario + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            /* Creamos la lista de reservas */
            ListaReservas listaReservas = new ListaReservas();
            /* Recorremos y guardamos el resultado de la sentencia sql*/
            while(rs.next()){                
                listaReservas.añadirReserva(new Reserva(rs.getInt("idReserva"),rs.getInt("idAlquiler"),rs.getDate("fechaReserva"),rs.getDate("fechaEntrada"),rs.getDate("fechaSalida")));
            }
            return listaReservas;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    /**
    * Metodo para recuperar todos los alquileres dada una fecha de entrada, una de salida y el barrio.
    * 
    * @return ListaAlquileres
    */
    public ListaAlquileres getListaAlquileresPorFechaBarrio(Date fechaEntrada, Date fechaSalida, String barrio){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT L.* FROM alquiler L inner join alojamiento J on (L.idAlojamiento = J.idAlojamiento) where L.fechaInicio < '"+ fechaEntrada +"' and L.fechaFin > '"+ fechaSalida +"' and J.barrio = '"+ barrio +"'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            /* Creamos la lista de alquileres */
            ListaAlquileres listaAlquileres = new ListaAlquileres();
            /* Recorremos y guardamos el resultado de la sentencia sql*/
            while(rs.next()){
                Alojamiento alojamiento = getAlojamiento(rs.getInt("idAlojamiento"));
                Alquiler alquiler = new Alquiler(rs.getInt("idAlquiler"),alojamiento,rs.getString("titulo"),rs.getDate("fechaAlquiler"),rs.getDate("fechaInicio"),rs.getDate("fechaFin"));
                listaAlquileres.añadirAlquiler(alquiler);
            }
            return listaAlquileres;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
    * Metodo para recuperar el alquiler de una reserva.
    * 
    * @return Alquiler
    * 
    */
    public Alquiler getAlquilerDeReserva(int idReserva){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "select L.* from alquiler L inner join reservas R on ( R.idAlquiler = L.IdAlquiler ) where R.idReserva = '"+ idReserva +"'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return null;
            }
            
            Alojamiento alojamiento = getAlojamiento(rs.getInt("idAlojamiento"));
            Alquiler alquiler = new Alquiler(rs.getInt("idAlquiler"),alojamiento,rs.getString("titulo"),rs.getDate("fechaAlquiler"),rs.getDate("fechaInicio"),rs.getDate("fechaFin"));

            return alquiler;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    /*********************************************
    *** METODOS DE ADICION
    **********************************************/
        
    /**
    * Metodo para insertar un usuario en la base de datos.
    * 
    */
    public void añadirUsuario(Usuario usuario, String pass){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "INSERT INTO usuarios (`nombreCompleto`, `email`, `fotoPerfil`, `telefono`, `descripcion`, `pass`) VALUES (\"" + usuario.getNombreCompleto() + "\", \"" + usuario.getEmail() + "\", \"" + usuario.getFotoPerfil() + "\", \"" + usuario.getTelefono() + "\", \"" + usuario.getDescripcion() + "\", \""+ pass +"\")";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    /**
    * Metodo para insertar una reserva en la base de datos.
    * 
    */
    public void añadirReserva(Reserva reserva, int idUsuario, int idAlquiler){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();

            String fechaReserva = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaReserva());
            String fechaEntrada = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaEntrada());
            String fechaSalida = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaSalida());
            
            
            /* Guardamos la sentencia SQL */
            String sql = "INSERT INTO reservas (`idUsuario`, `idAlquiler`, `fechaReserva`, `fechaEntrada`, `fechaSalida`) VALUES (\"" + idUsuario + "\", \"" + idAlquiler + "\", \"" + fechaReserva + "\", \"" + fechaEntrada + "\", \"" + fechaSalida + "\")";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    /**
    * Metodo para insertar un alquiler en la base de datos.
    * 
    */
    public void añadirAlquiler(Alquiler alquiler, int idUsuario){
        try{
            int idAlojamiento = getNextIdAlojamiento();
            /* Llamamos al metodo Añadir alojamiento para guardarlo en la BD */
            añadirAlojamiento(alquiler.getAlojamiento());
            
            String fechaAlquiler = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaAlquiler());
            String fechaInicio = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaInicio());
            String fechaFin = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaFin());
            
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "INSERT INTO alquiler (`idUsuario`, `idAlojamiento`,`titulo`, `fechaAlquiler`, `fechaInicio`, `fechaFin`) VALUES (\"" + idUsuario + "\", \"" + idAlojamiento + "\", \"" + alquiler.getTitulo() + "\", \"" + fechaAlquiler + "\", \"" + fechaInicio + "\", \"" + fechaFin + "\")";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public int getNextIdAlojamiento(){
        try{
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "SELECT `AUTO_INCREMENT` as id FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'euskalrent' AND   TABLE_NAME   = 'alojamiento'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            /* Comprobamos de que el usuario exista */
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return 0;
                
            }
            int aux = rs.getInt("id");

            cerrarConexion(conexion);
            return aux;
        }
        catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
    * Metodo para insertar un alojamiento en la base de datos ( llamado desde añadirAlquiler )
    * 
    */
    public void añadirAlojamiento(Alojamiento alojamiento){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "INSERT INTO alojamiento (`tipoAlojamiento`, `numHuespedes`, `barrio`, `direccion`, `fotoAlojamiento`, `precioNoche`, `tipoCancelacion`, `Comentario`) VALUES  (\"" + alojamiento.getTipoAlojamiento() + "\", \"" + alojamiento.getNumHuespedes() + "\", \"" + alojamiento.getBarrio() + "\", \"" + alojamiento.getDireccion() + "\", \"" + alojamiento.getFotoAlojamiento() + "\",\"" + alojamiento.getPrecioNoche() + "\", \"" + alojamiento.getTipoCancelacion() + "\", \"" + alojamiento.getComentario() + "\")";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    /*********************************************
    *** METODOS DE BORRADO
    **********************************************/
    /**
    * Metodo para borrar una reserva
    * 
    */
    public void borrarReserva(int idReserva){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "DELETE FROM reservas WHERE idReserva='" + idReserva + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    /**
    * Metodo para borrar un Usuario
    * 
    */
    public void borrarUsuario(int idUsuario){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "DELETE FROM usuarios WHERE idUsuario='" + idUsuario + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    /**
    * Metodo para borrar un alojamiento
    * 
    */
    public void borrarAlquiler(Alquiler alquiler){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "DELETE FROM alquiler WHERE idAlquiler='" + alquiler.getIdAlquiler() + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
            /* Borramos el alojamiento asociado */
            borrarAlojamiento(alquiler.getAlojamiento().getIdAlojamiento());
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    /**
    * Metodo para borrar un alojamiento ( se llama desde borrarAlquiler )
    * 
    */
    public void borrarAlojamiento(int idAlojamiento){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql = "DELETE FROM alojamiento WHERE idAlojamiento='" + idAlojamiento + "'";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    /*********************************************
    *** METODOS DE ACTUALIZACION
    **********************************************/
    
    /**
    * Metodo para actualizar los datos de un usuario.
    * 
    * @param Usuario
    */
    public void actualizarUsuario(Usuario usuario, String pass){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */

            String sql =  "UPDATE usuarios SET `nombreCompleto`='"+ usuario.getNombreCompleto() +"',  `email` = '"+ usuario.getEmail() +"', `fotoPerfil`='" + usuario.getFotoPerfil() + "', `telefono`='" + usuario.getTelefono() + "',`descripcion` = '"+ usuario.getDescripcion() + "',`pass` = '"+ pass + "'  WHERE `idUsuario`='"+ usuario.getIdUsuario() +"'";
 

            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    /**
    * Metodo para actualizar los datos de una reserva
    * 
    * @param Reserva
    */
    public void actualizarReserva(Reserva reserva){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String fechaReserva = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaReserva());
            String fechaEntrada = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaEntrada());
            String fechaSalida = String.format("%1$tY-%1$tm-%1$td", reserva.getFechaSalida());
            String sql =  "UPDATE reservas SET `fechaReserva`='"+ fechaReserva+ "', `fechaEntrada`='"+ fechaEntrada +"', `fechaSalida`='"+fechaSalida+"' WHERE `idReserva`='"+reserva.getIdReserva()+"'";

            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    /**
    * Metodo para actualizar los datos de un alquiler.
    * 
    * @param Alquiler
    */
    public void actualizarAlquiler(Alquiler alquiler){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Aztualizamos el alojamiento */
            actualizarAlojamiento(alquiler.getAlojamiento());
            /* Guardamos la sentencia SQL */
            String fechaAlquiler = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaAlquiler());
            String fechaInicio = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaInicio());
            String fechaFin = String.format("%1$tY-%1$tm-%1$td", alquiler.getFechaFin());
            String sql =  "UPDATE alquiler SET `fechaAlquiler`='"+ fechaAlquiler + "', `fechaInicio`='"+ fechaInicio +"', `fechaFin`='"+ fechaFin +"' WHERE `idReserva`='"+ alquiler.getIdAlquiler() +"'";

            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    /**
    * Metodo para actualizar los datos de un alojamiento.
    * 
    * @param Alojamiento
    */
    public void actualizarAlojamiento(Alojamiento alojamiento){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql =  "UPDATE alojamiento SET `tipoAlojamiento`='"+ alojamiento.getTipoAlojamiento() +"', `numHuespedes`='"+ alojamiento.getNumHuespedes() +"', `barrio`='"+ alojamiento.getBarrio() +"', `direccion`='"+ alojamiento.getDireccion() +"', `fotoAlojamiento`='"+ alojamiento.getFotoAlojamiento() +"', `precioNoche`='"+ alojamiento.getPrecioNoche() +"', `tipoCancelacion`='"+ alojamiento.getTipoCancelacion() +"', `Comentario`='"+ alojamiento.getComentario()+ "' WHERE `idAlojamiento`='"+alojamiento.getIdAlojamiento() +"'";

            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    /**
    * Metodo para actualizar el saldo de un usuario
    * 
    * @param idUsuario
    * @param saldo
    */
    public void actualizarSaldo(int idUsuario, float saldo){
        try{
            /* Creamos la conexion con la base de datos */
            Connection conexion = getConexion();
            /* Guardamos la sentencia SQL */
            String sql =  "UPDATE usuarios SET `saldo`='"+ saldo +"' WHERE `idUsuario`='"+ idUsuario + "';";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    
    
    
}

