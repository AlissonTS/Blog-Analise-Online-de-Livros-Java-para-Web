<%-- 
    Document   : cadastrarUsuario
    Created on : 14/09/2015, 23:05:49
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelo.AcessosService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuário - Projeto</title>
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
                        <script type="text/javascript">
                                    <!--
                                        function validar(cadastro)
                                        {
                                                d = document.cadastro;
                                                var v_nome = cadastro.nome.value;
                                                var v_email = cadastro.email.value;
                                                var v_senha = cadastro.senha.value;
                                                
                                                if(v_nome == "" || v_email == "" || v_senha == ""){
                                                        alert('Complete os campos obrigatórios que estão em branco');
                                                        cadastro.nome.focus();	
                                                        return false;
                                                }
                                        }
                                    -->
                        </script>
                        <c:choose>
                            <c:when test="${sessionScope.username == null}" >
                                <h1>Cadastrar Usuário:</h1>
                                <h2>Formulário de Cadastro:</h2>
                                <form id ="cadastro" name="cadastro" method="post" action="Servletcontroller" onSubmit="return validar(this)">
                                    <p>Usuário¹ *: <input name="nome" type="text" size="50" maxlength="30"/></p>
                                    <p>Email *: <input name="email" type="text" size="50" maxlength="50"/></p>
                                    <p>Senha *: <input name="senha" type="password" size="35" maxlength="30"/></p>
                                    <p>Descrição²: <input name="informacao" type="text" size="100" maxlength="80"/></p>
                                    <p>Idade: <input name="idade" type="text" size="100" maxlength="3"/></p>
                                    <p>Nacionalidade: <input name="nacionalidade" type="text" size="50" maxlength="30"/></p>
                                    <p>Ocupação/Escolaridade: <input name="ocupacao" type="text" size="50" maxlength="50"/></p>
                                    <p style="display: none;"><input readonly value="1" name="estado" type="text" size="100" /></p>
                                    <p>
                                            <input type="submit" name="opcao" value="Cadastrar Usuario"/>
                                            <input type="reset" name="Limpar" value="Limpar Campos"/>
                                    </p>
                                    <p>* Campos Obrigatórios</p>
                                    <p>1 - Usuário que será utilizado para Login, identificar quando está logado e identificador de Postagem.</p>
                                    <p>2 - Informações importantes sobre você, que deseja cadastrar. 80 caracteres máximo.</p>
                                </form>
                            </c:when>
                            <c:when test="${sessionScope.username != null}"> 
                                <h2>Olá, Usuário ${username}!</h2>
                                <p>Você não pode cadastrar um novo usuário pois está Logado.</p>
                                <p>Página do Usuário:</p>
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