package Metier;
// Generated 22 juin 2013 13:35:50 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private String matUser;
     private String nomUser;
     private String prenomUser;
     private String posteUser;
     private String passwordUser;
     private Set articles = new HashSet(0);
     private Set demandeArticles = new HashSet(0);
     private Set demandeArticles_1 = new HashSet(0);
     private Set messages = new HashSet(0);
     private Set messages_1 = new HashSet(0);
     private Set articles_1 = new HashSet(0);

    public User() {
    }

	
    public User(String matUser) {
        this.matUser = matUser;
    }
    public User(String matUser, String nomUser, String prenomUser, String posteUser, String passwordUser, Set articles, Set demandeArticles, Set demandeArticles_1, Set messages, Set messages_1, Set articles_1) {
       this.matUser = matUser;
       this.nomUser = nomUser;
       this.prenomUser = prenomUser;
       this.posteUser = posteUser;
       this.passwordUser = passwordUser;
       this.articles = articles;
       this.demandeArticles = demandeArticles;
       this.demandeArticles_1 = demandeArticles_1;
       this.messages = messages;
       this.messages_1 = messages_1;
       this.articles_1 = articles_1;
    }
   
    public String getMatUser() {
        return this.matUser;
    }
    
    public void setMatUser(String matUser) {
        this.matUser = matUser;
    }
    public String getNomUser() {
        return this.nomUser;
    }
    
    public void setNomUser(String nomUser) {
        this.nomUser = nomUser;
    }
    public String getPrenomUser() {
        return this.prenomUser;
    }
    
    public void setPrenomUser(String prenomUser) {
        this.prenomUser = prenomUser;
    }
    public String getPosteUser() {
        return this.posteUser;
    }
    
    public void setPosteUser(String posteUser) {
        this.posteUser = posteUser;
    }
    public String getPasswordUser() {
        return this.passwordUser;
    }
    
    public void setPasswordUser(String passwordUser) {
        this.passwordUser = passwordUser;
    }
    public Set getArticles() {
        return this.articles;
    }
    
    public void setArticles(Set articles) {
        this.articles = articles;
    }
    public Set getDemandeArticles() {
        return this.demandeArticles;
    }
    
    public void setDemandeArticles(Set demandeArticles) {
        this.demandeArticles = demandeArticles;
    }
    public Set getDemandeArticles_1() {
        return this.demandeArticles_1;
    }
    
    public void setDemandeArticles_1(Set demandeArticles_1) {
        this.demandeArticles_1 = demandeArticles_1;
    }
    public Set getMessages() {
        return this.messages;
    }
    
    public void setMessages(Set messages) {
        this.messages = messages;
    }
    public Set getMessages_1() {
        return this.messages_1;
    }
    
    public void setMessages_1(Set messages_1) {
        this.messages_1 = messages_1;
    }
    public Set getArticles_1() {
        return this.articles_1;
    }
    
    public void setArticles_1(Set articles_1) {
        this.articles_1 = articles_1;
    }




}


