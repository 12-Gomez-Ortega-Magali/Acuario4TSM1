package conexion;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private String url;
    private String user;
    private String passwd;
    private Connection con;

    public Conexion() {
        url="jdbc:postgresql://localhost/Acuario";
        user="postgres";
        passwd="123456";
    }
    public Connection obtenerConexion(){
        try {
             Class.forName("org.postgresql.Driver");
                 System.out.println("exito");
             return con=DriverManager.getConnection(url,user,passwd);
         
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    public static void main(String[] args) {
        Conexion x=new Conexion();
        x.obtenerConexion();
    }
}
