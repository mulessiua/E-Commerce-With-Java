<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.Cadastro,java.util.List,java.util.ArrayList"%>

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

<script>
function aparece(){
if(document.form1.pais.selectedIndex=="1"){
document.form1.provincia.style.visibility="visible";
document.form1.provincia1.style.visibility="hidden";
}
else {
document.form1.provincia1.style.visibility="visible";
document.form1.provincia.style.visibility="hidden";
} 
if(document.form1.pais.selectedIndex=="0"){
document.form1.provincia.style.visibility="hidden";
document.form1.provincia1.style.visibility="hidden";
}
}
</script>

<script>
function validateForm()
{
	if(document.form1.nomer.value.length<=2)
    {
      alert("O Nome deve ter mais de 2 caracteres");
      document.form1.nomer.focus();
      return false;
    }
	if(document.form1.apelido.value.length<=2)
    {
      alert("O Apelido deve ter mais de 2 caracteres");
      document.form1.apelido.focus();
      return false;
    }
	if(document.form1.pais.value=="Pais")
    {
      alert("Seleciona um Pais");
      document.form1.pais.focus();
      return false;
    }
	if(document.form1.endereco.value.length<=2)
    {
      alert("O Endereco deve ter mais de 2 caracteres");
      document.form1.endereco.focus();
      return false;
    }
	if(document.form1.telefone.value.length<=8)
    {
      alert("O Telefone deve ter mais de 8 caracteres");
      document.form1.telefone.focus();
      return false;
    }
   return true;
}
</script>


    <style type="text/css">
<!--
.style8 {color: #666666}
.style10 {font-size: x-large}
.style12 {color: #FF0000}
.style14 {color: #FF0000; font-size: 12px; }
.style15 {color: green; font-size:  x-large;}
.style20 {color: #FF0000; font-size: medium; }
.style21 {color: #FF0000; font-size: small; }
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
      

 <%!ArrayList<Cadastro> cadastros = new ArrayList<Cadastro>();%>
        <% cadastros = (ArrayList<Cadastro>) request.getAttribute("cadastros");%>



  <h3 align="center"class="green">Dados de Entrega: </h3>

   <table width="778" border="0" align="center">
  <form name="form1" method="post" action="confirmarCarrinho.jsp">
      <%
            for(Cadastro cx:cadastros){

                %>
    <tr>
      <td width="259">&nbsp;</td>
      <td width="74">Nome:</td>
      <td width="431">
          <input type="text" name="nomer" size="30" value="<%=cx.getNome()%>">
          <span class="style21">*<span class="style21">, Mais de 2 car&aacute;cteres (eg. Carlos)</span></span> </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Apelido:</td>
      <td><input type="text" name="apelido" size="30" value="<%=cx.getApelido()%>">
        <span class="style21">*<span class="style21">, Mais de 2 car&aacute;cteres (eg. Silva</span>) </span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Pais:</td>
      <td>
<select name="pais" onChange="aparece();">
<option selected value="Pais">Pais</option>
<option value="Mocambique">Mo&ccedil;ambique</option>
<option value="Africa do Sul">Africa do Sul</option>
</select>

<select name="provincia" style="visibility:hidden;">
<option value="Cabo Delgado">Cabo Delgado</option>
<option value="Nampula">Nampula</option>
<option value="Niassa">Niassa</option>
<option value="Zambezia">Zambezia</option>
<option value="Tete">Tete</option>
<option value="Sofala">Sofala</option>
<option value="Manica">Manica</option>
<option value="Inhambane">Inhambane</option>
<option value="Gza">Gaza</option>
<option value="Maputo">Maputo</option>

</select>

<select name="provincia1" style="visibility:hidden;">
<option value="Cape Town">Cape Town</option>
<option value="Pretoria">Pretoria</option>
<option value="Durban">Durban </option>
</select></td>

    </tr>
    <tr>
      <td height="41">&nbsp;</td>
      <td>Endere&ccedil;o:</td>
      <td><p>
        <input type="text" name="endereco" size="40" value="<%=cx.getEndereco()%>">
        <span class="style21">*</span></p>
        <p><span class="style21">(eg. Cabo Delgado, Pemba, AV. 25 de Setembro, 468)</span></p></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Telefone:</td>
      <td><input type="text" name="telefone" size="30" value="<%=cx.getTelefone()%>">
        <span class="style21">*<span class="style21">, Mais de 3 car&aacute;cteres (eg. 824249651) </span></span></td>
      <%}
            %>
    </tr>
	<tr>
	  <td>&nbsp;</td>
	  <td></td>
	  <td><input name="submit" type="submit" value="Continuar" onClick="return validateForm()"></td>
	  </tr>
	<tr>
	  <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><span class="style21">Todos os campos com *, s&atilde;o necess&aacute;rios! </span></td>
    </tr>
	</form>
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
