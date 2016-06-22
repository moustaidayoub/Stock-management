/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import Metier.ClasseArticle;
import Metier.DemandeArticle;
import Metier.Message;
import Metier.User;
import Model.HibernateUtil;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ayoub
 */
public class DemandeHelper {
    public List DemandesNonVues(String matricule)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.user.matUser='"+matricule+"' AND demande.reponse IS NOT null AND demande.demandeVue='0' order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
      public List DemandesVues(String matricule)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.user.matUser='"+matricule+"' AND demande.demandeVue='1'  order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();      
    return listdem;
    }
            public List DemandesRepondus(String matricule)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.user.matUser='"+matricule+"' AND demande.reponse IS NOT null order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
     public List DemandesNonRepondus(String matricule)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.user.matUser='"+matricule+"' AND demande.reponse IS null order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
      public List DemandesNonRepondusAdmin()
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.reponse IS null order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
          public List DemandesRepondusAdmin()
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.reponse IS NOT null order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
        public DemandeArticle getDemande(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    DemandeArticle dem=(DemandeArticle) session.get(DemandeArticle.class, id);
    return dem;
    }
        public void setVue(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    DemandeArticle dem=(DemandeArticle) session.get(DemandeArticle.class,id);
    dem.setDemandeVue(true);
    session.update(dem);
    session.beginTransaction().commit();
    }
            public void setReponse(Long id,Boolean reponse,String commentaire)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    DemandeArticle dem=(DemandeArticle) session.get(DemandeArticle.class,id);
    dem.setReponse(reponse);
    dem.setCommentaireReponse(commentaire);
    session.update(dem);
    session.beginTransaction().commit();
    }
        public void AjouterDemande(long idclasse,String matricule)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle ca=(ClasseArticle)session.get(ClasseArticle.class, idclasse);
    User user=(User)session.get(User.class, matricule);
     Helper h=new Helper();
     Date date=(Date) h.getDate().get(0);  
    DemandeArticle dem=new DemandeArticle(ca,user,date,null,null,false);
    session.persist(dem);
    session.beginTransaction().commit();
   }

          public List DemandesBy(String critere,String valeur)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande."+critere+" LIKE '%"+valeur+"%' order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
                  public List UserDemandesBy(String matricule,String critere,String valeur)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.user.matUser='"+matricule+"' AND demande."+critere+" LIKE '%"+valeur+"%' order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
      public List DemandesByDate(String date1,String date2)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.dateDemande BETWEEN '"+date1+"' AND '"+date2+"' order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }
      public List UserDemandesByDate(String matricule,String date1,String date2)
    {
    List<DemandeArticle> listdem=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from DemandeArticle as demande where demande.dateDemande BETWEEN '"+date1+"' AND '"+date2+"' AND demande.user.matUser='"+matricule+"' order by demande.dateDemande desc");
    listdem=(List<DemandeArticle>) q.list();  
    return listdem;
    }    
    
}