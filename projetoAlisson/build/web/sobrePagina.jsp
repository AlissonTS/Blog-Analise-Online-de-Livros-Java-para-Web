<%-- 
    Document   : sobrePagina
    Created on : 03/10/2015, 23:39:45
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelo.Acessos"%>
<%@page import="java.util.List"%>
<%@page import="modelo.AcessosService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.LogarService"%>
<%@page import="modelo.PostService"%>
<%@page import="modelo.ComentarioService"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre a Página - Projeto</title>
		<link href="css/geral.css" rel="stylesheet" type="text/css" media="all"/>
		<link href="css/menuprincipal.css" rel="stylesheet" type="text/css" media="all"/>
                <link rel="shortcut icon" type="image/png" href="imagens/favicon.ico"/>
	</head>
	<body>
            
            <div id="fb-root"></div>
                <script>(function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0];
                  if (d.getElementById(id)) return;
                  js = d.createElement(s); js.id = id;
                  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5";
                  fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
            
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
                    <div id="contents">
                        <h1>Sobre a Página: </h1>
                        <h2>Finalidade Principal:</h2>
                        <img style="border: 3px solid #D7D7D7" src="imagens/livros2.jpg" alt="" align="middle" height="270" width="550" style="border-radius: 10px;">
                        <p class="fonte">Atender aos usuários da internet com postagens inteligentes sobre dicas, análises de livros lidos pelos usuários
                            cadastrados. Este então é então um espaço destinado para postagens para as pessoas que desejarem compartilhar o que acharam sobre livros com outras pessoas.</p>
                        <p class="fonte">Aqui você poderá achar uma análise sobre um livro que você quer comprar, mas que não sabe como foi a aceitação
                            do público, se a história é cativante e que agrada ao seu estilo de leitura. Além da análise, da dica, você poderá ver informações do livro, como quantidade de páginas, idioma, 
                            categoria em que o livro pode estar inserido e qual tema precisamente ele trata. Tudo isso é feito visando acada vez mais que as pessoas possam conhecer novos livros e expandir seus horizontes
                            e imaginação no mundo da leitura.</p>
                        <h2>Dados Atualizados da Página:</h2>
                        <p style="font-size: 17px;">Atualmente a página possui no Sistema:</p>
                            <ul style="font-size: 17px;">
                                <li>Usuários cadastrados: ${logarService.usuario}.</li>
                                <li>Postagens cadastradas: ${postService.postagens}</li>
                                <li>Comentários na Página: ${comentarioService.contadorComent()}.</li>
                                <c:if test="${t!=null}">
                                    <c:forEach var="user" items="${t}">
                                        <li>Total de Acessos da Página: ${user.getAcessosTotal()}</li>
                                    </c:forEach>                             
                                </c:if>      
                            </ul>    
                        <h3>Por: Alisson Trindade Souza - Administrador da Página</h3>
                    </div>
                    <div id="headerPost">
                        <h1>Deixe sua Opinião sobre a Página:</h1>
                    </div>
                    <div id="contents">
                        <div class="fb-comments" data-href="http://localhost:8080/projetoAlisson/sobrePagina.jsp" data-width="700" data-numposts="5"></div>    
                    </div>        
                </div>
                <div id="footer">
                        <h1>
                            Copyright © 2015 Análises Online | ALISSON TS
                        </h1>
                </div>	
        </div>
    </body>
</html>	
