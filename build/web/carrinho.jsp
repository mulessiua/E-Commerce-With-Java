<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.Produto,java.util.List,java.util.ArrayList"%>
<%@page import="carrinho.Carrinho,carrinho.CarrinhoItem" %>

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

<style type="text/css">
<!--
.style5 {
	font-size: 50px;
	font-weight: bold;
	color: #009966;
}
-->
</style>

  <h3 align="center"class="green">Seu Carrinho</h3>

  <%
HttpSession ht = request.getSession(true);
Carrinho c = (Carrinho) ht.getAttribute("carrinho");
if ((c == null) || (c.getNumeroItems() == 0)) {
    out.println("<h3 align=center >Carrinho Vazio</h3>");

}
else {
%>
<table bgcolor="#FFFFFF" align="center" width="965">
    <tr>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF ><h2 align="center"><span class="style8">Quantidade</span></h2></td>
        <td width="197"><h2 align="center"><span class="style8">Subtotal</span></h2></td>
    </tr>
<%
    Produto p;
    for(CarrinhoItem cItem: c.getItems()){
        p = cItem.getProduto();
        out.println("<tr>");
        out.println("<td><img src=img/categoria/computador/"+p.getImagen()+" width=157 height=80></td>");
        out.println("<td bgcolor=#FFFFFF>"+p.getNome()+"</td>");
        out.println("<td bgcolor=#FFFFFF> <p align=center>"+p.getDescricao()+"</p></td>");
        out.println("<td bgcolor=#FFFFFF> <p align=center>"+cItem.getQuantidade()+"</p></td>");
        out.println("<td bgcolor=#FFFFFF> <p align=center>"+(p.getPreco()*cItem.getQuantidade())+" MZN</p></td>");
        out.println("<td width=100 bgcolor=#FFFFFF><a title=\"Remover Produto\" "
                + "href=\"removeItemCarrinho?codigo="+p.getProdutoId()+"\">"
                + "<img src=\"img/categoria/computador/trash.png\"></a></td>");
        out.println("</tr>");
    }


		out.println("<tr>");
		out.println("<td> &nbsp;");
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td> &nbsp;");
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
    	out.println("<td>&nbsp;</td>");
    	out.println("<td>&nbsp;</td>");
    	out.println("<td>&nbsp;</td>");
  		out.println("</tr>");

    out.println("<tr>");
    out.println("<td colspan=\"3\"><p><h3 align=right class=green>Total:</h3></p></td><td>&nbsp</td><td><h1><b><p align=center>"+c.getTotale()+" MZN</p></b></h1></td>");
    out.println("</tr>");
    }
%>
</table>

<br>

<%


if ((c == null) || (c.getNumeroItems() == 0)) {
}else{
    out.println("<p align=right><a href=checkout?codigo1=checkout class=style17 >Comprar <img src=img/categoria/computador/comprar1.jpg width=40 title=Comprar></a></p>");
    }
%>
</div>

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
