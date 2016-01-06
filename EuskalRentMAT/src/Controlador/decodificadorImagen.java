/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/*import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import Modelo.conexionBD.ConexionBD;*/
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Diegaker
 */
public class decodificadorImagen {
    
    public decodificadorImagen(){    }
    
    
    public BufferedImage decodeToImage(String imageString) {

        BufferedImage image = null;
        byte[] imageByte;
        try {
            Base64 decoder = new Base64();
            imageByte = decoder.decode(imageString);
            ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            bis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return image;
    }

    public String encodeToString(BufferedImage image, String type) {
        String imageString = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();

        try {
            ImageIO.write(image, type, bos);
            byte[] imageBytes = bos.toByteArray();

            Base64 encoder = new Base64();
            imageString = encoder.encodeAsString(imageBytes);

            bos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageString;
    }
    
    public String guardarFotoUsuarioEnSistema( BufferedImage bi, int idUsuario ){
        
        String ruta = "C:/Users/Diegaker/Documents/GitHub/EuskalRent/EuskalRentMAT/web/img/perfil/perfil"+ idUsuario +".jpg";
                
        try {
            ImageIO.write( bi, "jpg", new File(ruta));
        } catch (IOException ex) {
            ruta = "";
            Logger.getLogger(decodificadorImagen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ruta;
    }
    
     public String guardarFotoAlojamientoEnSistema( BufferedImage bi, int idAlojamiento ){
        
        String ruta = "C:/Users/Diegaker/Documents/GitHub/EuskalRent/EuskalRentMAT/web/img/alojamientos/alojamiento"+ idAlojamiento +".jpg";
                
        try {
            ImageIO.write( bi, "jpg", new File(ruta));
        } catch (IOException ex) {
            ruta = "";
            Logger.getLogger(decodificadorImagen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ruta;
    }
    
    /*Blob decodeToImage(String imageString) throws IOException, SQLException {
        byte[] decodedByte = Base64.decodeBase64(imageString);    
        
        ConexionBD con = ConexionBD.getConexionBD();
        Blob myBlob = con.getConexion().createBlob();
        //myBlob.setBytes(decodedByte.length - 1, decodedByte);
        if(myBlob == null)
            // SHIT
            myBlob.free();
        else
            myBlob.setBytes(0, new byte[10]);
        
        return myBlob;
    }
    
    String encodeToImage(Blob paramBlob) throws IOException, SQLException {
        
        int blobLength = (int) paramBlob.length();  
        byte[] binaryData = paramBlob.getBytes(1, blobLength);
        
        byte[] endodedBytes = Base64.encodeBase64(binaryData);
        String encodedString = endodedBytes.toString();
        
        return encodedString;
    }*/
}

 