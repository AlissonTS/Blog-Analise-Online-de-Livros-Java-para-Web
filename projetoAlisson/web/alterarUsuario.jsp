<%-- 
    Document   : alterarUsuario
    Created on : 27/09/2015, 10:20:41
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Logar"%>
<%@page import="modelo.LogarService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuário - Projeto</title>
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
                                        function validar2(cadastro)
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
                                // ]]>
                        </script>
                    <c:choose>
                        <c:when test="${sessionScope.username == null}" >
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
                        <c:when test="${sessionScope.username != null}" >
                            <div id="contents">
                                <h2>Usuário ${username}.</h2>
                                    <form method="post" action="Servletcontroller"><p>Voltar para Página Principal:
                                        <input value="Pagina do Usuario" name="opcao" type="submit"/></p>
                                    </form>
                            </div>
                            <div id="contents">        
                                <jsp:useBean id="logarService" class="modelo.LogarService"/>
                                <c:set value="${logarService.getUsuario(username)}" var="t"/>
                                <c:if test="${t!=null}">
                                    <c:forEach var="user" items="${t}">
                                        <h1>Alterar Conta:</h1>
                                        <h2>Formulário de Cadastro:</h2>
                                        <form id="cadastro" name="cadastro" method="post" action="Servletcontroller" onSubmit="return validar2(this)">
                                            <p>Usuário (Não Pode ser Modificado): <input readonly value="${user.usuario}" name="nome" type="text" size="50" maxlength="30"/></p>
                                            <p>*Email: <input value="${user.emailUsuario}" name="email" type="text" size="50" maxlength="50"/></p>
                                            <p>*Senha: <input value="${user.senha}" name="senha" type="password" size="35" maxlength="30"/></p>
                                            <p>Descrição: <input value="${user.informacao}" name="informacao" type="text" size="100" maxlength="80"/></p>
                                            <p>Idade: <input value="${user.idade}" name="idade" type="text" size="100" maxlength="3"/></p>
                                            <p>Nacionalidade: <input value="${user.nacionalidade}" name="nacionalidade" type="text" size="50" maxlength="30"/></p>
                                            <p>Ocupação/Escolaridade: <input value="${user.ocupacao}" name="ocupacao" type="text" size="50" maxlength="50"/></p>
                                            <p style="display: none;"><input readonly value="${user.dataC}" name="data" type="text" size="30"/></p>
                                            <p style="display: none;"><input readonly value="${user.horaC}" name="horario" type="text" size="30"/></p>
                                            <p style="display: none;"><input readonly value="${user.estadoC}" name="estado" type="text" size="100" /></p>
                                            <p>
                                                    <input type="submit" name="opcao" value="Alterar Usuario"/>
                                            </p>
                                            <p>* Campos Obrigatórios</p>
                                        </form> 
                                    </c:forEach>
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
