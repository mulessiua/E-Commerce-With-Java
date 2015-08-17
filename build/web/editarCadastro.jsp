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

    <style type="text/css">
<!--
.style8 {color: #666666}
.style9 {color: #FFFFFF}
.style10 {font-size: x-large}
.style11 {font-size: x-large; color: #666666; }
.style20 {color: #FF0000; font-size: medium; }
.style15 {color: green; font-size:  x-large;}
-->
    </style>
	
	 <script>
function validateForm()
{
	if(document.edit.nomer.value.length<=2)
    {
      alert("O Nome deve ter mais de 2 caracteres");
      document.edit.nomer.focus();
      return false;
    }
	if(document.edit.apelido.value.length<=2)
    {
      alert("O Apelido deve ter mais de 2 caracteres");
      document.edit.apelido.focus();
      return false;
    }
	if(document.edit.password.value.length<10)
    {
      alert("O Password deve ter mais de 10 caracteres");
      document.edit.password.focus();
      return false;
    }
	if(document.edit.rep_password.value.length<10)
    {
      alert("Confirma o Password e deve ter mais de 10 caracteres");
      document.edit.rep_password.focus();
      return false;
    }
	if(document.edit.password.value!=document.edit.rep_password.value)
    {
      alert("As senhas nao correspondem");
      document.edit.password.focus();
      return false;
    }
	if(document.edit.endereco.value.length<=3)
    {
      alert("O Endereco deve ter mais de 3 caracteres");
      document.edit.endereco.focus();
      return false;
    }
	if(document.edit.telefone.value.length<=3)
    {
      alert("O Telefone deve ter mais de 2 caracteres");
      document.edit.telefone.focus();
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



      </header>
	

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

<div id="client">
    <form name="edit" method="post" action="atualizarCadastro">
    <table width="274" border="1" align="center" id="media">
	
    <%
            for(Cadastro c:cadastros){
                String re = "";
                String re1 = "";
                if(c.getPais().equalsIgnoreCase("Mocarbique")){re="selected='selected'";}
                if(c.getPais().equalsIgnoreCase("Africa do Sul")){re1="selected='selected'";}

        out.println("<input type=hidden name=codigoC value="+c.getRCadastroId()+">");
        out.println("<input type=hidden name=email value="+c.getEmail()+">");
        out.println("<tr>");
        out.println("<td width=101>Nome:</td>");
        out.println("<td><input type=text name=nomer value="+c.getNome()+"></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Apelido:</td>");
        out.println("<td><input type=text name=apelido value="+c.getApelido()+"></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Password:</td>");
        out.println("<td><input type=text name=password value="+c.getPassword()+"></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Repetir o Password:</td>");
        out.println("<td><input type=text name=rep_password value="+c.getRep_password()+"></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>E-mail:</td>");
        out.println("<td>"+c.getEmail()+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Pais:</td>");
        out.println("<td><select name=pais>");
        out.println("<option value='Mocambique' "+re+">Mocambique</option>");
        out.println("<option value='Africa do Sul' "+re1+">Africa do Sul</option>");
        out.println("</select>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Endere&ccedil;o:</td>");
        out.println("<td><input type=text name=endereco value='"+c.getEndereco()+"'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Telefone:</td>");
        out.println("<td><input type=text name=telefone value="+c.getTelefone()+"></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>&nbsp;</td>");
        %>
        <td><input type=submit value=Atualizar onClick="return validateForm()"></td>
        <%
        out.println("");
        out.println("</tr>");

}
            %>
			
</table>
            </form>
            </div></header>
</div>
        <p>&nbsp;</p>
  <p>&nbsp;</p>
</header>



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









