/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;


import java.util.List;
import java.util.ArrayList;
import carrinho.Carrinho;
import produto.Produto;
import produto.Cadastro;
import produto.CarrinhoOrdem;
import factory.FactoryProduto;
import factory.FactoryCadastro;
import factory.FactoryCarrinhoOrdem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
/**
 *
 * @author Mulessiua(Carlitos)
 */
@WebServlet(name="addCarrinho", urlPatterns={"/addCarrinho"})
public class addCarrinho extends HttpServlet {
   
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
            String codigo = request.getParameter("codigo");
            FactoryProduto fp = new FactoryProduto();
            Produto p = (Produto) fp.read(codigo);

            HttpSession ht = request.getSession(true);
            Carrinho c = (Carrinho) ht.getAttribute("carrinho");
            if (c == null) {
                c = new Carrinho();
            }
            c.adicionaItem(p);
            ht.setAttribute("carrinho",c);
            response.sendRedirect(request.getContextPath() +"/carrinho.jsp");

            //adicionar a ordem de base de dados
            
            //out.println(ht.getAttribute("email"));
            Object a = ht.getAttribute("email");
            String b = (String) a;

            int codigo1 = Integer.parseInt(request.getParameter("codigo"));

            FactoryCarrinhoOrdem fco = new FactoryCarrinhoOrdem();
            CarrinhoOrdem co = (CarrinhoOrdem) fco.newElement();

            FactoryCadastro fc = new FactoryCadastro();
            List carrinhos = new ArrayList<Cadastro>();

            carrinhos = fc.selectCadastrosByEmail(b);
            //out.println(b);

            ArrayList<Cadastro> cadastros = new ArrayList<Cadastro>();
            cadastros = (ArrayList<Cadastro>) carrinhos;

            for(Cadastro ca:cadastros){

               /*out.println(ca.getRCadastroId());
                out.println(ca.getEmail());
                out.println(ca.getNome());*/

            co.setCadastroId(ca.getRCadastroId());
            co.setProdutoId(codigo1);

            fco.insert(co);
            }
/*
            if(carrinhos.isEmpty()){
            out.println("vazio");
            }else{
            String nextJsp = "/newjsp.jsp";
            request.setAttribute("cadastros",carrinhos);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);}
*/

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
