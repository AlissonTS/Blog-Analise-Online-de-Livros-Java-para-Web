package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class PostgressDB {
    
        public static void main(String arg[]){
            //PostgresDB pd = new PostgresDB();
            //pd.getConexao();
            
            try{
                new PostgressDB().getConexao();
                
                System.out.println("Conexão realizada com sucesso :) ");
            }catch(Exception e){
                System.out.println("Conexão não efetuada :/");
                e.printStackTrace();
            }
        }
        
        public Connection getConexao() throws Exception{
            Connection conn = null;
            
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/interneta_projeto";
            String usuario = "postgres";
            String senha = "1234";
            
            conn = DriverManager.getConnection(url, usuario, senha);
            return conn;
        }
}
