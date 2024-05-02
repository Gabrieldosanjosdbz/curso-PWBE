<!--Fazendo a importação das bibliotecas para fazer a conexão com o banco de dados-->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>JSP Index</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
<body>
    <div class="page">
        <form class="formLogin">
            <h1>Login</h1>
            <p>Digite os seus dados de acesso no campo abaixo.</p>
            <label for="email">E-mail</label>
            <input type="email" placeholder="Digite seu e-mail" name="txtuser" id="txtuser" autofocus="true" />
            <label for="password">Senha</label>
            <input type="password" placeholder="Digite seu e-mail" name="txtpass" id="txtpass"/>
            <input type="submit" value="Acessar" class="btn" />
        </form>
        <%
                //Fazendo a conexão com o banco de dados
                Connection conecao;
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3307/bancojsp";
                String user = "root";
                String password = "";

                conecao = DriverManager.getConnection(url, user, password);

        
            if (conecao !=null) {
                 if ((request.getParameter("txtuser") !=null) && (request.getParameter("txtpass") !=null)) {
                     String login, pass;
                     login = request.getParameter("txtuser");
                     pass = request.getParameter("txtpass");
                     Statement st;
                     ResultSet rs;
                     st = conecao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                     rs = st.executeQuery("select * from admin where email ='"+login+"' and senha='"+pass+"'");
                     if(rs.next()){
                         response.sendRedirect("home.html");
                     }
                    // out.println(login);
                   //  out.println(pass);
                 }
             }else {
                 out.print("Não é  possivel logar");
             }        
        %>
    </div>
    
</body>
</html>