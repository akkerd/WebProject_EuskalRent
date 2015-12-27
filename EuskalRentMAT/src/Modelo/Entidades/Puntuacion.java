/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

/**
 *
 * @author Asierph
 */
public class Puntuacion {
    
    private int idPuntuacion;
    private int idUsuario;
    private int idReserva;
    private int nota;
    private String Comentario;
    
    public Puntuacion (int idPuntuacion,int idUsuario,int idReserva, int nota,String Comentario){
        this.idPuntuacion = idPuntuacion;
        this.idUsuario = idUsuario;
        this.idReserva = idReserva;
        this.nota = nota;
        this.Comentario = Comentario;
    }
    
}
