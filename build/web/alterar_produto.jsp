<!--Fazendo a importação das bibliotecas para fazer a conexão com o banco de dados-->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar os Produtos</title>
    </head>
    <body>
        <%
            int codigo;
            String nome, marca;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            preco = Double.parseDouble(request.getParameter("preco"));
            
            Connection conecta;
            PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/bancojsp";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);
            String sql = ("UPDATE produto SET codigo=?,nome=?,marca=? WHERE preco=?");
            pst = conecta.prepareStatement(sql);
            pst.setInt(1, codigo);
            pst.setString(2, nome);
            pst.setString(3, marca);
            pst.setDouble(4, preco);
            pst.executeUpdate();
            out.print("Os dados do produto " + codigo + " foram alterados");
        %>
    </body>
</html>