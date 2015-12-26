/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

import java.util.Date;

/**
 *
 * @author Asierph
 */
public class Alquiler {
    private int idAlquiler;
    private int idUsuario;
    private int idAlojamiento;
    private Date fechaAlquiler;
    private Date fechaInicio;
    private Date fechaFin;
    
    public Alquiler (int idAlquiler,int idUsuario,int idAlojamiento,Date fechaAlquiler,Date fechaInicio,Date fechaFin){
        this.idAlquiler = idAlquiler;
        this.idUsuario = idUsuario;
        this.idAlojamiento = idAlojamiento;
        this.fechaAlquiler = fechaAlquiler;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    /**
     * @return the idAlquiler
     */
    public int getIdAlquiler() {
        return idAlquiler;
    }

    /**
     * @param idAlquiler the idAlquiler to set
     */
    public void setIdAlquiler(int idAlquiler) {
        this.idAlquiler = idAlquiler;
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
     * @return the idAlojamiento
     */
    public int getIdAlojamiento() {
        return idAlojamiento;
    }

    /**
     * @param idAlojamiento the idAlojamiento to set
     */
    public void setIdAlojamiento(int idAlojamiento) {
        this.idAlojamiento = idAlojamiento;
    }

    /**
     * @return the fechaAlquiler
     */
    public Date getFechaAlquiler() {
        return fechaAlquiler;
    }

    /**
     * @param fechaAlquiler the fechaAlquiler to set
     */
    public void setFechaAlquiler(Date fechaAlquiler) {
        this.fechaAlquiler = fechaAlquiler;
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    
}
