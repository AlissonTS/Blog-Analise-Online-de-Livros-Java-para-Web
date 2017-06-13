<%-- 
    Document   : listarFiltro
    Created on : 31/10/2015, 15:27:17
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="modelo.ComentarioService"%>
<%@page import="modelo.SeguirService"%>
<%@page import="modelo.Acessos"%>
<%@page import="modelo.AcessosService"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.LogarService"%>
<%@page import="modelo.PostService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
try{%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Filtro - Projeto</title>
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
                        <div id="contents">
                            <form method="post" action="Servletcontroller"><p class="post">Voltar para Página de Filtro:
                                    <input value="Pagina de Filtro" name="opcao" type="submit"/></p>
                            </form>
                        </div>
                        <c:if test="${fn:length(t) gt 0}">
                            <div id="contents">
                                    <h1 style="text-align: center;">${fn:length(t)} Resultado(s) no Filtro!</h1> 
                            </div> 
                        </c:if>        
                        <c:if test="${t!=null}">
                            <c:set value="0" var="i"/>
                            <c:forEach var="post" items="${t}"> 
                                <c:if test="${i==0}">
                                    <div id="headerPost">
                                        <h2>Postagens Recentes>> </h2>
                                        <c:set value="1" var="i"/>
                                    </div>
                                </c:if>
                                <div id="postagens">            
                                        <h1 style="text-align: center;">Título: ${post.titulo}</h1>
                                        <h2 style="text-align: center;">Subtítulo: ${post.subtitulo}</h2>
                                        <h2>Autor(es) do Livro: ${post.autorlivro}</h2>
                                        <h2>Categoria: ${post.categoria}</h2>
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

                                           <form id="mostrarPost" method="post"  action="Servletcontroller">
                                                       <p style="display: none;">Usuário: <input readonly value="${post.usuario}" name="nome" type="text"/></p>
                                                       <p style="display: none;">Data da Postagem: <input readonly value="${post.data}" name="data" type="text" size="30"/></p>
                                                       <p style="display: none;">Horário da Postagem: <input readonly value="${post.hora}" name="hora" type="text" size="30"/></p>
                                                       <p style="text-align: right">
                                                           <input type="submit" name="opcao" value="Mostrar Postagem"  style="height: 35px; width: 200px;"/>
                                                       </p> 
                                          </form>        
                                    </div>            
                                </c:forEach>
                                <c:if test="${i==0}">
                                    <div id="postagens">
                                        <h1>Sem Postagens no Filtro!</h1>
                                    </div>
                                </c:if>    
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
<%}catch(NullPointerException e){
                AcessosService ac = new AcessosService();
                                
                ac.decAcessosTotal();
                String pagina;
                pagina = "index.jsp";
                response.sendRedirect(pagina);
} 
%>    