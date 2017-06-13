package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostService {
    
      public boolean inserirPost(String u, String t, String st, String at, int ano, String cat, String as, int pag, 
              String id, String anl, String hora, String data, int an, int mes, int dia, int hor, int minuto, int segundo, String horaM, String dataM) throws Exception{
        //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("INSERT INTO Post(usuario, titulo, subtitulo, autorlivro, anolivro, categoria, assunto, paginas, idioma, analise, horario, data, ano, mes, dia, hora, minuto, segundo, dataModific, horarioModific) "
        + "values('"+u+"', '"+t+"', '"+st+"', '"+at+"', '"+ano+"', '"+cat+"', '"+as+"', '"+pag+"', '"+id+"', '"+anl+"', "
                + "'"+hora+"', '"+data+"', '"+an+"', '"+mes+"', '"+dia+"', '"+hor+"', '"+minuto+"', '"+segundo+"', '"+dataM+"', '"+horaM+"')");
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
        
      public boolean excluirPost(String nome, String data, String hora) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("DELETE FROM Post WHERE Post.usuario = '"+nome+"' AND Post.data = '"+data+"' AND Post.horario = '"+hora+"'");   
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
      
      public boolean alterarPost(String u, String t, String st, String at, int ano, String cat, String as, int pag, String id, String anl, String hora, String data, String horaM, String dataM) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("UPDATE Post SET titulo = '"+t+"', subtitulo = '"+st+"', autorlivro = '"+at+"', anolivro = '"+ano+"', categoria = '"+cat+"', "
                + "assunto = '"+as+"', paginas = '"+pag+"', idioma = '"+id+"', "
                + "analise = '"+anl+"', horarioModific = '"+horaM+"', dataModific = '"+dataM+"' WHERE usuario = '"+u+"' AND data = '"+data+"' AND horario = '"+hora+"'");   
        
        if(retorno>0){
            return true;
        }else{
            return false;
        } 
      }
      
      public List<Post> getPosts(){
        List<Post> Posts = new ArrayList<Post>();        
        PostgressDB db = new PostgressDB();
        try {
            
            Statement stmt = db.getConexao().createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Post ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");
            
            while(rs.next()){
                
                String us = rs.getString("usuario");
                String tit = rs.getString("titulo");
                String sub = rs.getString("subtitulo");
                String aut = rs.getString("autorlivro");
                int ano = rs.getInt("anolivro");
                String cat = rs.getString("categoria");
                String ass = rs.getString("assunto");
                int pag = rs.getInt("paginas");
                String id = rs.getString("idioma");
                String anl = rs.getString("analise");
                String hora = rs.getString("horario");
                String data = rs.getString("data");
                String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                
            }                        
        } catch (Exception ex) {
            ex.printStackTrace();
        }        
        return Posts;
    } 
      
    public List<Post> getPosts(String categoria){
        List<Post> Posts = new ArrayList<Post>();        
        PostgressDB db = new PostgressDB();
        try {
            
            Statement stmt = db.getConexao().createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.categoria='"+categoria+"' "
                    + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");
            
            while(rs.next()){
                
                String us = rs.getString("usuario");
                String tit = rs.getString("titulo");
                String sub = rs.getString("subtitulo");
                String aut = rs.getString("autorlivro");
                int ano = rs.getInt("anolivro");
                String cat = rs.getString("categoria");
                String ass = rs.getString("assunto");
                int pag = rs.getInt("paginas");
                String id = rs.getString("idioma");
                String anl = rs.getString("analise");
                String hora = rs.getString("horario");
                String data = rs.getString("data");
                String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                            
            }                        
        } catch (Exception ex) {
            ex.printStackTrace();
        }        
        return Posts;
    }
    
    public List<Post> getPosts2(String nome){
       List<Post> Posts = new ArrayList<Post>();        
       PostgressDB db = new PostgressDB();
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.usuario='"+nome+"' "
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String tit = rs.getString("titulo");
               String sub = rs.getString("subtitulo");
               String aut = rs.getString("autorlivro");
               int ano = rs.getInt("anolivro");
               String cat = rs.getString("categoria");
               String ass = rs.getString("assunto");
               int pag = rs.getInt("paginas");
               String id = rs.getString("idioma");
               String anl = rs.getString("analise");
               String hora = rs.getString("horario");
               String data = rs.getString("data");
               String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Posts;
   }
    
   public List<Post> getPosts3(String nome, String dt, String hr){
       List<Post> Posts = new ArrayList<Post>();        
       PostgressDB db = new PostgressDB();
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.usuario='"+nome+"' AND Post.data='"+dt+"' AND Post.horario='"+hr+"'"
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String tit = rs.getString("titulo");
               String sub = rs.getString("subtitulo");
               String aut = rs.getString("autorlivro");
               int ano = rs.getInt("anolivro");
               String cat = rs.getString("categoria");
               String ass = rs.getString("assunto");
               int pag = rs.getInt("paginas");
               String id = rs.getString("idioma");
               String anl = rs.getString("analise");
               String hora = rs.getString("horario");
               String data = rs.getString("data");
               String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Posts;
   }
   
   public List<Post> getPosts4(String autor){
       List<Post> Posts = new ArrayList<Post>();        
       PostgressDB db = new PostgressDB();
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.autorlivro LIKE '%"+autor+"%' "
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String tit = rs.getString("titulo");
               String sub = rs.getString("subtitulo");
               String aut = rs.getString("autorlivro");
               int ano = rs.getInt("anolivro");
               String cat = rs.getString("categoria");
               String ass = rs.getString("assunto");
               int pag = rs.getInt("paginas");
               String id = rs.getString("idioma");
               String anl = rs.getString("analise");
               String hora = rs.getString("horario");
               String data = rs.getString("data");
               String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Posts;
   } 
   
   public List<Post> getPosts5(String titulo){
       List<Post> Posts = new ArrayList<Post>();        
       PostgressDB db = new PostgressDB();
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.titulo LIKE '%"+titulo+"%' "
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String tit = rs.getString("titulo");
               String sub = rs.getString("subtitulo");
               String aut = rs.getString("autorlivro");
               int ano = rs.getInt("anolivro");
               String cat = rs.getString("categoria");
               String ass = rs.getString("assunto");
               int pag = rs.getInt("paginas");
               String id = rs.getString("idioma");
               String anl = rs.getString("analise");
               String hora = rs.getString("horario");
               String data = rs.getString("data");
               String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Posts;
   } 
   
   public List<Post> getPosts6(String assunto){
       List<Post> Posts = new ArrayList<Post>();        
       PostgressDB db = new PostgressDB();
       try {
           Statement stmt = db.getConexao().createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Post.assunto LIKE '%"+assunto+"%' "
                   + "ORDER BY ano DESC, mes DESC, dia DESC, hora DESC, minuto DESC, segundo DESC");

           while(rs.next()){

               String us = rs.getString("usuario");
               String tit = rs.getString("titulo");
               String sub = rs.getString("subtitulo");
               String aut = rs.getString("autorlivro");
               int ano = rs.getInt("anolivro");
               String cat = rs.getString("categoria");
               String ass = rs.getString("assunto");
               int pag = rs.getInt("paginas");
               String id = rs.getString("idioma");
               String anl = rs.getString("analise");
               String hora = rs.getString("horario");
               String data = rs.getString("data");
               String horaM = rs.getString("horarioModific");
                String dataM = rs.getString("dataModific");
                
                Post t = new Post(us, tit, sub, aut, ano, cat, ass, pag, id, anl, hora, data, horaM, dataM);
                Posts.add(t);                               
           }                        
       } catch (Exception ex) {
           ex.printStackTrace();
       }        
       return Posts;
   } 
   
   public int getPostagens(){       
         PostgressDB db = new PostgressDB();

         int contador=0;
         
         try {

             Statement stmt = db.getConexao().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM Post");
             
             while(rs.next()){
                 contador++;
             }                        
         } catch (Exception ex) {
             ex.printStackTrace();
         }        
         return contador;
      }  
}
