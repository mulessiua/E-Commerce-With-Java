<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.Produto,java.util.List,java.util.ArrayList"%>
<%@page import="carrinho.Carrinho" %>

<%
String numItemCarr = new String();
HttpSession htm = request.getSession(true);
Carrinho cm = (Carrinho) htm.getAttribute("carrinho");
if ((cm != null) && (cm.getNumeroItems() > 0)) {
    numItemCarr = "("+cm.getNumeroItems()+")";
}
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>EMoz</title>
   <link rel="stylesheet" href="style.css">

    <style type="text/css">
<!--
.style7 {font-size: x-large}
.style8 {color: #666666}
.style10 {color: #666666; font-size: medium; }
.style20 {color: #FF0000; font-size: small; }
.style15 {color: green; font-size:  x-large;}
-->
    </style>
</head>

<body>


	<div id="header-wrap">
		<header class="group">
		<table width="200" border="0" align="right">
	  <tr>
        <td>
		<%
            if(htm.getAttribute("email")==null){
                out.println("<a href=login.jsp class=style8>Login</a> &nbsp;");
                out.println("<a href=cadastro.jsp class=style8>Registra-se</a>");
                }else{
                out.println("<a href=logout class=style8>Logout</a> &nbsp;");
                }
            %>

		</td>
      </tr>
    </table>
	<a href="carrinho.jsp" class="green"><strong>[Ver Carrinho]</strong></a>
        <%
        String se = "";
        String bem = "";
        if(htm.getAttribute("email")==null){

            }else{
        bem = "Bem vindo: ";
        se  = (String) htm.getAttribute("email");
        }
            String we ="";

            if((cm!=null)&&(cm.getNumeroItems()==1)){we="Item";}
            if((cm!=null)&&(cm.getNumeroItems()>=2)){we="Itens";}

        %>


			<p align="center"><span class="style10"> <%=bem%></span> <a href=editarCadastro?email=<%=se%>><strong class="green"><%=se%></strong></a></p>

			<h2><a href="index.jsp" title="EMoz">Emoz</a></h2>
			<div id="call">
				<h3 name="ItensDoCariho"> <%=numItemCarr%> <span class="style8"><%=we%></span></h3>
			</div><!-- end call -->
			<nav class="group">
				<ul>
					<li class="home"><a href="index.jsp" title="P&aacute;gina Inicial">P&aacute;gina Inicial</a></li>
					<li><a href="maComputadores.jsp" title="Computadores">Computadores</a></li>
					<li><a href="listarFlashes" title="Flash's">Flash's</a></li>
					<li><a href="listarImpressoras" title="Impressoras">Impressoras</a></li>
					<li><a href="listarOutrosAcessorios" title="Outros Acessorios">Outros Acessorios</a></li>
					<li class="last">
						<div>							
							<form name="procuraPorNome" method="get" action="listaPorNome">
        <%!String nome = new String();%>
        <% if (request.getParameter("nome") != null)  {
            nome = request.getParameter("nome");
            }
                %>

        <input type="text" name="nome" value="<%=nome%>"/>
<input type="submit" name="pNome" value="Procurar" />

</form>
						</div>
					</li>
				</ul>
			</nav>
			<br>

   <%
if(htm.getAttribute("tipo")!=null){
    out.println("<p align=center class=style15>Administrador </p>");
	   out.println("<br>");

out.println("<header class=group>");
	   out.println("<nav class=group>");
				out.println("<ul>");
					out.println("<li class=home><a href=admin.jsp title=Administrador>Administrador</a></li>");


                                        String a1= "";
                                        String a2= "";
                                        String a3= "";
					String a4= "";
                                        String a5= "";

                                            a1= "<a href=listarCadastros title=Ver usuarios class=group style9>Ver usuarios</a>";
                                            a2= "<a href=listarProdutos title=Ver produtos class=group style9>Ver produtos</a>";
                                            a3= "<a href=editarProdutos title=Editar produtos class=group style9>Editar produtos</a>";
                                            a4= "<a href=criarProdutos.jsp title=Criar produtos class=group style9>Criar produtos</a>";
                                            a5= "<a href=apagarProdutos title=Apagar produtos class=group style9>Apagar produtos</a>";

					out.println("<li>"+a1+"</li>");
					out.println("<li>"+a2+"</li>");
	   				out.println("<li>"+a3+"</li>");
					out.println("<li>"+a4+"</li>");
                                        out.println("<li>"+a5+"</li>");

				out.println("</ul>");
out.println("</nav>");

out.println("</header>");
out.println("<br>");}
 %>

<% String error = (String) request.getAttribute("error");
            if ((error !=null) && (error.length()>0)){
                out.println(error);
            }
        %>

        <%!String nomer = new String();%>
        <% if (request.getParameter("nomec") != null)  {
            nomer = request.getParameter("nomec");
            }
                %>
                <%!String apelidor = new String();%>
        <% if (request.getParameter("apelido") != null)  {
            apelidor = request.getParameter("apelido");
            }
                %>
                <%!String passwordr = new String();%>
                <%!String rep_passwordr = new String();%>
        <% if (request.getParameter("password") != null || request.getParameter("rep_password") != null)  {
            passwordr = request.getParameter("passwordr");
            rep_passwordr = request.getParameter("rep_password");
            }
                %>
                <%!String emailr = new String();%>
        <% if (request.getParameter("email") != null)  {
            emailr = request.getParameter("email");
            }
                %>
                <%!String paisr = new String();%>
        <% if (request.getParameter("pais") != null)  {
            paisr = request.getParameter("pais");
            }
                %>
                <%!String enderecor = new String();%>
        <% if (request.getParameter("endereco") != null)  {
            enderecor = request.getParameter("endereco");
            }
                %>
                <%!String telefoner = new String();%>
        <% if (request.getParameter("telefone") != null)  {
            telefoner = request.getParameter("telefone");
            }
                %>

                <%
                        String codigo1 = request.getParameter("codigo1");
                        //out.println(codigo1);
                        %>

<table width="97%" border="0" align="center">
<form name="Form1" method="post" action="sCadastro">
    <input type="hidden" name="codigo1" value="<%=codigo1%>">
  <tr>
    <td width="37%"><div align="right">Nome:</div></td>
    <td width="63%"><input type="name" name="nomec" value="<%=nomer%>" required="true" autofocus min="2"/>
      <span class="style20">Mais de 2 car&aacute;cteres(eg. Carlos) </span></td>
  </tr>
  <tr>
    <td><div align="right">Apelido:</div></td>
    <td><input type="text" name="apelido" value="<%=apelidor%>" required="true" autofocus min="2"/>
      <span class="style20">Mais de 2 car&aacute;cteres(eg. Silva)</span></td>
  </tr>
   <tr>
    <td><div align="right">Password:</div></td>
    <td><input name="password" type="password" maxlength="20" value="" required="true" autofocus max="20" min="10"/>
      <span class="style20">Mais de 10 e Menos de 20 car&aacute;cteres(As senhas devem ser iguais)</span></td>
  </tr>
   <tr>
    <td><div align="right">Confirmar o Password: </div></td>
	<td><input name="rep_password" type="password" maxlength="20" value="" required="true" autofocus max="20" min="10"/>
	  <span class="style20">Mais de 10 e Menos de 20 car&aacute;cteres(As senhas devem ser iguais)</span></td>
  </tr>
  <tr>
    <td><div align="right">E-mail:</div></td>
    <td><input type="email" name="email" value="<%=emailr%>" required="true" autofocus min="3"/>
      <span class="style20">Mais de 3 car&aacute;cteres(eg. mulessiua@gmail.com)</span></td>
  </tr>
  <tr>
    <td><div align="right">Pais:</div></td>
    <td><select name="pais" value="<%=paisr%>" >
	<option value="Mocambique">Mocambique</option>
	<option value="Africa do Sul">Africa do Sul</option>
	</select>
	</td>
  </tr>
  <tr>
    <td><div align="right">Endere&ccedil;o:</div></td>
    <td><input type="text" name="endereco" value="<%=enderecor%>" required="true" autofocus min="3"/>
      <span class="style20">Mais de 3 car&aacute;cteres(eg. AV. 25 de Setembro, 468</span>)</td>
  </tr>
  <tr>
    <td><div align="right">Telefone:</div></td>
    <td><input type="number" name="telefone" value="<%=telefoner%>" required="true" autofocus min="3"/>
      <span class="style20">Mais de 3 car&aacute;cteres(eg. +258 824249651)</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
	<td><input name="Submit" type="submit" onClick="return validar()" value="Enviar" /></td>
  </tr>
  </form>
</table>
</header>
	</div>

    <p><br />

    <div id="client-wrap">

<%
String admin="";
            if(htm.getAttribute("email")==null){
                admin="| <a href=loginAdmin.jsp class=style8 title=Administrador>Administrador</a>";
                }else{
                admin="";
                }
            %>
			<hr align="center" width=50% size=7>
<h3 align="center" class="style8"> &copy; 2014 E-Moz | Contacte-nos <%=admin%></h3>
</div>
</body>
</html>