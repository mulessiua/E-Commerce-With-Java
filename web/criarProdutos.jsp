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
.style11 {color: #FF0000}
.style20 {color: #FF0000; font-size: medium; }
.style15 {color: green; font-size:  x-large;}
-->
    </style>

    <script>
function validateForm()
{
	if(document.criarProduto.nomea.value.length<=2)
    {
      alert("O Nome deve ter mais de 2 caracteres");
      document.criarProduto.nomea.focus();
      return false;
    }
	if(document.criarProduto.descricao.value.length<=2)
    {
      alert("A Descricao deve ter mais de 2 caracteres");
      document.criarProduto.descricao.focus();
      return false;
    }
	numbers = /^[0-9]+$/;
	/*if(document.criarProduto.preco.value.match(numbers))
    {
      
	}else{
	alert("O Preco deve conter apenas numeros");
      document.criarProduto.preco.focus();
      return false;
	}*/
	if(document.criarProduto.preco.value.length<=2)
    {
      alert("O Preco deve ter mais de 2 caracteres");
      document.criarProduto.preco.focus();
      return false;
    }
	if(document.criarProduto.disponivel.value.length<1)
    {
      alert("A disponibilidade deve ter mais de 1 caracter");
      document.criarProduto.disponivel.focus();
      return false;
    }
	if(document.criarProduto.vendido.value.length<1)
    {
      alert("A venda deve ter mais de 1 caracter");
      document.criarProduto.vendido.focus();
      return false;
    }
	if(document.criarProduto.imagen.value.length<=2)
    {
      alert("A imagen deve ter mais de 2 caracteres");
      document.criarProduto.imagen.focus();
      return false;
    }
   return true;
}
</script>
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





						<form name="criarProduto" method="get" action="criarProdutos" >
 	                    <table width="966" border="1" align="center" id="media">
                          <tr>
                            <td width="57">Categoria</td>
                            <td width="893"><select name="categoria">
							<option selected value="Computador">Computador</option>
							<option value="Impressora">Impressora</option>
							<option value="Flash">Flash</option>
							<option value="Pasta">Pasta</option>
							<option value="Bateria">Bateria</option>
							<option value="Rato">Rato</option>
							<option value="Teclado">Teclado</option>
							</select></td>
                          </tr>
                          <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nomea" value="">
                            <span class="style11">Mais de 2 car&aacute;cteres(eg. HP DV7)</span></td>
                          </tr>
                          <tr>
                            <td>Descri&ccedil;&atilde;o</td>
                            <td><input type="text" name="descricao" value="">
                            <span class="style11">Mais de 2 car&aacute;cteres(eg. Corei5, 3.00GHZ, 4GB, 500GB, Win7)</span></td>
                          </tr>
                          <tr>
                            <td>Pre&ccedil;o</td>
                            <td><input type="text" name="preco" value="">
                            <span class="style11">Mais de 2 car&aacute;cteres(eg. 15000)</span></td>
                          </tr>
                          <tr>
                            <td>Disponiveis</td>
                            <td><input type="text" name="disponivel" value="">
                            <span class="style11">Mais de 1 car&aacute;cteres(eg. 10)</span></td>
                          </tr>
                          <tr>
                            <td>Vendidos</td>
                            <td><input type="text" name="vendido" value="">
                            <span class="style11">Mais de 1 car&aacute;cteres(eg. 20)</span></td>
                          </tr>
                          <tr>
                            <td>Imagen</td>
                            <td><input type="text" name="imagen" value="">
                            <span class="style11">Mais de 2 car&aacute;cteres, NB: Nome da imagem e sua extens&atilde;o(eg. hp6.jpg) A imagen deve ser guardada no local "img/categoria/computador/"</span></td>
                          </tr>
						  <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" value="Criar" onClick="return validateForm()"></td>
                          </tr>
          </table>
		  </form>
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