/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Metier.Admin;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class AdminHelper {
     public Admin getAdmin(String matricule)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Admin admin=(Admin) session.get(Admin.class, matricule);
    return admin;
    }
}
