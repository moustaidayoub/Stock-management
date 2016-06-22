package Metier;
// Generated 22 juin 2013 13:35:50 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Fournisseur generated by hbm2java
 */
public class Fournisseur  implements java.io.Serializable {


     private Long idFournisseur;
     private String nomFournisseur;
     private String adresseFournisseur;
     private String telFournisseur;
     private String emailFournisseur;
     private Set articles = new HashSet(0);
     private Set articles_1 = new HashSet(0);

    public Fournisseur() {
    }

    public Fournisseur(String nomFournisseur, String adresseFournisseur, String telFournisseur, String emailFournisseur, Set articles, Set articles_1) {
       this.nomFournisseur = nomFournisseur;
       this.adresseFournisseur = adresseFournisseur;
       this.telFournisseur = telFournisseur;
       this.emailFournisseur = emailFournisseur;
       this.articles = articles;
       this.articles_1 = articles_1;
    }
   
    public Long getIdFournisseur() {
        return this.idFournisseur;
    }
    
    public void setIdFournisseur(Long idFournisseur) {
        this.idFournisseur = idFournisseur;
    }
    public String getNomFournisseur() {
        return this.nomFournisseur;
    }
    
    public void setNomFournisseur(String nomFournisseur) {
        this.nomFournisseur = nomFournisseur;
    }
    public String getAdresseFournisseur() {
        return this.adresseFournisseur;
    }
    
    public void setAdresseFournisseur(String adresseFournisseur) {
        this.adresseFournisseur = adresseFournisseur;
    }
    public String getTelFournisseur() {
        return this.telFournisseur;
    }
    
    public void setTelFournisseur(String telFournisseur) {
        this.telFournisseur = telFournisseur;
    }
    public String getEmailFournisseur() {
        return this.emailFournisseur;
    }
    
    public void setEmailFournisseur(String emailFournisseur) {
        this.emailFournisseur = emailFournisseur;
    }
    public Set getArticles() {
        return this.articles;
    }
    
    public void setArticles(Set articles) {
        this.articles = articles;
    }
    public Set getArticles_1() {
        return this.articles_1;
    }
    
    public void setArticles_1(Set articles_1) {
        this.articles_1 = articles_1;
    }




}


