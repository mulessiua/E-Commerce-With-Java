<%-- 
    Document   : listarOrdens
    Created on : 5/Fev/2014, 11:33:35
    Author     : 706092010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.CarrinhoOrdem,java.util.List,java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%!ArrayList<CarrinhoOrdem> carrinhos = new ArrayList<CarrinhoOrdem>();%>
        <% carrinhos = (ArrayList<CarrinhoOrdem>) request.getAttribute("carrinhos");%>


        <%
            for(CarrinhoOrdem p:carrinhos){

                //out.println(p.getCarrinhoId());
		out.println(p.getCadastroId());
                //out.println(p.getProdutoId());
                out.println("<br>");
            }
            %>

    </body>
</html>
