/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Listas;

import Modelo.Entidades.Reserva;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Asierph
 */
public class ListaReservas {
    
     private ArrayList<Reserva> reservas;
     
    /**
    * Metodo constructor
    */
     public ListaReservas(){ 
         this.reservas = new ArrayList<Reserva>();
     }
    /**
    * Metodo que devuelve el numero de reservas de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroReservas(){
        return getReservas().size(); 
    }
    /**
    * Metodo que borra una reserva de la lista.
    * @param idReserva id de la reserva a borrar.
    */
    public void borrarReserva(int idReserva){
        Iterator<Reserva> it = getReservas().iterator();
        boolean controlador = false;
        while(it.hasNext() && controlador == false){
            if ( it.next().getIdReserva() == idReserva){
                controlador = true;
            }
        }
    }
    /**
    * Metodo que añade una nueva reserva Reserva
    * @param Reserva Reserva a añadir.
    */
    public void añadirReserva(Reserva reserva){
        getReservas().add(reserva);
    }

    /**
     * @return the reservas
     */
    public ArrayList<Reserva> getReservas() {
        return reservas;
    }

    /**
     * @param reservas the reservas to set
     */
    public void setReservas(ArrayList<Reserva> reservas) {
        this.reservas = reservas;
    }
    
}
