package Datos;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Productos {

    private int id_producto;
    private String nombre;
    private String descripcion;
    private String cantidad;
    private String precio;
 

    public Productos() {
    }

    public Productos(int id_juego, String nombre, String descripcion, String cantidad, String precio) {
        this.id_producto = id_producto;
        this.nombre = nombre;
      
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.precio = precio;
 
    }

    public int getId_producto() {
        return id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    

    public String getDescripcion() {
        return descripcion;
    }

    public String getCantidad() {
        return cantidad;
    }

    public String getPrecio() {
        return precio;
    }

   

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

 

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    

    

    public void buscarInformacionj(){
        final String sql = "SELECT * FROM productos;";

        try {
            Conexion c = new Conexion();
            PreparedStatement pst = c.obtenerConexion().prepareStatement(sql);
            pst.setInt(1, id_producto);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                nombre = rs.getString(2);
               
                descripcion = rs.getString(3);
                cantidad = rs.getString(4);
                precio = rs.getString(5);
               
            }
            else{
                System.out.println("Error");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
         
        }
    }
            
    public boolean nuevoProducto() {
        boolean a = false;
        final String sql = "INSERT INTO productos (nombre, descripcion, cantidad, precio) VALUES (?, ?, ?, ?)";
        try {
            Conexion c = new Conexion();
            PreparedStatement pst=c.obtenerConexion().prepareStatement(sql);
            pst.setString(1,nombre);
        
            pst.setString(2,descripcion);
            pst.setString(3,cantidad);
            pst.setString(4, precio);
         
            pst.executeUpdate();
            
            a=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
    
     
    public ArrayList getVista (){
        try {
        Conexion con = new Conexion();
        final String QUERY = "SELECT * FROM producto";
        PreparedStatement st = con.obtenerConexion().prepareStatement(QUERY);
        ArrayList<Productos> lstUsuarioVista = new ArrayList<>();
        ResultSet registro = st.executeQuery();
        while (registro.next()){
            //lstContactoVista.add(new ContactoVista (registro.getString(1), registro.getString(2), registro.getString(3), registro.getString(4), registro.getString(5)){});
        }
        return lstUsuarioVista;
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }
    
    
}
    
