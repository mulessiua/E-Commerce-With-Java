<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.Cadastro, produto.Produto,java.util.List,java.util.ArrayList"%>
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
.style8 {color: #666666}
.style10 {font-size: x-large}
.style18 {font-size: 12px}
.style21 { font-size: small; color: #666666;}
.style20 {color: #FF0000; font-size: medium; }
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
            %>		</td>
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
HttpSession ht = request.getSession(true);
Carrinho c = (Carrinho) ht.getAttribute("carrinho");
%>

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


<p align="center" class="green style10">Confirmar os dados</p>
<p align="center" class="green style10">&nbsp;</p>
<table bgcolor="#FFFFFF" align="center" width="965">
    <tr>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF >&nbsp;</td>
        <td width="186" bgcolor=#FFFFFF ><h2><span class="style8"><p align=center>Quantidade</p></span></h2></td>
        <td width="197"><h2><span class="style8"><p align=center>Subtotal</p></span></h2></p></td>
    </tr>
<%

    String nomec = request.getParameter("nomer");
    String apelido = request.getParameter("apelido");
    String pais = request.getParameter("pais");
    String provincia = request.getParameter("provincia");
    String provincia1 = request.getParameter("provincia1");
    String endereco = request.getParameter("endereco");
    String telefone = request.getParameter("telefone");

    //out.println(provincia);
    //out.println(provincia1);

    if(pais.equalsIgnoreCase("")){

    }

    String resut = "";
    double precoLocal = 0;

    if(pais.equalsIgnoreCase("Mocambique")){
        precoLocal=200;
        resut = provincia;
               }
    if(pais.equalsIgnoreCase("Africa do Sul")){
        precoLocal=400;
        resut = provincia1;
               }
    
//out.println(resut);

    Produto p;
    for(CarrinhoItem cItem: c.getItems()){
        p = cItem.getProduto();
        out.println("<tr>");
        out.println("<td><img src=img/categoria/computador/"+p.getImagen()+" width=157 height=80></td>");
        out.println("<td bgcolor=#FFFFFF><p align=center>"+p.getNome()+"</p></td>");
        out.println("<td bgcolor=#FFFFFF><p align=center>"+p.getDescricao()+" MZN</p></td>");
        out.println("<td bgcolor=#FFFFFF><p align=center>"+cItem.getQuantidade()+"</p></td>");
        out.println("<td bgcolor=#FFFFFF><p align=center>"+(p.getPreco()*cItem.getQuantidade())+" MZN</p></td>");
        out.println("<td width=100 bgcolor=#FFFFFF>&nbsp;</td>");
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
    out.println("<td colspan=\"3\"><p><h4 align=right class=green>Subtotal:</h4></p></td><td>&nbsp</td><td><h1><b><p align=center>"+c.getTotale()+" MZN</p></b></h1></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td colspan=\"3\"><p><h4 align=right class=green>Transporte:</h4></p></td><td>&nbsp</td><td><h1><b><p align=center>"+precoLocal+" MZN</p></b></h1></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td colspan=\"3\"><p><h4 align=right class=green>Total:</h4></p></td><td>&nbsp</td><td><h1><b><p align=center>"+(c.getTotale()+precoLocal)+" MZN</p></b></h1></td>");
    out.println("</tr>");
    %>
</table>

<hr align="center" width=100% size=7 noshade>
<p align="center">&nbsp;</p>
<p align="center"><span class="green style10">Enviar para </span></p>
<p align="center">&nbsp;</p>
<table width="745" border="1" align="center" id="widget" name="widget">
  <tr>
    <td width="310">&nbsp;</td>
      <td width="122"><h4 class="green style18">Nome:</h4></td>
    <td width="291"><%=nomec%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
      <td> <h4 class="green style18">Apelido:</h4></td>
    <td><%=apelido%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
      <td> <h4 class="green style18">Pais:</h4></td>
    <td><%=pais%>, <%=resut%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
      <td> <h4 class="green style18">Endere&ccedil;o:</h4></td>
    <td><%=endereco%></td>
  </tr>
  <tr>
    <td height="40">&nbsp;</td>
      <td> <h4 class="green style18">Telefone:</h4></td>
    <td><%=telefone%></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
  <td>
	<form name="form1" method="post" action="carrinho.jsp">
	  <span class="style8">
      <input name="submit" type="submit" value="Cancelar">
      </span>
	</form>
          <span class="style21">&nbsp;</span></td>
        <td><a href="#"><img src="img/categoria/computador/paypal.jpg" width="200" height="50"></a></td>
      </tr>
</table>

	  <table width="200" border="1" align="right" id="widget" name="widget">
        
      </table>
	  <p>&nbsp;</p>
	  </header>
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

