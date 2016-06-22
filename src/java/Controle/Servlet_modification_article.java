/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Metier.Article;
import Model.ArticleHelper;
import Model.ClasseArticleHelper;
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
public class Servlet_modification_article extends HttpServlet {

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
     Long idarticle=(Long.decode(request.getParameter("Servlet_modification_article")).longValue());
     Long idclasse=(Long.decode(request.getParameter("idclasse")).longValue());
     Long idfournisseur=(Long.decode(request.getParameter("idfournisseur")).longValue());
     String matuser=(String)request.getParameter("matricule");
     String numserie=(String)request.getParameter("numserie");
     String modele=(String)request.getParameter("modele");
     String marque=(String)request.getParameter("marque");
     String notes=(String)request.getParameter("notes");
     Article article=(Article) ah.getArticle(idarticle);
     if(matuser!=null && article.getUser()==null)
         cah.DiminuerQuantite(idclasse);
     ah.ModifierArticle(idarticle,idfournisseur,idclasse,matuser,numserie,modele,marque,notes);
    RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_stock=consulter_articles&article_modifie");
      d.forward(request,response);
}
}
