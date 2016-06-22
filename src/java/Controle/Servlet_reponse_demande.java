/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Model.DemandeHelper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ayoub
 */
public class Servlet_reponse_demande extends HttpServlet {

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
     DemandeHelper mh=new DemandeHelper();
     Boolean reponse=null;
     Long iddemande=(Long.decode(request.getParameter("Servlet_reponse_demande")).longValue());
     String rep=(String)request.getParameter("reponse");
     if(rep.equals("Accepter"))
     {
         reponse=true;
     d=request.getRequestDispatcher("/Servlet_controle?admin_gestion_stock=consulter_articles");
     }
     else {
         reponse=false;
         d=request.getRequestDispatcher("/Servlet_controle?admin_espace_demandes=reponse_envoyee");
     }
     String commentaire=(String)request.getParameter("commentaire");
     mh.setReponse(iddemande,reponse,commentaire);
     d.forward(request,response);
}
}
