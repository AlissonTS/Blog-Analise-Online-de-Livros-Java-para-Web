package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SeguirService {
        
    public int verificSeguir(String l, String s) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int contador=0;
        
        try{
            ResultSet rs = stmt.executeQuery("SELECT * FROM Seguir where usuarioL='"+l+"' and usuarioS='"+s+"'");
            while(rs.next()){
                 contador++;
            }                        
         }catch (Exception ex) {
             ex.printStackTrace();
         }
        
         return contador;
      }
    
        public List<Seguir>listarSeguir(String l) throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        List<Seguir> Seg = new ArrayList<Seguir>();
        
        try{
            ResultSet rs = stmt.executeQuery("SELECT * FROM Seguir where usuarioL='"+l+"'");
            while(rs.next()){
                 String usS = rs.getString("usuarioS");
                 String usL = rs.getString("usuarioL");
                 
                Seguir t = new Seguir(usL, usS);
                Seg.add(t);
            }                        
         }catch (Exception ex) {
             ex.printStackTrace();
         }
        
        return Seg;
    }
    
    public boolean Seguir(String l, String s) throws Exception{
        //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("INSERT INTO Seguir(usuarioL, usuarioS) values('"+l+"', '"+s+"')");
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
        
      public boolean deSeguir(String l, String s)  throws Exception{
         //pegar uma conexao com o banco
        PostgressDB db = new PostgressDB();
        Statement stmt = db.getConexao().createStatement();
        
        int retorno = 
        stmt.executeUpdate("DELETE FROM Seguir WHERE usuarioL='"+l+"' and usuarioS='"+s+"'");   
        
        if(retorno>0){
            return true;
        }else{
            return false;
        }
      }
    
}
