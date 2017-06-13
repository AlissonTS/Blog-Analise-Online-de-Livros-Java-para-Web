package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ComentarioService {
        
    public boolean inserirComent(String u, String uC, String d, String h, String dC, String hC, int a, int m, int di, int hr, int min, int seg, String coment) throws Exception{
        //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("INSERT INTO Comentario(usuario, usuarioC, data, horario, dataC, horarioC, ano, mes, dia, hora, minuto, segundo, comentario)"
                + "values ('"+u+"', '"+uC+"', '"+d+"', '"+h+"', '"+dC+"', '"+hC+"', '"+a+"', '"+m+"', '"+di+"', '"+hr+"', '"+min+"', '"+seg+"', '"+coment+"')");
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
    
    public boolean excluirComent(String nome, String data, String hora) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("DELETE FROM Comentario WHERE Comentario.usuarioC = '"+nome+"' AND Comentario.dataC = '"+data+"' AND Comentario.horarioC = '"+hora+"'");   
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
    
    public boolean excluirComent2(String nome, String data, String hora) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("DELETE FROM Comentario WHERE Comentario.usuario = '"+nome+"' AND Comentario.data = '"+data+"' AND Comentario.horario = '"+hora+"'");   
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
    
    public List<Comentario> getComent(String nome, String dt, String hr){
       List<Comentario> Coment = new ArrayList<Comentario>();        
       PostgressDB db = new PostgressDB();
       
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Comentario WHERE Comentario.usuario='"+nome+"' AND Comentario.data='"+dt+"' AND Comentario.horario='"+hr+"'"
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String usC = rs.getString("usuarioC");
               String dat = rs.getString("data");
               String h = rs.getString("horario");
               String datC = rs.getString("dataC");
               String hC = rs.getString("horarioC");
               int ano = rs.getInt("ano");
               int mes = rs.getInt("mes");
               int dia = rs.getInt("dia");
               int hor = rs.getInt("hora");
               int min = rs.getInt("minuto");
               int seg = rs.getInt("segundo");
               String coment = rs.getString("comentario");
               
                
                Comentario t = new Comentario(us, usC, dat, h, datC, hC, ano, mes, dia, hor, min, seg, coment);
                Coment.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Coment;
    }
    
    public int contadorComent(){        
       PostgressDB db = new PostgressDB();
       int contador=0;
       
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Comentario");
           
           while(rs.next()){
               contador++;
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return contador;
    }   
}
