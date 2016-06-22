/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Model.MessageHelper;
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
public class Envoi_message extends HttpServlet {

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
     MessageHelper mh=new MessageHelper();
     String role=(String)session.getAttribute("role");
     String matricule=(String)request.getParameter("matricule"); 
      String objet=(String)request.getParameter("objet");
     String msg=(String)request.getParameter("msg");
     if(role.equals("admin"))
        mh.AjouterMessageAdmin(matricule,objet,msg);
     else{
         matricule=(String)session.getAttribute("matricule");
        mh.AjouterMessageUser(matricule,objet,msg); 
     }
  RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?messages=msg_envoye");
      d.forward(request,response);
}
}
