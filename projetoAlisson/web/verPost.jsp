<%-- 
    Document   : verPost
    Created on : 21/10/2015, 23:19:21
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="modelo.Comentario"%>
<%@page import="modelo.ComentarioService"%>
<%@page import="modelo.SeguirService"%>
<%@page import="modelo.Acessos"%>
<%@page import="modelo.AcessosService"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.PostService"%>
<%@page import="modelo.LogarService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Postagem - Projeto</title>
            <link href="css/geral.css" rel="stylesheet" type="text/css" media="all"/>
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
                <div id="tudo">
                    <div id="menu2">
                        <div id="menu2Header">
                            <h1>Login:</h1>
                        </div>
                        <div id="menu2Corpo">
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
                                        function validar2(cadastrar)
                                        {
                                                d = document.cadastrar;
                                                                                               
                                                if(d.comentario.value.length == ""){
                                                        alert('Complete o campo obrigatório que está em branco!');
                                                        d.comentario.focus();	
                                                        return false;
                                                }	
                                        }
                                // ]]>
                            </script>
                            <c:choose>
                               <c:when test="${sessionScope.username == null}" >
                                    <form id="logar" method="post" action="Servletcontroller" onSubmit="return validar(this)">
                                         <p class="login">Usuário: </p><p class="login"><input id="login" name="login" type="text" size="30" maxlength="30"/></p>
                                         <p class="login">Senha:</p>
                                         <p class="login"><input id="senha" name="senha" type="password" size="30" maxlength="30"/></p>
                                         <p class="login"><input value="Logar" name="opcao" type="submit"/><input type="reset" value="Reset"/></p>
                                     </form>
                                </c:when>
                                <c:when test="${sessionScope.username != null}" >
                                    <p>Olá, Usuário ${username}!</p>
                                    <p>Página do Usuário:</p>
                                    <form method="post" action="Servletcontroller">
                                        <input value="Pagina do Usuario" name="opcao" type="submit"/>
                                        <input type="submit" name="opcao" value="Logout"/>
                                    </form>
                                </c:when>   
                            </c:choose>
                        </div>
                        <div id="menu2Corpo" style="padding: 10px; margin-top: 5%;">
                              <table border="0" align="center"><tr><td>
                                          <embed src="http://www.cryd.com.br/relogios-feitos-em-flash/swf/07-10/691b.swf" quality="high" wmode="transparent" type="application/x-shockwave-flash" width="170" height="20">
                                          </embed></td></tr></table>
                        </div> 
                        <div id="menu2Header" style="margin-top: 5%;">
                            <h1>Parceiros Top:</h1>
                        </div>
                        <div id="menu2Parceiro">
                            <img src="imagens/parceiroTop.jpg" alt="" height="100" width="283">
                            <img src="imagens/parceiroTop.jpg" alt="" height="100" width="283">
                        </div>
                        <div id="menu2Header" style="margin-top: 5%;">
                            <h1>Parceiros:</h1>
                        </div>
                        <div id="menu2Parceiro">
                            <img src="imagens/parceiroNormal.jpg" alt="" height="100" width="283">
                            <img src="imagens/parceiroNormal.jpg" alt="" height="100" width="283">
                        </div>
                        <div id="menu2Header" style="margin-top: 5%">
                            <h1>Informações: </h1>
                        </div>
                        <div id="menu2Corpo" style="padding: 5%; margin-bottom: 5%">
                           <jsp:useBean id="logarService" class="modelo.LogarService"/>
                           <jsp:useBean id="postService" class="modelo.PostService"/>
                           <jsp:useBean id="comentarioService" class="modelo.ComentarioService"/>
                           <jsp:useBean id="acessosService" class="modelo.AcessosService"/>
                
                           ${acessosService.incAcessosTotal()}
                          
                            <p>Usuários Cadastrados: ${logarService.usuario}.</p>
                            <p>Postagens Cadastradas: ${postService.postagens}.</p>
                            <p>Comentários na Página: ${comentarioService.contadorComent()}.</p>
                            <c:set value="${acessosService.acessos}" var="t"/>
                            <c:if test="${t!=null}">
                                <c:forEach var="user" items="${t}">
                                    <p>Total de Acessos da Página: ${user.getAcessosTotal()}</p>
                                </c:forEach>                             
                            </c:if> 
                        </div>
                    </div>
                    <c:set value="${posts}" var="t"/>
                        <c:if test="${t!=null}">
                            <c:forEach var="post" items="${t}">
                                <div id="headerPost">
                                    <h1>Postagem: </h1>
                                </div>
                                <div id="postagens">            
                                    <h1 style="text-align: center;">Título: ${post.titulo}</h1>
                                    <h2 style="text-align: center;">Subtítulo: ${post.subtitulo}</h2>
                                    <h3>Autor(es) do Livro: ${post.autorlivro}</h3>
                                    <h3>Ano do Livro: ${post.anolivro}</h3>
                                    <h3>Categoria: ${post.categoria}</h3>
                                    <h3>Assunto: ${post.assunto}</h3>
                                    <h3>Quantidade de Páginas: ${post.paginas}</h3>
                                    <h3>Idioma: ${post.idioma}</h3>
                                    <h2>Análise:</h2>
                                    <p class="post">${post.analise}</p>
                                    <form method="post" action="Servletcontroller">
                                        <input style="display: none;" readonly value="${post.usuario}" name="nome" type="text"/>
                                        <p class="post">Postado por: ${post.usuario} 
                                            <input type="submit" name="opcao" value="Ver Usuario" style="background-color:white; Border:1px solid"/>

                                        <c:if test="${sessionScope.username != null}" >
                                             <c:set value="${username}" var="i"/>
                                             <c:set value="${post.usuario}" var="j"/>
                                             <c:if test="${i ne j}">
                                                 <jsp:useBean id="seguirService" class="modelo.SeguirService"/>
                                                 <c:set value="${seguirService.verificSeguir(i, j)}" var="retorno"/>
                                                 <input style="display: none;" readonly value="${username}" name="nomeL" type="text"/>
                                                 <c:if test="${retorno>0}">
                                                     <input type="submit" name="opcao" value="unFollow" style="background-color:white; Border:1px solid"/></p>
                                                 </c:if>    
                                                 <c:if test="${retorno<=0}">
                                                     <input type="submit" name="opcao" value="Follow" style="background-color:white; Border:1px solid"/>
                                                 </c:if>
                                             </c:if>    
                                        </c:if>
                                    </form>        
                                        <p class="post">Data da Publicação: ${post.data} - 
                                         Hora da Publicação: ${post.hora}</p>
                                        <p class="post">Data da Última Atualização: ${post.dataM} - 
                                        Hora da Última Atualização: ${post.horaM}</p>      
                                </div>
                                <div id="headerPost">
                                    <h1>Comentários >></h1>
                                </div>
                                <div id="contents">
                                    <c:set value="${comentarioService.getComent(post.usuario, post.data, post.hora)}" var="c"/>
                                        <c:if test="${fn:length(c) gt 0}">
                                            <c:forEach var="coment" items="${c}">
                                                <div style="border-bottom: 2px dashed #CCC;">
                                                    <p class="post">${coment.usuarioC} - ${coment.dataC} - ${coment.horarioC}</p>
                                                    <p class="post">Comentário:</p><p class="post">${coment.comentario}</p>

                                                    <c:if test="${sessionScope.username != null}" >
                                                        <c:if test="${(username eq coment.usuarioC) or (username eq coment.usuario)}">
                                                            <form method="post" action="Servletcontroller">
                                                                <input style="display: none;" readonly value="${coment.usuarioC}" name="nome" type="text" size="50"/>
                                                                <input style="display: none;" readonly value="${coment.dataC}" name="data" type="text" size="50"/>
                                                                <input style="display: none;" readonly value="${coment.horarioC}" name="horario" type="text" size="50"/>
                                                                <input type="submit" name="opcao" value="Excluir Comentario"/>
                                                            </form>    
                                                        </c:if>    
                                                    </c:if>
                                                </div>
                                            </c:forEach>    
                                        </c:if>
                                        <c:if test="${fn:length(c)==0}">
                                            <h2>Nenhum Comentário nesta Postagem.</h2>
                                        </c:if>
                                </div>                
                                <div id="headerPost">
                                    <h1>Comentar:</h1>
                                </div>
                                <div id="contents">
                                    <form name="cadastrar" method="post" action="Servletcontroller" onSubmit="return validar2(this)">
                                        <c:choose>
                                            <c:when test="${sessionScope.username != null}" >
                                                <p class="post">Usuário: <input readonly value="${username}" name="nome" type="text" size="50"/></p>
                                                <input style="display: none;" value="${post.usuario}" name="nomeA" type="text" size="50"/>
                                            </c:when>
                                            <c:when test="${sessionScope.username == null}" >
                                                <p class="post">Deve estar logado para poder comentar na Postagem:</p>
                                            </c:when>
                                        </c:choose>
                                        <p style="display: none;"><input readonly value="${post.data}" name="dataP" type="text" size="30"/></p>
                                        <p style="display: none;"><input readonly value="${post.hora}" name="horarioP" type="text" size="30"/></p>
                                        <p class="post">Comentário *:</p>
                                        <p>
                                                <textarea type="text" name="comentario" rows="5" cols="80" maxlength="80"></textarea>
                                        </p> 
                                        <c:if test="${sessionScope.username != null}" >
                                            <p>
                                                <input type="submit" name="opcao" value="Comentar Postagem"/>
                                                <input type="reset" name="Limpar" value="Limpar Campos"/>
                                            </p>
                                        </c:if>
                                        <p class="post">* Observação - Campo Obrigatório:</p>
                                        <p class="post">Comentário deverá ter no máximo 80 caracteres.</p>
                                        <p class="post">Evite utilizar acentos nas palavras.</p>
                                    </form>
                                </div>
                            </c:forEach>
                        </c:if>    
            </div>        
            <div id="footer">
                    <h1>
                        Copyright © 2015 Análises Online | ALISSON TS
                    </h1>
            </div>	
        </div>
    </body>
</html>	
