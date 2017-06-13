<%-- 
    Document   : excluirPost
    Created on : 24/09/2015, 21:59:59
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.PostService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar/Excluir Postagem - Projeto</title>
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
            <c:choose>
                <c:when test="${sessionScope.username == null}" >
                    <div id="contents">
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
                                <h1>Usuário não Logado..</h1>
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
                                <% String x = (String)session.getAttribute("login");%>
                                <h2>Usuário <%=x %>.</h2>
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
                                <div id="headerPost">
                                    <h1>${fn:length(t)} - Postagens Cadastradas: </h1>
                                </div>
                                <c:set value="1" var="i"/>
                            </c:if>
                            
                            <div id="postagens">
                                <div class="divspoiler">
                                <h2>Postagem: T : ${post.titulo} - ST : ${post.subtitulo}</h2>
                                    <input type="button" value="Mostrar" onclick="if (this.parentNode.nextSibling.childNodes[0].style.display != '') { this.parentNode.nextSibling.childNodes[0].style.display = ''; this.value = 'Ocultar'; } else { this.parentNode.nextSibling.childNodes[0].style.display = 'none'; this.value = 'Mostrar'; }" />
                                </div><div><div class="spoiler" style="display: none;">                             
                                        <h2 style="text-align: center;">Postagem: T : ${post.titulo} - ST : ${post.subtitulo}</h2>
                                        <h3>Autor(es) do Livro: ${post.autorlivro}</h3>                                       
                                        <h3>Ano do Livro: ${post.anolivro}</h3>
                                        <h3>Categoria: ${post.categoria}</h3>
                                        <h3>Assunto: ${post.assunto}</h3>
                                        <h3>Quantidade de Páginas: ${post.paginas}</h3>
                                        <h3>Idioma: ${post.idioma}</h3>
                                        <h2>Análise:</h2>
                                        <p class="post">${post.analise}</p>
                                        <p class="post">Postado por: ${post.usuario}</p>
                                        <p class="post">Data da Publicação: ${post.data} - 
                                        Hora da Publicação: ${post.hora}</p>  
                                        <p class="post">Data da Última Atualização: ${post.dataM} - 
                                        Hora da Última Atualização: ${post.horaM}</p>
                                </div></div>   

                                <form id="excluir/alterar" action="Servletcontroller">
                                    <p style="display: none;">Usuário: <input readonly value="${post.usuario}" name="nome" type="text"/></p>
                                    <p style="display: none;">Data da Postagem: <input readonly value="${post.data}" name="data" type="text" size="30"/></p>
                                    <p style="display: none;">Horário da Postagem: <input readonly value="${post.hora}" name="hora" type="text" size="30"/></p>
                                    <p>
                                        <input type="submit" name="opcao" value="Alterar"/>
                                        <input type="submit" name="opcao" value="Excluir"/>
                                    </p> 
                                </form>
                                    
                           </div> 
                        </c:forEach>
                        <c:if test="${i==0}">
                            <div id="postagens"><h2>Você não possui Postagens...</h2></div>
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

