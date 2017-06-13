<%-- 
    Document   : alterarPost
    Created on : 24/09/2015, 21:16:56
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
<%@page import="modelo.Post"%>
<%@page import="modelo.PostService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Postagem - Projeto</title>
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
                    <c:when test="${sessionScope.username != null}" >
                        <div id="contents">
                            <h2>Usuário ${username}.</h2>
                            <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                    <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                            </form>
                        </div>
                        <div id="contents">     
                            <h2>Postagem para alteração: </h2>
                            <c:set value="${posts}" var="t"/>
                                <c:if test="${t!=null}">
                                    <c:forEach var="post" items="${t}">
                                        <script language="javascript" type="text/javascript">
                                            <!--
                                                function validar2(cadastrar)
                                                {
                                                        d = document.cadastrar;

                                                        d.nome.value = "${username}";    

                                                        if(d.titulo.value.length == "" || d.autor.value.length == "" 
                                                            || d.tipos.value.length == "" || d.assunto.value.length == "" || d.analise.value.length == "" 
                                                            || d.nome.value.length == ""){
                                                                alert('Complete os campos obrigatórios que estão em branco');
                                                                d.titulo.focus();	
                                                                return false;
                                                        }	
                                                }
                                            -->
                                        </script>
                                        <form name="cadastrar" id="cadastrar" method="post" action="Servletcontroller" onSubmit="return validar2(this)">
                                                <h3>Por Favor, coloque as palavras sem acentuação!</h3>
                                                <p>Título *: <input value="${post.titulo}" name="titulo" type="text" size="50" maxlength="40"/></p>
                                                <p>Subtítulo: <input value="${post.subtitulo}" name="subtitulo" type="text" size="50" maxlength="40"/></p>
                                                <p>Autor(es) do Livro *: <input value="${post.autorlivro}" name="autor" type="text" size="50" maxlength="50"/></p>
                                                <p>Ano: <input value="${post.anolivro}" name="ano" type="text" size="10" maxlength="4"/></p>
                                                <p>Categoria *:</p>
                                                <p>	
                                                    <input type="radio" name="tipos" value="Administracao" />Administração
                                                    <input type="radio" name="tipos" value="Agropecuaria" />Agropecuária
                                                    <input type="radio" name="tipos" value="Artes" />Artes
                                                    <input type="radio" name="tipos" value="Audiolivro" />Audiolivro
                                                    <input type="radio" name="tipos" value="Autoajuda" />Autoajuda
                                                    <input type="radio" name="tipos" value="Ciencias Biologicas" />Ciências Biológicas</p><p>
                                                    <input type="radio" name="tipos" value="Ciencias Exatas" />Ciências Exatas
                                                    <input type="radio" name="tipos" value="Ciencias Humanas e Sociais" />Ciências Humanas e Sociais
                                                    <input type="radio" name="tipos" value="Contabilidade" />Contabilidade
                                                    <input type="radio" name="tipos" value="Cursos e Idiomas" />Cursos e Idiomas</p><p>
                                                    <input type="radio" name="tipos" value="Dicionarios" />Dicionários
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
                                                    <input type="radio" name="tipos" value="Linguistica" />Linguística
                                                    <input type="radio" name="tipos" value="Literatura Extrangeira" />Literatura Extrangeira</p><p>
                                                    <input type="radio" name="tipos" value="Literatura Nacional" />Literatura Nacional
                                                    <input type="radio" name="tipos" value="Literatura Infantojuvenil" />Literatura Infantojuvenil
                                                    <input type="radio" name="tipos" value="Medicina" />Medicina
                                                    <input type="radio" name="tipos" value="Psicologia" />Psicologia
                                                    <input type="radio" name="tipos" value="Religiao" />Religião
                                                    <input type="radio" name="tipos" value="Turismo" />Turismo
                                                    <input type="radio" name="tipos" value="Outros" />Outros
                                                </p>
                                                <p>Assunto *: <input value="${post.assunto}" name="assunto" type="text" size="50" maxlength="40"/></p>
                                                <p>Páginas: <input value="${post.paginas}" name="paginas" type="text" size="10" maxlength="6"/></p>
                                                <p>Idioma: <input value="${post.idioma}" name="idioma" type="text" size="30" maxlength="30"/></p>
                                                <p>Análise do Livro *:</p>
                                                <p>
                                                        <textarea type="text" name="analise" rows="15" cols="90" maxlength="600">${post.analise}</textarea>
                                                </p>
                                                <p>Algumas Tags Básicas que podem ser utilizadas na análise:</p>
                                                <p> < h1 > Título < /h1 >
                                                < h2 > Título < /h2 >
                                                < h3 > Título < /h3 > </p>
                                                <p> < p > Parágrafo < /p >
                                                < b > Negrito < /b >
                                                < i > Negrito < /i > </p>
                                                <p> < u > Sublinhado < /u > </p>
                                                <p>Para utilizar, retire os espaços entre os <> e coloque o texto no lugar do tipo de Tag.</p>
                                                <p>Usuário *: <input readonly value="${username}" name="nome" type="text"/></p>
                                                <p>Data da Postagem: <input readonly value="${post.data}" name="data" type="text" size="30"/></p>
                                                <p>Horário da Postagem: <input readonly value="${post.hora}" name="horario" type="text" size="30"/></p>
                                                <p>
                                                    <input type="submit" name="opcao" value="Alterar Postagem"/>
                                                </p>
                                            <p>*Campos Obrigatórios</p>
                                            <p>Importante! Recomendado não colocar expressões maiores que 80 caracteres sem espaço.</p> 
                                         </form>
                                    </c:forEach>
                                </c:if>
                        </div>           
                    </c:when>    
                    <c:when test="${sessionScope.username == null}" >
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
                        <div id="contents">
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
                </c:choose>
            <div id="footer">
                    <h1>
                        Copyright © 2015 Análises Online | ALISSON TS
                    </h1>
            </div>
        </div>    
    </body>
</html>
