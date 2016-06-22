/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Metier.Fournisseur;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class FournisseurHelper {
          public Fournisseur getFournisseur(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Fournisseur frn=(Fournisseur) session.get(Fournisseur.class, id);
    return frn;
    }
      public List getFournisseurs()
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Fournisseur as fournisseur order by fournisseur.nomFournisseur ");
    List<Fournisseur> listfournisseurs=(List<Fournisseur>) q.list(); 
    return listfournisseurs;
    }
       public void AjouterFournisseur(String nom,String adresse,String tel,String email)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Fournisseur frn=new Fournisseur();
    frn.setNomFournisseur(nom);
    frn.setAdresseFournisseur(adresse);
    frn.setTelFournisseur(tel);
    frn.setEmailFournisseur(email);
    session.persist(frn);
    session.beginTransaction().commit();
   }
                    public void ModifierFournisseur(Long idfournisseur,String nom,String adresse,String tel,String email)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Fournisseur frn=(Fournisseur)session.get(Fournisseur.class, idfournisseur);
     frn.setNomFournisseur(nom);
     frn.setAdresseFournisseur(adresse);
     frn.setTelFournisseur(tel);
     frn.setEmailFournisseur(email);
    session.update(frn);
    session.beginTransaction().commit();
   }
                 public List getFournisseurBy(String critere,String valeur)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Fournisseur as fournisseur where fournisseur."+critere+" LIKE '%"+valeur+"%' order by fournisseur.nomFournisseur");
    List<Fournisseur> listfournisseurs=(List<Fournisseur>) q.list();
    return listfournisseurs;
    }
    
    
}
