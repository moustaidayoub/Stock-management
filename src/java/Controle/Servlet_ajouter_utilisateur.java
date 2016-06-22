/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Model.UserHelper;
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
public class Servlet_ajouter_utilisateur extends HttpServlet {

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
     UserHelper uh=new UserHelper(); 
      RequestDispatcher d=null;
     String matricule=(String)request.getParameter("matriculeuser");
     if(matricule.equals(""))
     {
          d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_utilisateurs=ajouter_utilisateur&utilisateur_null");
      d.forward(request,response);
     }
     else if(uh.getUser(matricule)!=null){
        d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_utilisateurs=ajouter_utilisateur&utilisateur_existe");
      d.forward(request,response);
     }
     else{
     String nom=(String)request.getParameter("nomuser");
     String prenom=(String)request.getParameter("prenomuser");
     String poste=(String)request.getParameter("posteuser");
     String motdepasse=(String)request.getParameter("motdepasseuser");
     uh.AjouterUtilisateur(matricule,nom,prenom,poste,motdepasse);
    d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_utilisateurs=ajouter_utilisateur&utilisateur_ajoute");
      d.forward(request,response);}
}
}