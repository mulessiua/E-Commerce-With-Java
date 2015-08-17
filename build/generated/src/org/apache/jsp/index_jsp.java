package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import carrinho.Carrinho;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

String nome = new String();
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');

String numItemCarr = new String();
HttpSession htm = request.getSession(true);
Carrinho cm = (Carrinho) htm.getAttribute("carrinho");
if ((cm != null) && (cm.getNumeroItems() > 0)) {
    numItemCarr = "("+cm.getNumeroItems()+")";
	}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("  <title>EMoz</title>\r\n");
      out.write("   <link rel=\"stylesheet\" href=\"style.css\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".style7 {font-size: x-large}\r\n");
      out.write(".style8 {color: #666666}\r\n");
      out.write(".style10 {color: #666666; font-size: medium; }\r\n");
      out.write(".style15 {color: green; font-size:  x-large;}\r\n");
      out.write("-->\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"header-wrap\">\r\n");
      out.write("\t\t<header class=\"group\">\r\n");
      out.write("\t\t<table width=\"200\" border=\"0\" align=\"right\">\r\n");
      out.write("\t  <tr>\r\n");
      out.write("        <td>\r\n");
      out.write("\t\t");

            if(htm.getAttribute("email")==null){
                out.println("<a href=login.jsp class=style8>Login</a> &nbsp;");
                out.println("<a href=cadastro.jsp class=style8>Registra-se</a>");
                }else{
                out.println("<a href=logout class=style8>Logout</a> &nbsp;");
                }
            
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("\t<a href=\"carrinho.jsp\" class=\"green\"><strong>[Ver Carrinho]</strong></a>\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("\t\t\t<p align=\"center\"><span class=\"style10\"> ");
      out.print(bem);
      out.write("</span> <a href=editarCadastro?email=");
      out.print(se);
      out.write("><strong class=\"green\">");
      out.print(se);
      out.write("</strong></a></p>\r\n");
      out.write("\t\t\t<h2><a href=\"index.jsp\" title=\"EMoz\">Emoz</a></h2>\r\n");
      out.write("\t\t\t<div id=\"call\">\r\n");
      out.write("\t\t\t\t<h3 name=\"ItensDoCariho\"> ");
      out.print(numItemCarr);
      out.write(" <span class=\"style8\">");
      out.print(we);
      out.write("</span></h3>\r\n");
      out.write("\t\t\t</div><!-- end call -->\r\n");
      out.write("\t\t\t<nav class=\"group\">\r\n");
      out.write("\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t<li class=\"home\"><a href=\"index.jsp\" title=\"P&aacute;gina Inicial\">P&aacute;gina Inicial</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"maComputadores.jsp\" title=\"Computadores\">Computadores</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"listarFlashes\" title=\"Flash's\">Flash's</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"listarImpressoras\" title=\"Impressoras\">Impressoras</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"listarOutrosAcessorios\" title=\"Outros Acessorios\">Outros Acessorios</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"last\">\r\n");
      out.write("\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t<form name=\"procuraPorNome\" method=\"get\" action=\"listaPorNome\">\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");
 if (request.getParameter("nome") != null)  {
            nome = request.getParameter("nome");
            }
                
      out.write("\r\n");
      out.write("        <input type=\"text\" name=\"nome\" value=\"");
      out.print(nome);
      out.write("\"/>\r\n");
      out.write("<input type=\"submit\" name=\"pNome\" value=\"Procurar\" />\r\n");
      out.write("</form>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</nav>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("  ");

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
 
      out.write("\r\n");
      out.write("<div id=\"client\">\r\n");
      out.write("\t\t\t\t<table width=\"906\" border=\"0\" align=\"center\" bgcolor=\"#FFFFFF\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"20%\"><div align=\"center\" class=\"style8\"><span class=\"style7\">Aqui voc&ecirc; ir&aacute; encontrar a melhor solu&ccedil;&atilde;o para o seu problema... Dispomos de diversos acess&oacute;rios inform&aacute;ticos.</span></div>\r\n");
      out.write("\t  <div align=\"center\"></div></td>\r\n");
      out.write("    <td width=\"17%\" height=\"147\" align=\"center\" class=\"green\"><h3 class=\"green style8\">Computadores</h3>\r\n");
      out.write("      <a href=\"maComputadores.jsp\"><img src=\"img/categoria/macbook.jpg\" alt=\"computadores\" width=\"157\" height=\"80\" border=\"0\" /></a> </td>\r\n");
      out.write("    <td width=\"17%\" align=\"center\" class=\"green\"><h3 class=\"green style8\">Flash's</h3>\r\n");
      out.write("    <p><a href=\"listarFlashes\"><img src=\"img/categoria/pen-drive.jpg\" alt=\"flash's\" width=\"157\" height=\"80\" border=\"0\" /></a></p></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"20%\"><div align=\"center\" class=\"style8\"><span class=\"style7\">Voc&ecirc; faz compras sem sair de casa e em qualquer hora do dia...</span></div></td>\r\n");
      out.write("    <td height=\"141\" align=\"center\" class=\"green\"><h3 class=\"green style8\">Impressoras</h3>\r\n");
      out.write("\t<p><a href=\"listarImpressoras\"><img src=\"img/categoria/impressora.jpg\" alt=\"impressoras\" width=\"157\" height=\"80\" border=\"0\" /></a></p></td>\r\n");
      out.write("\t<td align=\"center\" class=\"green\"><h3 class=\"green style8\">Outros Acessorios </h3>\r\n");
      out.write("\t<p><a href=\"listarOutrosAcessorios\"><img src=\"img/categoria/acessorios.jpg\" alt=\"acessorioss\" width=\"157\" height=\"80\" border=\"0\" /></a></p></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\t</header>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("  <!-- end header wrap -->\r\n");
      out.write("<br />\r\n");
      out.write("<div id=\"client-wrap\">\r\n");

String admin="";
            if(htm.getAttribute("email")==null){
                admin="| <a href=loginAdmin.jsp class=style8 title=Administrador>Administrador</a>";
                }else{
                admin="";
                }
            
      out.write("\r\n");
      out.write("\t\t\t<hr align=\"center\" width=50% size=7>\r\n");
      out.write("<h3 align=\"center\" class=\"style8\"> &copy; 2014 E-Moz | Contacte-nos ");
      out.print(admin);
      out.write("</h3>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
