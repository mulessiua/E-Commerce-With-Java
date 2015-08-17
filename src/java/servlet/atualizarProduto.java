/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import factory.FactoryProduto;
import produto.Produto;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 706092010
 */
@WebServlet(name="atualizarProduto", urlPatterns={"/atualizarProduto"})
public class atualizarProduto extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String categoria = request.getParameter("categoria");
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            double preco = Double.parseDouble(request.getParameter("preco"));
            String imagen = request.getParameter("imagen");
            int disponivel = Integer.parseInt(request.getParameter("disponivel"));
            int vendido = Integer.parseInt(request.getParameter("vendido"));



           /*
            out.println(codigo);
            out.println(categoria);
            out.println(nome);
            out.println(descricao);
            out.println(preco);
            out.println(imagen);
            out.println(disponivel);
            out.println(vendido);
            */

                //business logic
        FactoryProduto fp = new FactoryProduto();
        Produto p = (Produto) fp.newElement();

        p.setProdutoId(codigo);
        p.setCategoria(categoria);
        p.setNome(nome);
        p.setDescricao(descricao);
        p.setPreco(preco);
        p.setImagen(imagen);
        p.setDisponivel(disponivel);
        p.setVendido(vendido);

        fp.update(p);

        response.sendRedirect(request.getContextPath() +"/sucessoEditar.jsp");

        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
