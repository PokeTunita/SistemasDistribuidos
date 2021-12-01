
package Control;

import Modelo.*; 
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
        
public class Acciones {
    
    public static boolean registrar(String name, String pass){
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("usuario", name);
            peticion.put("contra", pass);
            String urlpeticion = "/Registrar";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("registrado")){
                return true;
            }else{
             return false;
            }
        }catch(Exception e){
            System.out.println(e.getCause());
            return false;
        }
    }
    
    public static usuario login(String name, String pass){
        usuario user = new usuario();
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("nombre", name);
            peticion.put("contra", pass);
            String urlPeticion = "/Iniciar";
            JSONObject Respuesta = API.peticionPostJSONObject(urlPeticion, peticion);
            String status = Respuesta.getString("status");
            if(status.equals("encontrado")){
                JSONObject datos = Respuesta.getJSONObject("usuario");
                user.setContra_usu(datos.getString("contra_usu"));
                user.setId_usu(datos.getInt("id_usu"));
                user.setNom_usu(datos.getString("nom_usu"));
            }else{
                user.setNom_usu("no encontrado");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            user.setNom_usu("no encontrado");
        }
        return user;
    }
    
    public static boolean addTarea(tarea tarea){
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("des_tarea", tarea.getDes_tarea());
            peticion.put("fecha", tarea.getFecha());
            peticion.put("id_mate", tarea.getId_mate());
            peticion.put("id_usu", tarea.getId_usu());
            String urlpeticion = "/Agregar/Tarea";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("guardada")){
                return true;
            }else{
                return false;
            }
        
        }catch(Exception e){
            System.out.println(e.getCause());
            return false;
        }
    }
    
    public static boolean DeleteTarea(int tarea, int user){
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("id_tarea", tarea);
            peticion.put("id_usu", user);
            String urlpeticion = "/Eliminar/Tarea";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("Eliminada")){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public static boolean RespondidaTarea(int tarea, int user){
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("id_tarea", tarea);
            peticion.put("estado", 1);
            peticion.put("id_usu", user);
            String urlpeticion = "/Modificar/Estado/Tarea";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("modificado")){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public static boolean PendienteTarea(int tarea, int user){
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("id_tarea", tarea);
            peticion.put("estado", 0);
            peticion.put("id_usu", user);
            String urlpeticion = "/Modificar/Estado/Tarea";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("modificado")){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public static List<tarea> ListTareas(int id_usu){
        List<tarea> listatareas = new ArrayList<tarea>();
        try{
            JSONObject peticion = new JSONObject();
            peticion.put("id_usu", id_usu);
            String urlpeticion = "/Tareas/Usuario";
            JSONObject respuesta = API.peticionPostJSONObject(urlpeticion, peticion);
            String status = respuesta.getString("status");
            if(status.equals("encontrados")){
                JSONArray datos = respuesta.getJSONArray("datos");
                for(int i=0; i<datos.length(); i++){
                    //int id_tareas, int estado, int id_mate, String des_tarea, String des_mate, String fecha
                    //tarea.id_tarea, tarea.fecha , tarea.estado, tarea.des_tarea, tarea.id_mate, materia.des_mate
                    JSONObject DTarea = datos.getJSONObject(i);
                    tarea tarea = new tarea(DTarea.getInt("id_tarea"), DTarea.getInt("estado"),  DTarea.getInt("id_mate"), DTarea.getString("des_tarea"), DTarea.getString("des_mate"), DTarea.getString("fecha"));
                    listatareas.add(tarea);
                }
            }
        }catch(Exception e){
            System.out.println(e.getCause());
        }
        return listatareas;
    }
    
}
