<%@ page import="javax.servlet.http.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Destrua a sessão
    HttpSession secao = request.getSession();
    secao.invalidate();
    
    // Redirecione para a página de login ou qualquer outra página desejada
    response.sendRedirect("index.jsp");
%>
