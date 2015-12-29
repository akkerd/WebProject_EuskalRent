
package Modelo.Listas;

import Modelo.Entidades.Alquiler;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Asierph
 */
public class ListaAlquileres {
    
    private ArrayList<Alquiler> alquileres;
    
    /**
    * Metodo constructor
    */
     public ListaAlquileres(){ 
         this.alquileres = new ArrayList<Alquiler>();
     }
    /**
    * Metodo que devuelve el numero de alquileres de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroAlquileres(){
        return alquileres.size(); 
    }
    /**
    * Metodo que borra un alquiler de la lista.
    * @param idAlquiler id del Alquiler a borrar.
    */
    public void borrarAlquiler(int idAlquiler){
        Iterator<Alquiler> it = alquileres.iterator();
        boolean controlador = false;
        while(it.hasNext() && controlador == false){
            if ( it.next().getIdAlquiler() == idAlquiler){
                controlador = true;
            }
        }
    }
    /**
    * Metodo que añade un nuevo Alquiler
    * @param Alquiler Alquiler a añadir.
    */
    public void añadirAlquiler(Alquiler alquiler){
        alquileres.add(alquiler);
    }
}
