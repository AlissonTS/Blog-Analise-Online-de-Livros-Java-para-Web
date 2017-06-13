<%-- 
    Document   : filtroPosts
    Created on : 21/09/2015, 20:31:05
    Author     : Alisson
--%>
<%@page import="modelo.ComentarioService"%>
<%@page import="modelo.Acessos"%>
<%@page import="modelo.AcessosService"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.LogarService"%>
<%@page import="modelo.PostService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Filtro - Projeto</title>
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
                                        function validar2(){
                                                var v_filtro = filtro.tipos.value;

                                                if(v_filtro == ""){
                                                    alert('Assinale a categoria para a Filtragem.');
                                                    window.location.href = "filtroPosts.jsp";
                                                    return false;
                                                }
                                        }
                                        function validar3(){
                                                var v_filtro = filtro.pesquisa.value;
                                                var v_filtro2 = filtro.pesq.value;

                                                if(v_filtro == "" && v_filtro2==""){
                                                    alert('Assinale a pesquisa para a Filtragem.');
                                                    window.location.href = "filtroPosts.jsp";
                                                    return false;
                                                }
                                                else if(v_filtro != "" && v_filtro2==""){
                                                    alert('Digite a pesquisa para a Filtragem.');
                                                    window.location.href = "filtroPosts.jsp";
                                                    return false;
                                                }
                                                else if(v_filtro == "" && v_filtro2!=""){
                                                    alert('Assinale a pesquisa para a Filtragem.');
                                                    window.location.href = "filtroPosts.jsp";
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
                    <div id="contents">
                        <h2>Espaço para Postagens, Sugestões, Análises e Críticas sobre Livros</h2>
                        <form id="filtro" method="post" action="Servletcontroller">
                            <table style="margin-bottom: 2%; width: 99%;">
                                <tr><th colspan="2"><h1 style="text-align: center">Filtros</h1></th></tr>
                                    <tr><th><h2>Pesquisar Por:
                                    <input value="Filtrar Pesquisa" name="opcao" type="submit" onClick="return validar3(this)"/></h2></th></tr>
                                    <tr><td><p>
                                        <input type="radio" name="pesquisa" value="Autor do Livro" />Autor do Livro
                                        <input type="radio" name="pesquisa" value="Titulo do Livro" />Título do Livro
                                        <input type="radio" name="pesquisa" value="Assunto do Livro" />Assunto do Livro
                                        <input type="radio" name="pesquisa" value="Nome do Usuario" />Nome do Usuário</p>   
                                        <p>Digite: 
                                            <input id="login" name="pesq" type="text" size="20"/></p>
                                        </td></tr> 
                                <tr><th colspan="2"><h2>Categorias:
                                    <input value="Filtrar Categoria" name="opcao" type="submit" onClick="return validar2(this)"/>
                                </h2></th></tr>
                                <tr><td colspan="2"><p>	
                                    <input type="radio" name="tipos" value="Administracao" />Administração
                                    <input type="radio" name="tipos" value="Agropecuaria" />Agropecuária
                                    <input type="radio" name="tipos" value="Artes" />Artes
                                    <input type="radio" name="tipos" value="Audiolivro" />Audiolivro
                                    <input type="radio" name="tipos" value="Autoajuda" />Autoajuda
                                    <input type="radio" name="tipos" value="Ciencias Biologicas" />Ciências Biológicas</p><p>
                                    <input type="radio" name="tipos" value="Ciencias Exatas" />Ciências Exatas
                                    <input type="radio" name="tipos" value="Ciencias Humanas e Sociais" />Ciências Humanas e Sociais
                                    <input type="radio" name="tipos" value="Contabilidade" />Contabilidade
                                    <input type="radio" name="tipos" value="Cursos e Idiomas" />Cursos e Idiomas
                                    <input type="radio" name="tipos" value="Dicionarios" />Dicionários</p><p>
                                    <input type="radio" name="tipos" value="Didaticos" />Didáticos
                                    <input type="radio" name="tipos" value="Direito" />Direito
                                    <input type="radio" name="tipos" value="Economia" />Economia
                                    <input type="radio" name="tipos" value="Engenharia e Tecnologia" />Engenharia e Tecnologia
                                    <input type="radio" name="tipos" value="Esoterismo" />Esoterismo
                                    <input type="radio" name="tipos" value="Esperitualismo" />Esperitualismo</p><p>
                                    <input type="radio" name="tipos" value="Esportes e Lazer" />Esportes e Lazer
                                    <input type="radio" name="tipos" value="Gastronomia" />Gastronomia
                                    <input type="radio" name="tipos" value="Geografia e Historia" />Geografia e História
                                    <input type="radio" name="tipos" value="Informatica" />Informática
                                    <input type="radio" name="tipos" value="Linguistica" />Linguística</p><p>
                                    <input type="radio" name="tipos" value="Literatura Extrangeira" />Literatura Extrangeira
                                    <input type="radio" name="tipos" value="Literatura Nacional" />Literatura Nacional
                                    <input type="radio" name="tipos" value="Turismo" />Turismo
                                    <input type="radio" name="tipos" value="Literatura Infantojuvenil" />Literatura Infantojuvenil
                                    <input type="radio" name="tipos" value="Medicina" />Medicina</p><p>
                                    <input type="radio" name="tipos" value="Psicologia" />Psicologia
                                    <input type="radio" name="tipos" value="Religiao" />Religião
                                    <input type="radio" name="tipos" value="Outros" />Outros
                                    </p></td></tr></table>
                        </form>
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
