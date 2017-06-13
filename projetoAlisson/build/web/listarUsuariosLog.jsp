<%-- 
    Document   : listarUsuariosLog
    Created on : 28/11/2015, 00:39:31
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.Logar"%>
<%@page import="modelo.PostService"%>
<%@page import="modelo.LogarService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Usuários - Projeto</title>
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
            <script type="text/javascript">
                        // <![CDATA[
                                function validar() 
                                {
                                        var v_login = logar.login.value;
                                        var v_senha = logar.senha.value;

                                        if (v_login == "" && v_senha!="") {
                                                alert('Preencha o campo de Login.');
                                                logar.login.focus();
                                                return false;
                                        }
                                        else if (v_senha == "" && v_login!=""){
                                                alert('Preencha o campo de Senha.');
                                                logar.senha.focus();
                                                return false;
                                        }
                                        else if(v_login == "" && v_senha == ""){
                                                alert('Preecha por inteiro os campos de Login.')
                                                logar.login.focus();
                                                return false;
                                        }	
                                }
                        // ]]>
                    </script>    
                <c:choose>
                    <c:when test="${sessionScope.username == null}" >
                        <div id="contents">
                            <h1>Usuário não Logado... </h1>
                            <form id="logar" method="post" action="Servletcontroller" onSubmit="return validar(this)">
                                <p>Login:</p>
                                <p>Usuário: </p><p><input id="login" name="login" type="text" size="30" maxlength="30"/></p>
                                <p>Senha:</p>
                                <p><input id="senha" name="senha" type="password" size="30" maxlength="30"/></p>
                                <p><input value="Logar" name="opcao" type="submit"/><input type="reset" value="Reset"/></p>
                            </form>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.username != null}" >
                        <div id="contents"> 
                            <h2>Usuário ${username}!</h2>
                            <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                    <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                            </form>
                        </div>
                        <jsp:useBean id="logarService" class="modelo.LogarService"/>    
                        <c:set value="${logarService.Listar()}" var="t"/>    
                            <div id="headerPost">
                                <h1>${fn:length(t)} - Usuários Cadastrados na Página!</h1>
                            </div>
                            <div id="contents">
                                <h1>Lista de Usuários Cadastrados:</h1>
                                    <c:forEach var="lista" items="${t}">
                                        <form method="post" action="Servletcontroller">
                                            <input style="display: none;" readonly value="${lista.usuario}" name="nome" type="text"/>
                                            <p style="font-size: 17px; display: inline;">- ${lista.usuario} &nbsp;&nbsp;</p> 
                                                <input type="submit" name="opcao" value="Ver Inf Usuario" style="background-color:white; Border:1px solid"/>

                                            <c:if test="${sessionScope.username != null}" >
                                                 <c:set value="${username}" var="i"/>
                                                 <c:set value="${lista.usuario}" var="j"/>
                                                 <c:if test="${i ne j}">
                                                     <jsp:useBean id="seguirService" class="modelo.SeguirService"/>
                                                     <c:set value="${seguirService.verificSeguir(i, j)}" var="retorno"/>
                                                     <input style="display: none;" readonly value="${username}" name="nomeL" type="text"/>
                                                     <c:if test="${retorno>0}">
                                                         <input type="submit" name="opcao" value="unFollow" style="background-color:white; Border:1px solid; display: inline;"/>
                                                     </c:if>    
                                                     <c:if test="${retorno<=0}">
                                                         <input type="submit" name="opcao" value="Follow" style="background-color:white; Border:1px solid; display:inline;"/>
                                                     </c:if>
                                                 </c:if>    
                                            </c:if>
                                        </form>
                                    </c:forEach> 
                            </div>
                    </c:when>
                </c:choose>         
            <div id="footer">
                <h1>
                    Copyright © 2015 Análises Online | ALISSON TS
                </h1>
            </div>
        </div>    
    </body>
</html>

