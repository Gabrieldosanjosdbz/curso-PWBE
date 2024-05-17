package dal;

import java.sql.*;

public class ModuloConexao {
    
    // Método para estabelecer a conexão com o banco de dados
    public static Connection conector(){
        // Objeto para representar a conexão
        java.sql.Connection conexao = null;
        
        // Informações de configuração do banco de dados
        String driver = "com.mysql.cj.jdbc.Driver"; // Driver JDBC para o MySQL
        String url = "jdbc:mysql://localhost:3307/pousados"; // URL de conexão com o banco de dados
        String user = "root"; // Nome de usuário do banco de dados
        String password = ""; // Senha do banco de dados
        
        try {
            // Carrega o driver JDBC
            Class.forName(driver);
            
            // Estabelece a conexão com o banco de dados utilizando as informações fornecidas
            conexao = DriverManager.getConnection(url, user, password);
            
            // Retorna a conexão estabelecida
            return conexao;
        }
        // Captura qualquer exceção que possa ocorrer durante o processo de conexão
        catch (Exception e) {
            // Em caso de exceção, retorna null para indicar falha na conexão
            return null;
        }
    }
}
