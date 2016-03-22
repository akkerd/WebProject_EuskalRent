
package Modelo.Entidades;

import Modelo.Listas.ListaAlquileres;
import Modelo.Listas.ListaReservas;


public class Usuario {
    
    private int idUsuario;
    private String nombreCompleto;
    private String email;
    private String fotoPerfil;
    private float saldo;
    private int telefono;
    private String descripcion;
    private ListaReservas listaReservas;
    private ListaAlquileres listaAlquileres;

    
    public Usuario(int idUsuario,String nombreCompleto, String email,String fotoPerfil, float saldo, int telefono, String descripcion,ListaReservas listaReservas,ListaAlquileres listaAlquileres){
        this.idUsuario = idUsuario;
        this.nombreCompleto = nombreCompleto;
        this.email = email;
        this.fotoPerfil = fotoPerfil;
        this.telefono = telefono;
        this.descripcion = descripcion;
        this.listaReservas = listaReservas;
        this.listaAlquileres = listaAlquileres;
        this.saldo = saldo;

    }
    public Usuario(int idUsuario,String nombreCompleto, String email,String fotoPerfil, int telefono, String descripcion){
        this.idUsuario = idUsuario;
        this.nombreCompleto = nombreCompleto;
        this.email = email;
        this.fotoPerfil = fotoPerfil;
        this.telefono = telefono;
        this.descripcion = descripcion;
        this.listaReservas = new ListaReservas();
        this.listaAlquileres = new ListaAlquileres();
        this.saldo = 0;
    }


    /**
     * @return the idUsuario
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the nombreCompleto
     */
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    /**
     * @param nombreCompleto the nombreCompleto to set
     */
    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the fotoPerfil
     */
    public String getFotoPerfil() {
        return fotoPerfil;
    }

    /**
     * @param fotoPerfil the fotoPerfil to set
     */
    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    /**
     * @return the telefono
     */
    public int getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the listaReservas
     */
    public ListaReservas getListaReservas() {
        return listaReservas;
    }

    /**
     * @param listaReservas the listaReservas to set
     */
    public void setListaReservas(ListaReservas listaReservas) {
        this.listaReservas = listaReservas;
    }

    /**
     * @return the listaAlquileres
     */
    public ListaAlquileres getListaAlquileres() {
        return listaAlquileres;
    }

    /**
     * @param listaAlquileres the listaAlquileres to set
     */
    public void setListaAlquileres(ListaAlquileres listaAlquileres) {
        this.listaAlquileres = listaAlquileres;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }
    
    
}
