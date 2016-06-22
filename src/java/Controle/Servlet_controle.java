/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

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
public class Servlet_controle extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
       RequestDispatcher d=null;
       HttpSession s=request.getSession(true);
       //Dispatching vers les autres ressources grace au test
        if(request.getQueryString().equals("index"))
        {
          d=request.getRequestDispatcher("/Test_login");
          d.forward(request,response);
        }
        if(request.getQueryString().contains("user_accueil"))
        {
          d=request.getRequestDispatcher("/user.jsp");
          d.forward(request,response);
        }
        if(request.getQueryString().contains("admin_accueil"))
        {
          d=request.getRequestDispatcher("/admin.jsp");
          d.forward(request,response);
        }
          if(request.getQueryString().equals("logout"))
        {
          d=request.getRequestDispatcher("/servlet_logout");
          d.forward(request,response);
        }
           if(request.getQueryString().equals("from_erreur"))
        {
          d=request.getRequestDispatcher("/index.jsp");
          d.forward(request,response);
        }
        if(request.getQueryString().equals("test_login"))
        {
           if(s.getAttribute("role").equals("admin"))
            {
              d=request.getRequestDispatcher("/admin.jsp");
            d.forward(request,response);
            }
           else if(s.getAttribute("role").equals("user"))
           {
            d=request.getRequestDispatcher("/user.jsp");
            d.forward(request,response);
           }
           else 
           {
            d=request.getRequestDispatcher("/page_erreur.jsp?erreur=connexion_erreur");
            d.forward(request,response);
           }
        }
        
        if(request.getQueryString().contains("msgs_recus"))
        { 
        d=request.getRequestDispatcher("/msgs_recus.jsp");
        d.forward(request, response);
        }
         if(request.getQueryString().contains("Servlet_set_msg_lus"))
        { 
        d=request.getRequestDispatcher("/Servlet_set_msg_lus");
        d.forward(request, response);
        }
          if(request.getQueryString().contains("Servlet_set_demande_vue"))
        { 
        d=request.getRequestDispatcher("/Servlet_set_demande_vue");
        d.forward(request, response);
        }
           if(request.getQueryString().contains("Servlet_reponse_demande"))
        { 
        d=request.getRequestDispatcher("/Servlet_reponse_demande");
        d.forward(request, response);
        }
            if(request.getQueryString().contains("repondre_demande"))
        { 
        d=request.getRequestDispatcher("/repondre_demande.jsp");
        d.forward(request, response);
        }
        if(request.getQueryString().contains("lire_msg"))
        { 
        d=request.getRequestDispatcher("/lire_msg.jsp");
        d.forward(request, response);
        }
         if(request.getQueryString().contains("details_dem"))
        {
        d=request.getRequestDispatcher("/details_dem.jsp");
        d.forward(request, response);
        }
     
       if(request.getQueryString().contains("messages"))
        {
        d=request.getRequestDispatcher("/messages.jsp");
        d.forward(request, response);
        }

    if(request.getQueryString().contains("Envoi_demande"))
        {
        d=request.getRequestDispatcher("/Envoi_demande");
        d.forward(request, response);
        }
    if(request.getQueryString().contains("Envoi_message"))
        {
        d=request.getRequestDispatcher("/Envoi_message");
        d.forward(request, response);
        }
    if(request.getQueryString().contains("admin_espace_demandes"))
        {
        d=request.getRequestDispatcher("/admin_espace_demandes.jsp");
        d.forward(request, response);
        }
    if(request.getQueryString().contains("user_espace_demandes"))
        {
        d=request.getRequestDispatcher("/user_espace_demandes.jsp");
        d.forward(request, response);
        }
      if(request.getQueryString().contains("Mon_compte"))
        {
        d=request.getRequestDispatcher("/Mon_compte.jsp");
        d.forward(request, response);
        }
     
        if(request.getQueryString().contains("admin_gestion_stock"))
        { 
        d=request.getRequestDispatcher("/admin_gestion_stock.jsp");
        d.forward(request, response);
        }
         if(request.getQueryString().contains("Servlet_ajout_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_ajout_article");
        d.forward(request, response);
        }
         if(request.getQueryString().contains("Servlet_supprimer_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_supprimer_article");
        d.forward(request, response);
        }
          if(request.getQueryString().contains("admin_modifier_article"))
        { 
        d=request.getRequestDispatcher("/admin_modifier_article.jsp");
        d.forward(request, response);
        }
            if(request.getQueryString().contains("Servlet_modification_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_modification_article");
        d.forward(request, response);
        }
             if(request.getQueryString().contains("Servlet_ajouter_fournisseur"))
        { 
        d=request.getRequestDispatcher("/Servlet_ajouter_fournisseur");
        d.forward(request, response);
        }
              if(request.getQueryString().contains("admin_modifier_fournisseur"))
        { 
        d=request.getRequestDispatcher("/admin_modifier_fournisseur.jsp");
        d.forward(request, response);
        }
                 if(request.getQueryString().contains("Servlet_modification_fournisseur"))
        { 
        d=request.getRequestDispatcher("/Servlet_modification_fournisseur");
        d.forward(request, response);
        }
                 if(request.getQueryString().contains("Servlet_ajouter_classe_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_ajouter_classe_article");
        d.forward(request, response);
        }
                      if(request.getQueryString().contains("Servlet_supprimer_classe_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_supprimer_classe_article");
        d.forward(request, response);
        }
         if(request.getQueryString().contains("admin_modifier_classe_article"))
        { 
        d=request.getRequestDispatcher("/admin_modifier_classe_article.jsp");
        d.forward(request, response);
        }
           if(request.getQueryString().contains("Servlet_modification_classe_article"))
        { 
        d=request.getRequestDispatcher("/Servlet_modification_classe_article");
        d.forward(request, response);
        }
            if(request.getQueryString().contains("admin_gestion_utilisateurs"))
        { 
        d=request.getRequestDispatcher("/admin_gestion_utilisateurs.jsp");
        d.forward(request, response);
        }
               if(request.getQueryString().contains("Servlet_ajouter_utilisateur"))
        { 
        d=request.getRequestDispatcher("/Servlet_ajouter_utilisateur");
        d.forward(request, response);
        }
            if(request.getQueryString().contains("admin_modifier_utilisateur"))
        { 
        d=request.getRequestDispatcher("/admin_modifier_utilisateur.jsp");
        d.forward(request, response);
        }
              if(request.getQueryString().contains("Servlet_modification_utilisateur"))
        { 
        d=request.getRequestDispatcher("/Servlet_modification_utilisateur");
        d.forward(request, response);
        }                

    
    
    
    }
    
    
    
    
    

   
    
   
}
