package Datos;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario {

    private int id_usuario;
    private String nombre;
    private String ap_pat;
    private String ap_mat;
    private String fechNa;
    private String num_tel;
    private String correo;
     private String matricula;
    private String contra;

    public Usuario() {
    }

    public Usuario(int id_usuario, String nombre, String ap_pat, String ap_mat, String fechNa, String num_tel, String correo, String contra) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.ap_pat = ap_pat;
        this.ap_mat = ap_mat;
        this.fechNa = fechNa;
        this.num_tel = num_tel;
        this.correo = correo;
        this.contra = contra;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getAp_pat() {
        return ap_pat;
    }

    public String getAp_mat() {
        return ap_mat;
    }

    public String getFechNa() {
        return fechNa;
    }

    public String getNum_tel() {
        return num_tel;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCorreo() {
        return correo;
    }

    public String getContra() {
        return contra;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setAp_pat(String ap_pat) {
        this.ap_pat = ap_pat;
    }

    public void setAp_mat(String ap_mat) {
        this.ap_mat = ap_mat;
    }

    public void setFechNa(String fechNa) {
        this.fechNa = fechNa;
    }

    public void setNum_tel(String num_tel) {
        this.num_tel = num_tel;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public void setCorrero(String correo) {
        this.correo = correo;
    }

    public boolean iniciarSession() {

        boolean a = false;
        final String sql = "SELECT * FROM usuario WHERE correo=? AND contra=?";

        try {
            Conexion c = new Conexion();
            PreparedStatement pst = c.obtenerConexion().prepareStatement(sql);
            pst.setString(1, correo);
            pst.setString(2, contra);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                id_usuario = rs.getInt(1);
                nombre = rs.getString(2);
                ap_pat = rs.getString(3);
                ap_mat = rs.getString(4);
                fechNa = rs.getString(5);
                num_tel = rs.getString(6);
                a = true;
            }
            else{
                a=false;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            a = false;
        }
        return a;
    }

    public void buscarInformacion(){
        final String sql = "SELECT * FROM usuario WHERE id_usuario=?;";

        try {
            Conexion c = new Conexion();
            PreparedStatement pst = c.obtenerConexion().prepareStatement(sql);
            pst.setInt(1, id_usuario);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                nombre = rs.getString(2);
                ap_pat = rs.getString(3);
                ap_mat = rs.getString(4);
                fechNa = rs.getString(5);
                num_tel = rs.getString(6);
                correo=rs.getString(7);
            }
            else{
                System.out.println("Error");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
         
        }
    }
            
    public boolean nuevoUsuario() {
        boolean a = false;
        final String sql = "INSERT INTO usuario (nombre, ap_pat, ap_mat, fechnac, no_tel, correo, contra) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Conexion c = new Conexion();
            PreparedStatement pst=c.obtenerConexion().prepareStatement(sql);
            pst.setString(1,nombre);
            pst.setString(2,ap_pat);
            pst.setString(3,ap_mat);
            pst.setString(4,fechNa);
            pst.setString(5, num_tel);
            pst.setString(6,correo);
            pst.setString(7, contra);;
            pst.executeUpdate();
            
            a=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
   
}
