/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Model.ArticleHelper;
import Model.ClasseArticleHelper;
import java.io.IOException;
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
public class Servlet_ajout_article extends HttpServlet {

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
     ArticleHelper ah=new ArticleHelper();
     ClasseArticleHelper cah=new ClasseArticleHelper();  
     Long idclasse=(Long.decode(request.getParameter("idclasse")).longValue());
     Long idfournisseur=(Long.decode(request.getParameter("idfournisseur")).longValue());
     String numserie=(String)request.getParameter("numserie");
     String modele=(String)request.getParameter("modele");
     String marque=(String)request.getParameter("marque");
     String notes=(String)request.getParameter("notes");
     int qte = Integer.parseInt(request.getParameter("qte"));
     ah.AjouterArticle(idfournisseur,idclasse,numserie,modele,marque,notes,qte);
     cah.AugmenterQuantite(idclasse,qte); 
    RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_stock=ajouter_article&article_ajoute");
      d.forward(request,response);
}
}
