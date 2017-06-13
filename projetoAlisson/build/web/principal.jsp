<%-- 
    Document   : principal
    Created on : 19/09/2015, 10:14:49
    Author     : Alisson
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Página do Usuário - Projeto</title>
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
                                function validar2(){
                                        filtrar.nome.value;
                                        filtrar.nome.value = "${username}"; 
                                        return;
                                }
                        // ]]>
                    </script>    
                <c:choose>
                    <c:when test="${sessionScope.username == null}" >
                        <h1>Usuário não Logado... </h1>
                            <form id="logar" method="post" action="Servletcontroller" onSubmit="return validar(this)">
                                <p>Login:</p>
                                <p>Usuário: </p><p><input id="login" name="login" type="text" size="30" maxlength="30"/></p>
                                <p>Senha:</p>
                                <p><input id="senha" name="senha" type="password" size="30" maxlength="30"/></p>
                                <p><input value="Logar" name="opcao" type="submit"/><input type="reset" value="Reset"/></p>
                            </form>
                    </c:when>
                    <c:when test="${sessionScope.username != null}" >
                        <jsp:useBean id="logarService" class="modelo.LogarService"/>
                        <c:set value="${logarService.getUsuario(username)}" var="t"/>                        
                        <h1>Bem-vindo à Página do Usuário - ${username}.</h1>
                        <table style="margin-bottom: 2%" width=950>
                            <tr>
                                <th COLSPAN="2"><h1 style="text-align: center">${username}</h1></th>
                            </tr>
                            <tr>
                                <th width=550><h2 style="text-align: center">Informações do Usuário</h2></th>
                                <th><h2 style="text-align: center">Funcionalidades</h2></th>
                            </tr>
                            <tr>
                                <td rowspan="6">
                                    <c:if test="${t!=null}">
                                        <c:forEach var="user" items="${t}">
                                                    <p>Nome: ${user.usuario}</p>
                                                    <p>Email: ${user.emailUsuario}</p>
                                                    <p>Informações: ${user.informacao}</p>
                                                    <p>Nacionalidade: ${user.nacionalidade}</p>
                                                    <p>Ocupação: ${user.ocupacao}</p>
                                                    <p>Idade: ${user.idade}</p>
                                                    <p>Data da Criação da Conta: ${user.dataC}</p>
                                                    <p>Horário da Criação da Conta: ${user.horaC}</p>
                                                    <p>Data da Última Atualização da Conta: ${user.dataM}</p>
                                                    <p>Horário da Última Atualização da Conta: ${user.horaM}</p>
                                        </c:forEach>
                                    </c:if>   
                                </td>
                                <td>
                                    <form method="post" action="Servletcontroller" name="Opções"><p>Fazer Postagem: 
                                            <input value="Fazer uma Postagem" name="opcao" type="submit"/></p>
                                    </form>
                                </td> 
                            </tr>
                            <tr>
                                <td>
                                    <form id="filtrar" method="post" action="Servletcontroller"><p>Listar Postagens:
                                       <input type="submit" name="opcao" value="Listar Postagens"/>
                                       </p></form>
                                </td>  
                            </tr>
                            <tr>
                                <td>
                                   <form id="alterar/excluir" method="post" action="Servletcontroller"><p>Alterar/Excluir Postagens: 
                                            <input type="submit" name="opcao" value="Alterar/Excluir Postagens"/></p>
                                   </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form id="alterarUsuario" method="post" action="Servletcontroller"><p>Alterar Conta: 
                                            <input type="submit" name="opcao" value="Alterar Conta"/></p>            
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form method="post" action="Servletcontroller"><p>Usuários seguidos por você:
                                            <input type="submit" name="opcao" value="Mostrar Usuarios"/></p>            
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form method="post" action="Servletcontroller"><p>Lista de Usuários Cadastrados:
                                            <input type="submit" name="opcao" value="Listar Usuarios"/></p>            
                                    </form>
                                </td>
                            </tr> 
                            <tr>
                                <td COLSPAN="2">
                                    <form method="post" action="Servletcontroller"><p>Sair da Página do Usuário: 
                                        <input type="submit" name="opcao" value="Logout"/></p></form>
                                </td>
                            </tr>
                        </table>
                    </c:when>
                </c:choose>         
            </div>
            <div id="footer">
                <h1>
                    Copyright © 2015 Análises Online | ALISSON TS
                </h1>
            </div>
        </div>    
    </body>
</html>
