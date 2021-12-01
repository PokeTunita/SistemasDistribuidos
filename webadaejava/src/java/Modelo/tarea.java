
package Modelo;

public class tarea {
    
    int id_tareas, estado, id_mate, id_usu;
    String des_tarea, des_mate, fecha;

    public int getId_tareas() {
        return id_tareas;
    }

    public void setId_tareas(int id_tareas) {
        this.id_tareas = id_tareas;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getId_mate() {
        return id_mate;
    }

    public void setId_mate(int id_mate) {
        this.id_mate = id_mate;
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getDes_tarea() {
        return des_tarea;
    }

    public void setDes_tarea(String des_tarea) {
        this.des_tarea = des_tarea;
    }

    public String getDes_mate() {
        return des_mate;
    }

    public void setDes_mate(String des_mate) {
        this.des_mate = des_mate;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public tarea(int id_tareas, int estado, int id_mate, String des_tarea, String des_mate, String fecha) {
        this.id_tareas = id_tareas;
        this.estado = estado;
        this.id_mate = id_mate;
        this.des_tarea = des_tarea;
        this.des_mate = des_mate;
        this.fecha = fecha;
    }

    public tarea(int id_mate, int id_usu, String des_tarea, String fecha) {
        this.id_mate = id_mate;
        this.id_usu = id_usu;
        this.des_tarea = des_tarea;
        this.fecha = fecha;
    }
    
    

    public tarea() {
    }
    
    
    
}
