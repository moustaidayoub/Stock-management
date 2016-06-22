/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Metier.Admin;
import Metier.User;
import Model.HibernateUtil;
import java.io.IOException;
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
public class Test_login extends HttpServlet {

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
        Session session=null;
        HttpSession s=request.getSession(true);
         String matricule=request.getParameter("matricule");
       String password=request.getParameter("password");
        session=HibernateUtil.getSessionFactory().getCurrentSession();
       session.beginTransaction();
       
    User user=(User) session.get(User.class,matricule);
      if(user !=null && user.getMatUser().equals(matricule) && user.getPasswordUser().equals(password))
      {
      s.setAttribute("nom",user.getNomUser());
      s.setAttribute("prenom",user.getPrenomUser());
      s.setAttribute("matricule",user.getMatUser());
      s.setAttribute("role","user");
      }
      else
      {
      Admin admin=(Admin) session.get(Admin.class,matricule);
          if(admin!=null && admin.getMatAdmin().equals(matricule) && admin.getPasswordAdmin().equals(password)){
          s.setAttribute("nom",admin.getNomAdmin());
          s.setAttribute("prenom",admin.getPrenomAdmin());
          s.setAttribute("matricule",admin.getMatAdmin());
          s.setAttribute("role","admin");
          }
      else{
          s.setAttribute("role","null");
      }
      }
      
    RequestDispatcher d=request.getRequestDispatcher("/Servlet_controle?test_login");
       d.forward(request,response);
 
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
