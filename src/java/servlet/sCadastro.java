/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import produto.Cadastro;
import factory.FactoryCadastro;
import javax.servlet.RequestDispatcher;
import java.util.List;
import java.util.ArrayList;

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
@WebServlet(name="sCadastro", urlPatterns={"/sCadastro"})
public class sCadastro extends HttpServlet {
   
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
        String error = new String();

        String codigo1 = request.getParameter("codigo1");

        HttpSession ht = request.getSession();

        //Ler Input
        /*String strCadastroId = request.getParameter("cadastroId");
        int cadastroId = 0;*/
        String CadastroId = "null";
        String nome = request.getParameter("nomec");
        String apelido = request.getParameter("apelido");
        String password  = request.getParameter("password");
        String rep_password = request.getParameter("rep_password");
        String email = request.getParameter("email");
        String pais = request.getParameter("pais");
        String endereco  = request.getParameter("endereco");
        String telefone  = request.getParameter("telefone");
   
        FactoryCadastro fcx = new FactoryCadastro();
        List cadastros = new ArrayList<Cadastro>();

        cadastros = fcx.selectCadastrosByEmail(email);
        

        if(cadastros.isEmpty()){            

            }else{
                error = error + "Por favor, o E-MAIL ja existe! <br />";
            }


        //controlar o Input
        /*if ((strCadastroId == null) || (strCadastroId.length()==0)) {
            error = error + "O cadastroId nao pode estar vazio <br />";
        } else   {
            try {
                cadastroId = Integer.parseInt(strCadastroId);
            } catch (NumberFormatException e){
                error = error + "O cadastroId deve ser um numero <br />";
            }
        }*/
         if ((nome == null) || (nome.length()<=2)) {
            error = error + "Por favor, digita um NOME válido! <br />";
        }
        if ((apelido == null) || (apelido.length()<=2)) {
            error = error + "Por favor, digita um APELIDO válido! <br />";
        }
         if ((password == null) || (password.length()<10) || (password.length() >20)) {
            error = error + "Por favor, o PASSWORD deve conter entre 10 a 20 caracteres! <br />";
        }
        if ((rep_password == null) || (rep_password.length()<10) || (rep_password.length() >20)) {
            error = error + "Por favor, CONFIRMA O SEU PASSWORD e deve conter entre 10 a 20 caracteres! <br />";
        }
        if(password.equals(rep_password)){
            }else{
            error = error + "As SENHAS não corresponden! <br>";
        }
         if ((email == null) || (email.length()<=3) || email.indexOf("@")==-1 || email.indexOf(".")==-1) {
            error = error + "Por favor, digita um E-MAIL válido! <br />";
        }
        if ((pais == null) || (pais.length()<=3)) {
            error = error + "Por favor, digita um PAIS válido! <br />";
        }
         if ((endereco == null) || (endereco.length()<=3)) {
            error = error + "Por favor, digita um ENDERECO válido! <br />";
        }
       if ((telefone == null) || (telefone.length()<=3)) {
            error = error + "Por favor, digita um TELEFONE válido! <br />";
        }
        /*if ((strTelefone == null) || (strTelefone.length()==0)) {
            error = error + "O numero pagine nao pode ser vazio <br />";
        } else   {
            try {
                telefone = Integer.parseInt(strTelefone);
            } catch (NumberFormatException e){
                error = error + "O numero pagine deve ser um numero <br />";
            }
        }*/

        //controlar se tem erro
        if (error.length() > 0){
            String nextJsp = "/cadastro.jsp";
            request.setAttribute("error",error);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJsp);
            dispatcher.forward(request, response);
            return;
        }

        try {

            //business logic

        FactoryCadastro fc = new FactoryCadastro();
        Cadastro c = (Cadastro) fc.newElement();

        c.setICadastroId(CadastroId);
        c.setNome(nome);
        c.setApelido(apelido);
        c.setPassword(password);
        c.setRep_password(rep_password);
        c.setEmail(email);
        c.setPais(pais);
        c.setEndereco(endereco);
        c.setTelefone(telefone);

        fc.insert(c);

        String co = "checkout";

            ht.setAttribute("email", email);

            if(codigo1.equalsIgnoreCase(co)){
                response.sendRedirect(request.getContextPath() +"/checkoutE");
            }else{
                response.sendRedirect(request.getContextPath() +"/index.jsp");
            }


        } catch(Exception e){
            out.println(e.getMessage());
        }
        finally {
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
