/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import factory.FactoryCadastro;
import factory.FactoryCarrinhoOrdem;
import factory.FactoryProduto;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import produto.Produto;
import produto.Cadastro;
import carrinho.Carrinho;
import produto.CarrinhoOrdem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Mulessiua(Carlitos)
 */
@WebServlet(name="cLogin", urlPatterns={"/cLogin"})
public class cLogin extends HttpServlet {
   
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
           

            FactoryCadastro fc = new FactoryCadastro();
            List cadastros = new ArrayList<Cadastro>();

            HttpSession session = request.getSession();

            String codigo1 = request.getParameter("codigo1");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            cadastros = fc.loginUser(email, password);

            if(cadastros.isEmpty() && codigo1.equalsIgnoreCase("checkout")){
            String nextJsp = "/errorLoginC.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);
            }
            if(cadastros.isEmpty() && codigo1!="checkout"){
            String nextJsp = "/errorLogin.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);
            }
         
            else if(codigo1.equalsIgnoreCase("checkout"))
            {
                session.setAttribute("email", email);

                String nextJsp = "/checkoutE";
            request.setAttribute("cadastros",cadastros);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);
            }else{
                session.setAttribute("email", email);
                String nextJsp = "/cCadastros.jsp";
            request.setAttribute("cadastros",cadastros);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);
            }
    
            

            //se o usuario tem itens no carrinho da sessao antiga
            /*Object a = ht.getAttribute("email");
            String b = (String) a;*/

            //------------------------------------------------
             //parei aqui
             //-------------------------------------------------
             
            //int codigo1 = Integer.parseInt(request.getParameter("codigo"));

            /*FactoryCarrinhoOrdem fco = new FactoryCarrinhoOrdem();
            CarrinhoOrdem co = (CarrinhoOrdem) fco.newElement();

            //FactoryCadastro fc = new FactoryCadastro();
            List carrinhos = new ArrayList<Cadastro>();
            List carrinhos1 = new ArrayList<CarrinhoOrdem>();

            carrinhos = fc.selectCadastrosByEmail(email);

            //out.println(b);

            ArrayList<Cadastro> cadastrossa = new ArrayList<Cadastro>();
            cadastrossa = (ArrayList<Cadastro>) carrinhos;

            for(Cadastro ca:cadastrossa){

               out.println(ca.getRCadastroId());
               out.println(ca.getEmail());
               out.println(ca.getNome());

               carrinhos1 = fco.selectCarrinhoOrdensByCadastroId(ca.getRCadastroId());
               ArrayList<CarrinhoOrdem> carrinhox = new ArrayList<CarrinhoOrdem>();
               carrinhox = (ArrayList<CarrinhoOrdem>) carrinhos1;

               for(CarrinhoOrdem ci: carrinhox){

                   out.println(ci.getProdutoId());
                   
               FactoryProduto fp = new FactoryProduto();
                   
                   Object a = ci.getProdutoId();
                    String b = (String) a;

            Produto p = (Produto) fp.read(b);
              
            HttpSession ht = request.getSession(true);
            Carrinho c = (Carrinho) ht.getAttribute("carrinho");
            if (c == null) {
                c = new Carrinho();
            }
            c.adicionaItem(p);
            ht.setAttribute("carrinho",c);
            //response.sendRedirect(request.getContextPath() +"/carrinho.jsp");
               }
            }
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
