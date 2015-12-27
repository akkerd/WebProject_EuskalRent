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
public class Reserva {
    
    private int idReserva;
    private int idAlquiler;
    private Date fechaReserva;
    private Date fechaEntrada;
    private Date fechaSalida;
    
    public Reserva ( int idReserva,int idAlquiler, Date fechaReserva, Date fechaEntrada, Date fechaSalida){
       this.idReserva = idReserva;
       this.idAlquiler = idAlquiler;
       this.fechaReserva = fechaReserva;
       this.fechaEntrada = fechaEntrada;
       this.fechaSalida = fechaSalida;
    }

    /**
     * @return the idReserva
     */
    public int getIdReserva() {
        return idReserva;
    }

    /**
     * @param idReserva the idReserva to set
     */
    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
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
     * @return the fechaReserva
     */
    public Date getFechaReserva() {
        return fechaReserva;
    }

    /**
     * @param fechaReserva the fechaReserva to set
     */
    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    /**
     * @return the fechaEntrada
     */
    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    /**
     * @param fechaEntrada the fechaEntrada to set
     */
    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    /**
     * @return the fechaSalida
     */
    public Date getFechaSalida() {
        return fechaSalida;
    }

    /**
     * @param fechaSalida the fechaSalida to set
     */
    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
    
}
