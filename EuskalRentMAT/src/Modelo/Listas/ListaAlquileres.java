
package Modelo.Listas;

import Modelo.Entidades.Alquiler;
import java.util.ArrayList;

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
     }
    /**
    * Metodo que devuelve el numero de alquileres de la lista.
    * @return Numero de objetos que consta la lista.
    */
    public int getNumeroAumentos(){
        return alquileres.size(); 
    }
}
