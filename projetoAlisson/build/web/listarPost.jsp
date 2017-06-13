<%-- 
    Document   : listarPost
    Created on : 31/10/2015, 10:28:54
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
        <title>Postagens do Usuário - Projeto</title>
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
                        <h2>Usuário ${username}.</h2>
                            <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                    <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                            </form>
                        </div>
                        <jsp:useBean id="postService" class="modelo.PostService"/>
                        <c:set value="${postService.getPosts2(username)}" var="t"/>
                            <c:if test="${t!=null}"> 
                                <c:set value="0" var="i"/>
                                    <c:forEach var="post" items="${t}">
                                        <c:if test="${i==0}">
                                            <c:if test="${sessionScope.username != null}">
                                                <div id="headerPost">
                                                    <h1>${fn:length(t)} - Postagens Cadastradas:</h1>
                                                </div>
                                            <c:set value="1" var="i"/>
                                            </c:if>
                                        </c:if>
                                        <div id="postagens">            
                                            <h1 style="text-align: center;">Título: ${post.titulo}</h1>
                                            <h2 style="text-align: center;">Subtítulo: ${post.subtitulo}</h2>
                                            <h2>Autor(es) do Livro: ${post.autorlivro}</h2>
                                            <h2>Categoria: ${post.categoria}</h2>
                                            <p class="post">Postado por: ${post.usuario}</p>
                                            <p class="post">Data da Publicação: ${post.data} - 
                                             Hora da Publicação: ${post.hora}</p>

                                            <form id="mostrarPost" action="Servletcontroller">
                                                <p style="display: none;">Usuário: <input readonly value="${post.usuario}" name="nome" type="text"/></p>
                                                <p style="display: none;">Data da Postagem: <input readonly value="${post.data}" name="data" type="text" size="30"/></p>
                                                <p style="display: none;">Horário da Postagem: <input readonly value="${post.hora}" name="hora" type="text" size="30"/></p>
                                                <p style="text-align: right">
                                                    <input type="submit" name="opcao" value="Mostrar Postagem Usuario"  style="height: 35px; width: 200px"/>
                                                </p> 
                                           </form>
                                       </div>
                                    </c:forEach>
                                    <c:if test="${i==0}">
                                        <div id="postagens">
                                            <h1>Sem Postagens no Blog...</h1>
                                        </div>
                                    </c:if>
                            </c:if>        
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
