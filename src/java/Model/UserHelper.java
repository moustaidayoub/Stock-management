/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import Metier.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class UserHelper {
    public User getUser(String matricule)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    User user=(User) session.get(User.class, matricule);
    return user;
    }
    public List getUsers()
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from User as user order by user.nomUser ");
    List<User> listusers=(List<User>) q.list(); 
    return listusers;
    }
     public void AjouterUtilisateur(String matricule,String nom,String prenom,String poste,String motdepasse)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    User user=new User();
    user.setMatUser(matricule);
    user.setNomUser(nom);
    user.setPrenomUser(prenom);
    user.setPosteUser(poste);
    user.setPasswordUser(motdepasse);
    session.save(user);
    session.beginTransaction().commit();
   }
      public void ModifierUser(String matricule,String nom,String prenom,String poste,String password)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    User user=(User)session.get(User.class, matricule);
     user.setNomUser(nom);
     user.setPrenomUser(prenom);
     user.setPosteUser(poste);
     user.setPasswordUser(password);
    session.update(user);
    session.beginTransaction().commit();
   }
       public List getUsersBy(String critere,String valeur)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from User as user where user."+critere+" LIKE '%"+valeur+"%' order by user.nomUser");
    List<User> listusers=(List<User>) q.list(); 
    return listusers;
    }
}
