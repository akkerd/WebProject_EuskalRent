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
public class Alojamiento {
    
    private int idAlojamiento;
    private String tipoAlojamiento;
    private int numHuespedes;
    private String barrio;
    private String direccion;
    private String fotoAlojamiento;
    private int precioNoche;
    private String tipoCancelacion;
    private String comentario;
    
    public Alojamiento (int idAlojamiento,String tipoAlojamiento,int numHuespedes, String barrio, String direccion,String fotoAlojamiento ,int precioNoche,String tipoCancelacion,String comentario ){
        
        this.idAlojamiento = idAlojamiento;
        this.tipoAlojamiento = tipoAlojamiento;
        this.numHuespedes = numHuespedes;
        this.barrio = barrio;
        this.direccion = direccion;
        this.fotoAlojamiento = fotoAlojamiento;
        this.precioNoche = precioNoche;
        this.tipoCancelacion = tipoCancelacion;
        this.comentario = comentario;
        
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
     * @return the tipoAlojamiento
     */
    public String getTipoAlojamiento() {
        return tipoAlojamiento;
    }
    /**
     * @param tipoAlojamiento the tipoAlojamiento to set
     */
    public void setTipoAlojamiento(String tipoAlojamiento) {
        this.tipoAlojamiento = tipoAlojamiento;
    }
    /**
     * @return the barrio
     */
    public String getBarrio() {
        return barrio;
    }

    /**
     * @param barrio the barrio to set
     */
    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the fotoAlojamiento
     */
    public String getFotoAlojamiento() {
        return fotoAlojamiento;
    }

    /**
     * @param fotoAlojamiento the fotoAlojamiento to set
     */
    public void setFotoAlojamiento(String fotoAlojamiento) {
        this.fotoAlojamiento = fotoAlojamiento;
    }

    /**
     * @return the precioNoche
     */
    public int getPrecioNoche() {
        return precioNoche;
    }

    /**
     * @param precioNoche the precioNoche to set
     */
    public void setPrecioNoche(int precioNoche) {
        this.precioNoche = precioNoche;
    }

    /**
     * @return the tipoCancelacion
     */
    public String getTipoCancelacion() {
        return tipoCancelacion;
    }

    /**
     * @param tipoCancelacion the tipoCancelacion to set
     */
    public void setTipoCancelacion(String tipoCancelacion) {
        this.tipoCancelacion = tipoCancelacion;
    }

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * @return the numHuespedes
     */
    public int getNumHuespedes() {
        return numHuespedes;
    }

    /**
     * @param numHuespedes the numHuespedes to set
     */
    public void setNumHuespedes(int numHuespedes) {
        this.numHuespedes = numHuespedes;
    }
    
}
