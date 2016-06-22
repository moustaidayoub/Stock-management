/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Metier.Article;
import Metier.ClasseArticle;
import Metier.Fournisseur;
import Metier.User;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class ArticleHelper {
    public void AjouterArticle(Long idfournisseur,Long idclasse,String numserie,String modele,String marque,String notes,int qte)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Fournisseur frn=(Fournisseur)session.get(Fournisseur.class, idfournisseur);
    ClasseArticle ca=(ClasseArticle)session.get(ClasseArticle.class, idclasse);
     Helper h=new Helper();
     Date date=(Date) h.getDate().get(0);  
     for(int i=0;i<qte;i++)
     {
    Article article=new Article(frn,ca,null,numserie,marque,modele,date,notes);
    session.persist(article);
     }
    session.beginTransaction().commit();
   }
    public List getArticleByClasse(Long idclasse)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Article as article where article.classeArticle.idClasse='"+idclasse+"' order by article.dateLivraison desc");
    List<Article> articles=(List<Article>) q.list();
    return articles;
    }
     public List getArticles()
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Article as article order by article.dateLivraison desc");
    List<Article> listarticles=(List<Article>) q.list(); 
    return listarticles;
    }
         public Article getArticle(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Article article=(Article) session.get(Article.class, id);
    return article;
    }
              public void SupprimerArticle(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Article article=(Article) session.get(Article.class, id);
    session.delete(article);
    session.beginTransaction().commit();
    }
               public void ModifierArticle(Long idarticle,Long idfournisseur,Long idclasse,String matuser,String numserie,String modele,String marque,String notes)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Fournisseur frn=(Fournisseur)session.get(Fournisseur.class, idfournisseur);
    ClasseArticle ca=(ClasseArticle)session.get(ClasseArticle.class, idclasse);
    User us=(User) session.get(User.class,matuser);
     Helper h=new Helper();
     Date date=(Date) h.getDate().get(0);  
     Article article=(Article)session.get(Article.class,idarticle);
     article.setFournisseur(frn);
     article.setClasseArticle(ca);
     article.setUser(us);
     article.setNumSerie(numserie);
     article.setMarque(marque);
     article.setModele(modele);
     article.setNotes(notes);
    session.update(article);
    session.beginTransaction().commit();
   }
    
                   public List getArticleBy(String critere,String valeur)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Article as article where article."+critere+" LIKE '%"+valeur+"%' order by article.dateLivraison desc");
    List<Article> articles=(List<Article>) q.list(); 
    return articles;
    }
               public List getArticleByDate(String date1,String date2)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Article as article where article.dateLivraison BETWEEN '"+date1+"' AND '"+date2+"' order by article.dateLivraison desc");
    List<Article> articles=(List<Article>) q.list(); 
    return articles;
    }
}
