/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

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
 * @author Mulessiua(Carlitos)
 */
@WebServlet(name="atualizarCadastro", urlPatterns={"/atualizarCadastro"})
public class atualizarCadastro extends HttpServlet {
   
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
            String codigo0 = request.getParameter("codigoC");
            int codigo = Integer.parseInt(codigo0);
            String nome = request.getParameter("nomer");
            String apelido = request.getParameter("apelido");
            String password = request.getParameter("password");
            String rep_password = request.getParameter("rep_password");
            String email = request.getParameter("email");
            String pais = request.getParameter("pais");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");

         
            FactoryCadastro fc = new FactoryCadastro();
            Cadastro c = (Cadastro) fc.newElement();

            c.setRCadastroId(codigo);
            c.setNome(nome);
            c.setApelido(apelido);
            c.setPassword(password);
            c.setRep_password(rep_password);
            c.setEmail(email);
            c.setPais(pais);
            c.setEndereco(endereco);
            c.setTelefone(telefone);
            //c.setTipo("user");

            fc.update(c);

            response.sendRedirect(request.getContextPath() +"/sucessoCadastro.jsp");
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
