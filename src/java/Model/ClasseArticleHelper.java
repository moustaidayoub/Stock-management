/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Metier.ClasseArticle;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class ClasseArticleHelper {
    public List getClassesCritiques(int qte)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from ClasseArticle as classes where classes.quantite<"+5+" order by classes.nomClasse");
    List<ClasseArticle> listclasses=(List<ClasseArticle>) q.list(); 
    return listclasses;
    }
    public ClasseArticle getClasse(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle classe=(ClasseArticle) session.get(ClasseArticle.class, id);
    return classe;
    }
     public List getClasses()
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from ClasseArticle as classes order by classes.nomClasse ");
    List<ClasseArticle> listclasses=(List<ClasseArticle>) q.list(); 
    return listclasses;
    }
      public void AjouterClasseArticle(String nom)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
   
    ClasseArticle ca=new ClasseArticle();
    ca.setNomClasse(nom);
    session.persist(ca);
    session.beginTransaction().commit();
   }
                public void ModifierClasse(Long idclasse,String nomclasse)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle classe=(ClasseArticle)session.get(ClasseArticle.class, idclasse);
     classe.setNomClasse(nomclasse);
    session.update(classe);
    session.beginTransaction().commit();
   }
               public void AugmenterQuantite(Long idclasse,int qte)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle classe=(ClasseArticle)session.get(ClasseArticle.class,idclasse);
     int quantite=(int)classe.getQuantite()+qte;
     classe.setQuantite(quantite);
    session.update(classe);
    session.beginTransaction().commit();
   }
                public void DiminuerQuantite(Long idclasse)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle classe=(ClasseArticle)session.get(ClasseArticle.class,idclasse);
    int quantite=(int)classe.getQuantite()-1;
     classe.setQuantite(quantite);
    session.update(classe); 
    session.beginTransaction().commit();
   }
       public void SupprimerClasseArticle(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    ClasseArticle ca=(ClasseArticle) session.get(ClasseArticle.class, id);
    session.delete(ca);
    session.beginTransaction().commit();
    }
                           public List getClasseBy(String critere,String valeur)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from ClasseArticle as classes where classes."+critere+" LIKE '%"+valeur+"%' order by classes.nomClasse");
    List<ClasseArticle> listclasses=(List<ClasseArticle>) q.list();
    return listclasses;
    }
                
}
