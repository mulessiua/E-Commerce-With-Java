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
.style11 {color: #FF0000; font-size: medium; }
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
        
                        <%!String email = new String();%>
        <% if (request.getParameter("email") != null)  {
            email = request.getParameter("email");
            }
                %>
				<%
                        //String codigo1 = request.getParameter("codigo1");
                      //out.println(codigo1);
                        %>
				<p align="center" class="green style7">Usuario </p>
		        <p align="center" class="green style11">&nbsp;</p>


		<table width="249" border="0" align="center" id="media">
		<form name="cLogin" method="post" action="cLogin">
                    <input type="hidden" name="codigo1" value="">
		<tr>
		<td width="68">
		E-mail:		</td>
		<td width="171">
		<input type="email" name="email" placeholder="eu@exemplo.com" required="true" autofocus>
				</td>
		</tr>
		<tr>
		<td height="22">
		Password:		</td>
		<td>
		<input type="password" name="password" required="true" autofocus>		</td>
          </tr>
		<tr>
		  <td height="20"></td>
		  <td><a href="rEmail.jsp" class="style10">Recuperar o Password</a></td>
		  </tr>
		<tr>
		<td>		</td>
		<td>
		<input type="submit" value="Entrar">		</td>
		</tr>
		</form>
		</table>
</header>
	</div>

    <p><br />
       </p>
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
