<%-- 
    Document   : newjsp
    Created on : 17/Jan/2014, 16:32:54
    Author     : 706092010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="produto.Cadastro,java.util.List,java.util.ArrayList"%>

<%@page import="carrinho.Carrinho" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%!ArrayList<Cadastro> cadastros = new ArrayList<Cadastro>();%>
        <% cadastros = (ArrayList<Cadastro>) request.getAttribute("cadastros");%>

        <%
            for(Cadastro c:cadastros){

                out.println(c.getEmail());
                out.println(c.getNome());
            }
            %>

    </body>
</html>
