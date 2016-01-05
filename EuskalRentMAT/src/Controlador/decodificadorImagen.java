/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import javax.sql.rowset.serial.SerialBlob;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Diegaker
 */
public class decodificadorImagen {
    
    public decodificadorImagen(){
        
    }
    
    SerialBlob decodeToImage(String imageString) throws IOException, SQLException {
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] imageByte = decoder.decodeBuffer(imageString);    
        return new SerialBlob(imageByte);    
    }
    
    String encodeToImage(SerialBlob image) throws IOException, SQLException {
        BASE64Encoder coder = new BASE64Encoder();
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        coder.encode( image.getBinaryStream(), os);
        String imageStr = os.toString();
        return imageStr;
    }
}

 
