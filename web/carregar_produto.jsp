<!--Fazendo a importação das bibliotecas para fazer a conexão com o banco de dados-->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Produto</title>
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));

            Connection conecta;
            PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/bancojsp";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);
            //Buscar o produto pelo código digitado pelo formulário
            String sql = ("SELECT * FROM produto WHERE codigo=?");
            pst = conecta.prepareStatement(sql);
            pst.setInt(1, c);
            ResultSet resultado = pst.executeQuery();
            /*
                        verifica se o produto de codigo informado foi encontrado
                        na tabelaproduto
             */
            if (!resultado.next()) {
                //o produto na tabela, será impresso o texto abaixo 
                out.print("Este produto não foi localizado.");
            } else {
                /*
                            se encontrou o produto na tabela, vamos carregar estes dados
                            Produto tal não foi localizado
                 */
        %>
        <form method="post" action="alterar_produto.jsp">
            <p>
                <label for="codigo">Código: </label>
                <input type="number" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>">
            </p>
            <p> 
                <label for="nome">Nome do Produto: </label>
                <input type="text" name="nome" id="nome" value="<%=resultado.getString("nome")%>">
            </p>
            <p>
                <label for="marca">Marca: </label>
                <input type="text" name="marca" id="marca" value="<%=resultado.getString("marca")%>">
            </p>
            <p>
                <label for="preco">Preço: </label>
                <input type="number" name="preco" id="preco" value="<%=resultado.getString("preco")%>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>
        <%
            }
        %>
    </body>
</html>