/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Listas;


import Modelo.Entidades.Puntuacion;
import java.util.ArrayList;

/**
 *
 * @author Asierph
 */
public class ListaPuntuaciones {
    
    private ArrayList<Puntuacion> puntuaciones;
    
    /**
    * Metodo constructor
    */
     public ListaPuntuaciones(){        
     }
    /**
    * Metodo que devuelve el numero de puntuaciones de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroAumentos(){
        return puntuaciones.size(); 
    }
    
}
