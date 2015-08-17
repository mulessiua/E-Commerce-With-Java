/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import factory.FactoryCarrinhoOrdem;
import produto.CarrinhoOrdem;
import factory.FactoryCadastro;
import produto.Cadastro;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

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
@WebServlet(name="listarOrdens", urlPatterns={"/listarOrdens"})
public class listarOrdens extends HttpServlet {
   
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
            FactoryCarrinhoOrdem fco = new FactoryCarrinhoOrdem();
            List carrinhos = new ArrayList<CarrinhoOrdem>();

            carrinhos = fco.selectAllCadastroId();

            ArrayList<CarrinhoOrdem> carrinhoss = new ArrayList<CarrinhoOrdem>();
            carrinhoss = (ArrayList<CarrinhoOrdem>) carrinhos;

            for(CarrinhoOrdem coo:carrinhoss){
            //out.println(coo.getCadastroId());
            
                FactoryCadastro fca = new FactoryCadastro();
                List cadastros = new ArrayList<Cadastro>();

                    Object a = coo.getCadastroId();
                    String b = (String) a;
                cadastros = fca.selectCadastrosByEmail(b);

                ArrayList<Cadastro> cas = new ArrayList<Cadastro>();
                cas = (ArrayList<Cadastro>) cadastros;
                for(Cadastro ca:cas){
                    out.println("Nome: "+ca.getNome());
                }
            }


            /*String nextJsp = "/listarOrdens.jsp";
            request.setAttribute("carrinhos",carrinhos);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);*/
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
