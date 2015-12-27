/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Listas;

import Modelo.Entidades.Alojamiento;
import java.util.ArrayList;

/**
 *
 * @author Asierph
 */
public class ListaAlojamientos {
     
    private ArrayList<Alojamiento> alojamientos;
    /**
    * Metodo constructor
    */
     public ListaAlojamientos(){        
     }
    /**
    * Metodo que devuelve el numero de alojamientos de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroAumentos(){
        return alojamientos.size(); 
    }
}
