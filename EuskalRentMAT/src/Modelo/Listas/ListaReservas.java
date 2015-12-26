/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Listas;

import Modelo.Entidades.Reserva;
import java.util.ArrayList;

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
     }
    /**
    * Metodo que devuelve el numero de reservas de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroAumentos(){
        return reservas.size(); 
    }
    
}
