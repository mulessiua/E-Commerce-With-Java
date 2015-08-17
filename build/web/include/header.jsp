
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
</head>
<body bgcolor="#CCCCCC">

<br>
<table width="80%" height="200" border="0" align="center" bgcolor="#009966">
  <tr>
    <td width="228">&nbsp;</td>
    <td width="597"><h4 name="ItensDoCariho"> <font color="#FFFFFF"><%=numItemCarr%> Itens </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="carrinho.jsp"><font color="#FFFFFF">[Ver Carrinho]</font></a><font color="#FFFFFF"></font></font>
            <font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;
	<a href="ccheckout.html"><font color="#FFFFFF">[Avancar para o checkout]</font></a></h4></td>
    <td width="235"><h4 align="right" name="lingua"> <font color="#FFFFFF">Portugues</font> </h4></td>
  </tr>
  <tr>
    <td> <a href="index.jsp"><img src="img/categoria/logo.jpg" alt="pagina inicial" width="202" height="142" border="0" />	</td>

    <form name="form1" action="procura">
    <td><h1 align="center"><font color="#FFFFFF" size="+7" aling="center">Venda online de material informático</font><font size="+7" aling="center"><br>

            </font></h1></td>
    </form>
    <td>

	<table width="200" border="0">
      <tr>
        <td><font color="#FFFFFF">E-mail:</font></td>
        <td><input type="text" name="login" /></td>
      </tr>
      <tr>
        <td><font color="#FFFFFF">Password:</font></td>
        <td><input name="password" type="password" maxlength="20" /></td>
      </tr>
	  <tr>
        <td><form id="form1" name="form1" method="post" action="">
          <label>
            <input type="submit" name="Submit" value="Entrar" />
            </label>
        </form>        </td>
        <td><a href="cadastro.jsp"><font color="#FFFFFF">Registra-se</font></a></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
<table width="80%" border="0" align="center" bgcolor="#FF6600">
    <tr>
	 <td width="265"><div align="center">
       <a href="listarComputadores"><font color="#00FFFF">Computadores</font></a>
      </div></td>

	  <td width="239"><div align="center">
	  <a href="listarFlashes"><font color="#00FFFF">Flash's</font></a>
      </div></td>

	  <td width="269"><div align="center">
	  <a href="listarImpressoras"><font color="#00FFFF">Impressoras</font></a>
      </div></td>

	  <td width="270"><div align="center">
	  <a href="listarOutrosAcessorios"><font color="#00FFFF">Outros Acessorios</font></a>
      </div></td>
    </tr>
</table>
<br>
<table width="406" border="0">
<tr>
<td width="152">&nbsp;</td>

<td width="244">
    <form name="procuraPorNome" method="get" action="listaPorNome">
        <%!String nome = new String();%>
        <% if (request.getParameter("nome") != null)  {
            nome = request.getParameter("nome");
            }
                %>

        <input type="text" name="nome" value="<%=nome%>"/>
<input type="submit" name="pNome" value="Procurar" />

</form></td>
</tr>

</table>
<br>
<table  width="304" border="0" align="left">
        <tr>
          <td width="152">&nbsp;</td>
        </tr>
        <tr>
		<td height="49">&nbsp;</td>
          <td width="142"><a href="index.jsp"><font color="#FFFFFF"><font color="#009966">Pagina Inicial</font></a></td>
        </tr>
        <tr>
		<td height="49">&nbsp;</td>
          <td><a href="faleConosco.jsp"><font color="#FFFFFF"><font color="#009966">Fale conosco</font></a></td>
        </tr>
        <tr>
		<td height="48">&nbsp;</td>
          <td><a href="contacto.jsp"><font color="#FFFFFF"><font color="#009966">Contacto</font></a></td>
        </tr>
        <tr>
		<td height="48">&nbsp;</td>
           <td><a href="empresa.html"><font color="#FFFFFF"><font color="#009966">Sobre a empresa</font> </a></td>
        </tr>

</table>
