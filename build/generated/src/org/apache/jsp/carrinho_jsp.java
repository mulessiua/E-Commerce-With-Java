package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import produto.Produto;
import java.util.List;
import java.util.ArrayList;
import carrinho.Carrinho;
import carrinho.CarrinhoItem;

public final class carrinho_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

String nome = new String();
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/include/header.jsp");
  }

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>EMoz</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#CCCCCC\">\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("<table width=\"80%\" height=\"200\" border=\"0\" align=\"center\" bgcolor=\"#009966\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"228\">&nbsp;</td>\r\n");
      out.write("    <td width=\"597\"><h4 name=\"ItensDoCariho\"> <font color=\"#FFFFFF\">[x Items] </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"carinho.html\"><font color=\"#FFFFFF\">[Ver Carrinho]</font></a><font color=\"#FFFFFF\"></font></font>\r\n");
      out.write("            <font color=\"#FFFFFF\">&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t<a href=\"ccheckout.html\"><font color=\"#FFFFFF\">[Avancar para o checkout]</font></a></h4></td>\r\n");
      out.write("    <td width=\"235\"><h4 align=\"right\" name=\"lingua\"> <font color=\"#FFFFFF\">Portugues</font> </h4></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td> <a href=\"index.jsp\"><img src=\"img/categoria/logo.jpg\" alt=\"pagina inicial\" width=\"202\" height=\"142\" border=\"0\" />\t</td>\r\n");
      out.write("\r\n");
      out.write("    <form name=\"form1\" action=\"procura\">\r\n");
      out.write("    <td><h1 align=\"center\"><font color=\"#FFFFFF\" size=\"+7\" aling=\"center\">Venda online de material informático</font><font size=\"+7\" aling=\"center\"><br>\r\n");
      out.write("\r\n");
      out.write("            </font></h1></td>\r\n");
      out.write("    </form>\r\n");
      out.write("    <td>\r\n");
      out.write("\r\n");
      out.write("\t<table width=\"200\" border=\"0\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td><font color=\"#FFFFFF\">E-mail:</font></td>\r\n");
      out.write("        <td><input type=\"text\" name=\"login\" /></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td><font color=\"#FFFFFF\">Password:</font></td>\r\n");
      out.write("        <td><input name=\"password\" type=\"password\" maxlength=\"20\" /></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("        <td><form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\r\n");
      out.write("          <label>\r\n");
      out.write("            <input type=\"submit\" name=\"Submit\" value=\"Entrar\" />\r\n");
      out.write("            </label>\r\n");
      out.write("        </form>        </td>\r\n");
      out.write("        <td><a href=\"cadastro.jsp\"><font color=\"#FFFFFF\">Registra-se</font></a></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("\t</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"80%\" border=\"0\" align=\"center\" bgcolor=\"#FF6600\">\r\n");
      out.write("    <tr>\r\n");
      out.write("\t <td width=\"265\"><div align=\"center\">\r\n");
      out.write("       <a href=\"listarComputadores\"><font color=\"#00FFFF\">Computadores</font></a>\r\n");
      out.write("      </div></td>\r\n");
      out.write("\r\n");
      out.write("\t  <td width=\"239\"><div align=\"center\">\r\n");
      out.write("\t  <a href=\"listarFlashes\"><font color=\"#00FFFF\">Flash's</font></a>\r\n");
      out.write("      </div></td>\r\n");
      out.write("\r\n");
      out.write("\t  <td width=\"269\"><div align=\"center\">\r\n");
      out.write("\t  <a href=\"listarImpressoras\"><font color=\"#00FFFF\">Impressoras</font></a>\r\n");
      out.write("      </div></td>\r\n");
      out.write("\r\n");
      out.write("\t  <td width=\"270\"><div align=\"center\">\r\n");
      out.write("\t  <a href=\"listarOutrosAcessorios\"><font color=\"#00FFFF\">Outros Acessorios</font></a>\r\n");
      out.write("      </div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<br>\r\n");
      out.write("<table width=\"406\" border=\"0\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td width=\"152\">&nbsp;</td>\r\n");
      out.write("\r\n");
      out.write("<td width=\"244\">\r\n");
      out.write("    <form name=\"procuraPorNome\" method=\"get\" action=\"listaPorNome\">\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");
 if (request.getParameter("nome") != null)  {
            nome = request.getParameter("nome");
            }
                
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <input type=\"text\" name=\"nome\" value=\"");
      out.print(nome);
      out.write("\"/>\r\n");
      out.write("<input type=\"submit\" name=\"pNome\" value=\"Procurar\" />\r\n");
      out.write("\r\n");
      out.write("</form></td>\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("<br>\r\n");
      out.write("<table  width=\"304\" border=\"0\" align=\"left\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"152\">&nbsp;</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("\t\t<td height=\"49\">&nbsp;</td>\r\n");
      out.write("          <td width=\"142\"><a href=\"index.jsp\"><font color=\"#FFFFFF\"><font color=\"#009966\">Pagina Inicial</font></a></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("\t\t<td height=\"49\">&nbsp;</td>\r\n");
      out.write("          <td><a href=\"faleConosco.jsp\"><font color=\"#FFFFFF\"><font color=\"#009966\">Fale conosco</font></a></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("\t\t<td height=\"48\">&nbsp;</td>\r\n");
      out.write("          <td><a href=\"contacto.jsp\"><font color=\"#FFFFFF\"><font color=\"#009966\">Contacto</font></a></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("\t\t<td height=\"48\">&nbsp;</td>\r\n");
      out.write("           <td><a href=\"empresa.html\"><font color=\"#FFFFFF\"><font color=\"#009966\">Sobre a empresa</font> </a></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("\n");
      out.write("   ");

HttpSession ht = request.getSession(true);
Carrinho c = (Carrinho) ht.getAttribute("carrinho");
if ((c == null) || (c.getNumeroItems() == 0)) {
    out.println("Carrinho Vazio");
}
else {

      out.write("\n");
      out.write("<table>\n");
      out.write("    \n");
      out.write("</table>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
