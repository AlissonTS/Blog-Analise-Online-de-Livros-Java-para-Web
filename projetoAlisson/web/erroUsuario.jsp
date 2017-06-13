<%-- 
    Document   : erroUsuario
    Created on : 25/09/2015, 20:07:03
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelo.AcessosService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro Cadastro Usuário - Projeto</title>
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
                            <h1 style="font-size: 23px">Olá! Já existe um usuário com o mesmo nome ou há dados inválidos em seu cadastro...</h1>
                            <h2>Clique para voltar à Página de Cadastro:</h2>
                                <form method="post" action="Servletcontroller">
                                    <input value="Pagina de Cadastro" name="opcao" type="submit"/>
                                </form>
                        </c:when>
                        <c:when test="${sessionScope.username != null}" >
                            <h1>Olá, Usuário ${username}!</h1>
                            <h2>Página do Usuário:</h2>
                                <form method="post" action="Servletcontroller">
                                    <input value="Pagina do Usuario" name="opcao" type="submit"/>
                                    <input type="submit" name="opcao" value="Logout"/>
                                </form>
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