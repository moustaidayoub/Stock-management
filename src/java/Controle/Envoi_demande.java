/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Metier.Admin;
import Metier.ClasseArticle;
import Metier.DemandeArticle;
import Metier.User;
import Model.DemandeHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class Envoi_demande extends HttpServlet {

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
     DemandeHelper dh=new DemandeHelper();
     Long idclasse=(Long.decode(request.getParameter("idclasse")).longValue());
     String matricule=(String)session.getAttribute("matricule");   
     dh.AjouterDemande(idclasse,matricule);
    RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?user_espace_demandes=demande_envoyee");
      d.forward(request,response);
}
}
