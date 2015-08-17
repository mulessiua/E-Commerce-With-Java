package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import produto.Produto;
import java.util.List;
import java.util.ArrayList;

public final class cPastas_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

String nome = new String();
ArrayList<Produto> produtos = new ArrayList<Produto>();
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
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("<title>EMoz</title>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body bgcolor=\"#CCCCCC\">\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<table width=\"80%\" height=\"200\" border=\"0\" align=\"center\" bgcolor=\"#009966\">\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"228\">&nbsp;</td>\n");
      out.write("    <td width=\"597\"><h4 name=\"ItensDoCariho\"> <font color=\"#FFFFFF\">[x Items] </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"carinho.html\"><font color=\"#FFFFFF\">[Ver Carrinho]</font></a><font color=\"#FFFFFF\"></font></font>\n");
      out.write("            <font color=\"#FFFFFF\">&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;\n");
      out.write("\t<a href=\"ccheckout.html\"><font color=\"#FFFFFF\">[Avancar para o checkout]</font></a></h4></td>\n");
      out.write("    <td width=\"235\"><h4 align=\"right\" name=\"lingua\"> <font color=\"#FFFFFF\">Portugues</font> </h4></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td> <a href=\"index.jsp\"><img src=\"img/categoria/logo.jpg\" alt=\"pagina inicial\" width=\"202\" height=\"142\" border=\"0\" />\t</td>\n");
      out.write("\n");
      out.write("    <form name=\"form1\" action=\"procura\">\n");
      out.write("    <td><h1 align=\"center\"><font color=\"#FFFFFF\" size=\"+7\" aling=\"center\">Venda online de material informático</font><font size=\"+7\" aling=\"center\"><br>\n");
      out.write("\n");
      out.write("            </font></h1></td>\n");
      out.write("    </form>\n");
      out.write("    <td>\n");
      out.write("\n");
      out.write("\t<table width=\"200\" border=\"0\">\n");
      out.write("      <tr>\n");
      out.write("        <td><font color=\"#FFFFFF\">E-mail:</font></td>\n");
      out.write("        <td><input type=\"text\" name=\"login\" /></td>\n");
      out.write("      </tr>\n");
      out.write("      <tr>\n");
      out.write("        <td><font color=\"#FFFFFF\">Password:</font></td>\n");
      out.write("        <td><input name=\"password\" type=\"password\" maxlength=\"20\" /></td>\n");
      out.write("      </tr>\n");
      out.write("\t  <tr>\n");
      out.write("        <td><form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\n");
      out.write("          <label>\n");
      out.write("            <input type=\"submit\" name=\"Submit\" value=\"Entrar\" />\n");
      out.write("            </label>\n");
      out.write("        </form>        </td>\n");
      out.write("        <td><a href=\"cadastro.jsp\"><font color=\"#FFFFFF\">Registra-se</font></a></td>\n");
      out.write("      </tr>\n");
      out.write("    </table>\n");
      out.write("\t</td>\n");
      out.write("  </tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"80%\" border=\"0\" align=\"center\" bgcolor=\"#FF6600\">\n");
      out.write("    <tr>\n");
      out.write("\t <td width=\"265\"><div align=\"center\">\n");
      out.write("       <a href=\"listarComputadores\"><font color=\"#00FFFF\">Computadores</font></a>\n");
      out.write("      </div></td>\n");
      out.write("\n");
      out.write("\t  <td width=\"239\"><div align=\"center\">\n");
      out.write("\t  <a href=\"listarFlashes\"><font color=\"#00FFFF\">Flash's</font></a>\n");
      out.write("      </div></td>\n");
      out.write("\n");
      out.write("\t  <td width=\"269\"><div align=\"center\">\n");
      out.write("\t  <a href=\"listarImpressoras\"><font color=\"#00FFFF\">Impressoras</font></a>\n");
      out.write("      </div></td>\n");
      out.write("\n");
      out.write("\t  <td width=\"270\"><div align=\"center\">\n");
      out.write("\t  <a href=\"listarOutrosAcessorios\"><font color=\"#00FFFF\">Outros Acessorios</font></a>\n");
      out.write("      </div></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write("<br>\n");
      out.write("<table width=\"406\" border=\"0\">\n");
      out.write("<tr>\n");
      out.write("<td width=\"152\">&nbsp;</td>\n");
      out.write("\n");
      out.write("<td width=\"244\">\n");
      out.write("    <form name=\"procuraPorNome\" method=\"get\" action=\"listaPorNome\">\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
 if (request.getParameter("nome") != null)  {
            nome = request.getParameter("nome");
            }
                
      out.write("\n");
      out.write("\n");
      out.write("        <input type=\"text\" name=\"nome\" value=\"");
      out.print(nome);
      out.write("\"/>\n");
      out.write("<input type=\"submit\" name=\"pNome\" value=\"Procurar\" />\n");
      out.write("\n");
      out.write("</form></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("</table>\n");
      out.write("<br>\n");
      out.write("<table  width=\"304\" border=\"0\" align=\"left\">\n");
      out.write("        <tr>\n");
      out.write("          <td width=\"152\">&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("\t\t<td height=\"49\">&nbsp;</td>\n");
      out.write("          <td width=\"142\"><a href=\"index.jsp\"><font color=\"#FFFFFF\"><font color=\"#FFFFFF\">Pagina Inicial</font></a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("\t\t<td height=\"49\">&nbsp;</td>\n");
      out.write("          <td><a href=\"faleConosco.jsp\"><font color=\"#FFFFFF\"><font color=\"#FFFFFF\">Fale conosco</font></a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("\t\t<td height=\"48\">&nbsp;</td>\n");
      out.write("          <td><a href=\"contacto.jsp\"><font color=\"#FFFFFF\"><font color=\"#FFFFFF\">Contacto</font></a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("\t\t<td height=\"48\">&nbsp;</td>\n");
      out.write("           <td><a href=\"empresa.html\"><font color=\"#FFFFFF\"><font color=\"#FFFFFF\">Sobre a empresa</font> </a></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
 produtos = (ArrayList<Produto>) request.getAttribute("produtos");
      out.write("\n");
      out.write("\n");
      out.write("        <table border=\"0\" align=\"left\" bgcolor=\"#FFFFFF\" >\n");
      out.write("            <tr>\n");
      out.write("\t\t<td width=\"188\" bgcolor=#FFFFFF >&nbsp;</td>\n");
      out.write("                <td width=\"156\" bgcolor=#FFFFFF>&nbsp;</td>\n");
      out.write("                <td width=\"380\" bgcolor=#FFFFFF>&nbsp;</td>\n");
      out.write("                <td width=\"214\" bgcolor=#FFFFFF>&nbsp;</td>\n");
      out.write("\t\t\t\t<td width=\"158\" bgcolor=#FFFFFF>&nbsp;</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

            for(Produto p:produtos){
                out.println("<tr>");
		out.println("<td><img src=img/categoria/computador/"+p.getImagen()+" width=157 height=80></td>");
                out.println("<td bgcolor=#FFFFFF>"+p.getNome()+"</td>");
                out.println("<td bgcolor=#FFFFFF>"+p.getDescricao()+"</td>");
                out.println("<td bgcolor=#FFFFFF>"+p.getPreco()+" MZN</td>");
                out.println("<td bgcolor=#FFFFFF>"+ "<input name=Adicionar ao Carrinho type=button value=Adicionar /></td>");
                out.println("</tr>");
            }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <hr width=50% size=7>\n");
      out.write("<h3 align=\"center\"> © 2013 e-Moz | Contact us</h3>\n");
      out.write("</body>\n");
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
