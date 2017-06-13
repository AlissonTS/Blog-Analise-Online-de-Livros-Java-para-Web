package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LogarService {
    
            public boolean autenticarUsuario(String u, String s){

                PostgressDB db = new PostgressDB();

                boolean autenticado=false;

                try{
                    Statement stmt = db.getConexao().createStatement();
                    ResultSet valor = stmt.executeQuery("SELECT * FROM Usuario "
                    +"WHERE usuario='"+u+"' and senha='"+s+"'");

                    autenticado = valor.next();
                    System.out.println("autenticado= valor.next(); "+autenticado);
                }catch(Exception e){       
                        e.printStackTrace();      
                }
                  return autenticado;               
            }

            public boolean inserirUsuario(String u, String e, String s, String na, String ocup, String inf, int id, int et, String dc, String hc, String dm, String hm) throws Exception{
            //pegar uma conexao com o banco
            PostgressDB db = new PostgressDB();
            Statement stmt = db.getConexao().createStatement();

            int retorno = 
                stmt.executeUpdate("INSERT INTO Usuario(usuario, senha, emailUsuario, nacionalidade, ocupacao, informacaoImp, idade, estadoConta, dataCriacao, horarioCriacao, dataModific, horarioModific) "
                        + "values ('"+u+"','"+s+"','"+e+"','"+na+"','"+ocup+"','"+inf+"','"+id+"','"+et+"','"+dc+"','"+hc+"','"+dm+"','"+hm+"')");

            if(retorno > 0){
                return true;
            }else{
                return false;
            }
           }

           public boolean alterarUsuario(String u, String se, String em, String nac, String ocup, String inf, int id, int et, String dc, String hc, String dm, String hm) throws Exception{
             //pegar uma conexao com o banco
            PostgressDB db = new PostgressDB();
            Statement stmt = db.getConexao().createStatement();

            int retorno = 
            stmt.executeUpdate("UPDATE Usuario SET senha = '"+se+"', emailUsuario = '"+em+"', "
                    + "nacionalidade = '"+nac+"', ocupacao = '"+ocup+"', informacaoImp = '"+inf+"', "
                    + "idade = '"+id+"', estadoConta = '"+et+"', dataCriacao = '"+dc+"', horarioCriacao = '"+hc+"', "
                    + "dataModific = '"+dm+"', horarioModific = '"+hm+"' WHERE usuario = '"+u+"'");   

            if(retorno>0){
                return true;
            }else{
                return false;
            } 
          } 
       
        public List<Logar> Listar(){       
           PostgressDB db = new PostgressDB();
           List<Logar> Logar = new ArrayList<Logar>();

           try {

               Statement stmt = db.getConexao().createStatement();
               ResultSet rs = stmt.executeQuery("SELECT * FROM Usuario ORDER BY usuario ASC");

               while(rs.next()){
                   String us = rs.getString("usuario");
                   String se = rs.getString("senha");
                   String em = rs.getString("emailUsuario");
                   String na = rs.getString("nacionalidade");
                   String ocup = rs.getString("ocupacao");
                   String inf = rs.getString("informacaoImp");
                   int id = rs.getInt("idade");
                   int et = rs.getInt("estadoConta");
                   String dc = rs.getString("dataCriacao");
                   String hc = rs.getString("horarioCriacao");
                   String dm = rs.getString("dataModific");
                   String hm = rs.getString("horarioModific");

                   Logar t = new Logar(us, se, em, na, ocup, inf, hc, dc, hm, dm, id, et);
                   Logar.add(t);                
               }                        
           } catch (Exception ex) {
               ex.printStackTrace();
           }        
           return Logar;
        }    
       
        public List<Logar> getUsuario(String Usuario){
            List<Logar> Logar = new ArrayList<Logar>();        
            PostgressDB db = new PostgressDB();

            try {

                Statement stmt = db.getConexao().createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Usuario WHERE Usuario.usuario = '"+Usuario+"'");

                while(rs.next()){

                    String us = rs.getString("usuario");
                    String se = rs.getString("senha");
                    String em = rs.getString("emailUsuario");
                    String na = rs.getString("nacionalidade");
                    String ocup = rs.getString("ocupacao");
                    String inf = rs.getString("informacaoImp");
                    int id = rs.getInt("idade");
                    int et = rs.getInt("estadoConta");
                    String dc = rs.getString("dataCriacao");
                    String hc = rs.getString("horarioCriacao");
                    String dm = rs.getString("dataModific");
                    String hm = rs.getString("horarioModific");

                    Logar t = new Logar(us, se, em, na, ocup, inf, hc, dc, hm, dm, id, et);
                    Logar.add(t);                
                }                        
            } catch (Exception ex) {
                ex.printStackTrace();
            }        
            return Logar;
       }
        
      public int getUsuario(){       
         PostgressDB db = new PostgressDB();

         int contador=0;
         
         try {

             Statement stmt = db.getConexao().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM Usuario");
             
             while(rs.next()){
                 contador++;
             }                        
         } catch (Exception ex) {
             ex.printStackTrace();
         }        
         return contador;
      }
}
