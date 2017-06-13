package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AcessosService {
   
        public void incAcessosTotal() throws Exception{
         //pegar uma conexao com o banco
            PostgressDB db = new PostgressDB();
            Statement stmt = db.getConexao().createStatement();

            
            stmt.executeUpdate("UPDATE Acessos SET acessosTotal=acessosTotal+1 WHERE cod=1");   
        }
        
        public void decAcessosTotal() throws Exception{
         //pegar uma conexao com o banco
            PostgressDB db = new PostgressDB();
            Statement stmt = db.getConexao().createStatement();

            
            stmt.executeUpdate("UPDATE Acessos SET acessosTotal=acessosTotal-1 WHERE cod=1");   
        }
        
        public List<Acessos> getAcessos(){
            List<Acessos> acessos = new ArrayList<Acessos>();        
            PostgressDB db = new PostgressDB();

            try {

                Statement stmt = db.getConexao().createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Acessos WHERE Acessos.cod = 1");

                while(rs.next()){

                    int acT = rs.getInt("acessosTotal");

                    Acessos a = new Acessos(acT);
                    acessos.add(a);                
                }                        
            } catch (Exception ex) {
                ex.printStackTrace();
            }        
            return acessos;
      }
}
