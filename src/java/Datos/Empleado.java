package Datos;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Empleado {

    private int id_empleado;
    private String nombre;
    private String ap_pat;
    private String ap_mat;
    private String fechNa;
    private String num_tel;

     private String matricula;
    private String contra;

    public Empleado() {
    }

    public Empleado(int id_empleado, String nombre, String ap_pat, String ap_mat, String fechNa, String num_tel, String matricula, String contra) {
        this.id_empleado = id_empleado;
        this.nombre = nombre;
        this.ap_pat = ap_pat;
        this.ap_mat = ap_mat;
        this.fechNa = fechNa;
        this.num_tel = num_tel;
        this.matricula = matricula;
        this.contra = contra;
    }

    public int getId_empleado() {
        return id_empleado;
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

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getContra() {
        return contra;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
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

    

    public boolean iniciarSession() {

        boolean a = false;
        final String sql = "SELECT * FROM empleado WHERE matricula=? AND contra=?";

        try {
            Conexion c = new Conexion();
            PreparedStatement pst = c.obtenerConexion().prepareStatement(sql);
            pst.setString(1, matricula);
            pst.setString(2, contra);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                id_empleado = rs.getInt(1);
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
        final String sql = "SELECT * FROM empleado WHERE id_empleado=?;";

        try {
            Conexion c = new Conexion();
            PreparedStatement pst = c.obtenerConexion().prepareStatement(sql);
            pst.setInt(1, id_empleado);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                nombre = rs.getString(2);
                ap_pat = rs.getString(3);
                ap_mat = rs.getString(4);
                fechNa = rs.getString(5);
                num_tel = rs.getString(6);
                matricula=rs.getString(7);
            }
            else{
                System.out.println("Error");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
         
        }
    }
            
    public boolean nuevoEmpleado() {
        boolean a = false;
        final String sql = "INSERT INTO empleado (nombre, ap_pat, ap_mat, fechnac, no_tel, matricula, contra) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Conexion c = new Conexion();
            PreparedStatement pst=c.obtenerConexion().prepareStatement(sql);
            pst.setString(1,nombre);
            pst.setString(2,ap_pat);
            pst.setString(3,ap_mat);
            pst.setString(4,fechNa);
            pst.setString(5, num_tel);
            pst.setString(6,matricula);
            pst.setString(7, contra);;
            pst.executeUpdate();
            
            a=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
}
