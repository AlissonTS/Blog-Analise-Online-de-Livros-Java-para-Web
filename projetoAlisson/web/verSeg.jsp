<%-- 
    Document   : verSeg
    Created on : 15/11/2015, 14:40:45
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="modelo.Seguir"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.Logar"%>
<%@page import="modelo.PostService"%>
<%@page import="modelo.LogarService"%>
<%@page import="modelo.SeguirService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários que Você Segue- Projeto</title>
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
                    <c:when test="${sessionScope.username != null}">
                        <div id="contents"> 
                            <jsp:useBean id="seguirService" class="modelo.SeguirService"/>
                                <c:set value="${seguirService.listarSeguir(username)}" var="t"/>
                                <c:if test="${fn:length(t) gt 0}">
                                    <h2>Usuário ${username}.</h2>
                                            <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                                    <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                                            </form>  
                                     <h1>${fn:length(t)} - Usuário(s) que você segue: </h1>

                                     <c:set value="${seguirService.listarSeguir(username)}" var="l"/>
                                     <c:if test="${t!=null}">
                                         <c:set value="0" var="i"/>
                                            <c:forEach var="seg" items="${l}">
                                                <c:if test="${i==0}">
                                                    <c:set value="1" var="i"/>
                                                </c:if>
                                                <form method="post" action="Servletcontroller">
                                                    <p class="post"> - ${seg.usuarioS}
                                                        <input style="display: none;" readonly value="${seg.usuarioS}" name="nome" type="text"/>
                                                        <input style="display: none;" readonly value="${username}" name="nomeL" type="text"/>
                                                        <input type="submit" name="opcao" value="Ver Inf Usuario" style="background-color:white; Border:1px solid"/>
                                                        <input type="submit" name="opcao" value="unFollow" style="background-color:white; Border:1px solid"/></p>
                                                </form>   
                                            </c:forEach>    
                                     </c:if>
                                </c:if>
                                <c:if test="${fn:length(t) le 0}">
                                     <h2>Usuário ${username}.</h2>
                                        <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                                <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                                        </form>
                                   <h2>Você não segue nenhum Usuário da Página!</h2>   
                                </c:if>   
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
