<%-- 
    Document   : erro
    Created on : 25/09/2015, 19:47:03
    Author     : Alisson
--%>

<%@page import="modelo.AcessosService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Tratamento de Erros - Projeto</title>
		<link href="css/geral2.css" rel="stylesheet" type="text/css" media="all"/>
		<link href="css/menuprincipal.css" rel="stylesheet" type="text/css" media="all"/>
                <link rel="shortcut icon" type="image/png" href="imagens/favicon.ico"/>
	</head>
	<body>
            <div id="container">
                <div id="header">
                        <h1> - ATS Análises Online - </h1>
                </div>
                    <div id="cssmenu">
                        <ul>
                            <c:set var="username" value="<%=session.getAttribute("login")%>" scope="session"/>
                            <c:if test="${sessionScope.username != null}" >
                                 <li><a href="principal.jsp">Página do Usuário &nbsp;</a></li>
                            </c:if>
                            <li><a href="index.jsp">Página Principal &nbsp;</a></li>
                            <li><a href="filtroPosts.jsp">Postagens com Filtro &nbsp;</a></li>
                            <li><a href="cadastrarUsuario.jsp">Cadastrar Usuário &nbsp;</a></li>
                            <li><a href="listarUsuarios.jsp">Lista de Usuários</a></li>
                            <li><a href="sobrePagina.jsp">Sobre a Página</a></li>
                        </ul>
                    </div>		
                <div id="contents">
                        <c:choose>
                            <c:when test="${sessionScope.username == null}" >
                                <h1>Olá! Desculpe pelo problema.</h1>
                                <h1>Erro Inesperado...</h1>
                            </c:when>
                            <c:when test="${sessionScope.username != null}" >
                                 <h1>Olá, Usuário ${username}! Desculpe pelo problema.</h1>
                                 <h1>Erro Inesperado...</h1>      
                            </c:when>   
                        </c:choose>
                </div>
                
                <jsp:useBean id="acessosService" class="modelo.AcessosService"/>
                
                ${acessosService.incAcessosTotal()}
                
                <div id="footer">
                        <h1>
                            Copyright © 2015 Análises Online | ALISSON TS
                        </h1>
                </div>
        </div>
    </body>
</html>	
