/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Model.FournisseurHelper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ayoub
 */
public class Servlet_modification_fournisseur extends HttpServlet {
 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();   
     FournisseurHelper fh=new FournisseurHelper(); 

     Long idfournisseur=(Long.decode(request.getParameter("Servlet_modification_fournisseur")).longValue());
     String nom=(String)request.getParameter("nom");
     String adresse=(String)request.getParameter("adresse");
     String tel=(String)request.getParameter("tel");
     String email=(String)request.getParameter("email");
     fh.ModifierFournisseur(idfournisseur,nom,adresse,tel,email);
    RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_stock=consulter_fournisseurs&fournisseur_modifie");
      d.forward(request,response);
}
}
