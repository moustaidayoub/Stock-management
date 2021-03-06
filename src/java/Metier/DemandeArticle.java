package Metier;
// Generated 22 juin 2013 13:35:50 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * DemandeArticle generated by hbm2java
 */
public class DemandeArticle  implements java.io.Serializable {


     private Long idDemande;
     private ClasseArticle classeArticle;
     private User user;
     private Date dateDemande;
     private Boolean reponse;
     private String commentaireReponse;
     private Boolean demandeVue;

    public DemandeArticle() {
    }

	
    public DemandeArticle(ClasseArticle classeArticle, User user) {
        this.classeArticle = classeArticle;
        this.user = user;
    }
    public DemandeArticle(ClasseArticle classeArticle, User user, Date dateDemande, Boolean reponse, String commentaireReponse, Boolean demandeVue) {
       this.classeArticle = classeArticle;
       this.user = user;
       this.dateDemande = dateDemande;
       this.reponse = reponse;
       this.commentaireReponse = commentaireReponse;
       this.demandeVue = demandeVue;
    }
   
    public Long getIdDemande() {
        return this.idDemande;
    }
    
    public void setIdDemande(Long idDemande) {
        this.idDemande = idDemande;
    }
    public ClasseArticle getClasseArticle() {
        return this.classeArticle;
    }
    
    public void setClasseArticle(ClasseArticle classeArticle) {
        this.classeArticle = classeArticle;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getDateDemande() {
        return this.dateDemande;
    }
    
    public void setDateDemande(Date dateDemande) {
        this.dateDemande = dateDemande;
    }
    public Boolean getReponse() {
        return this.reponse;
    }
    
    public void setReponse(Boolean reponse) {
        this.reponse = reponse;
    }
    public String getCommentaireReponse() {
        return this.commentaireReponse;
    }
    
    public void setCommentaireReponse(String commentaireReponse) {
        this.commentaireReponse = commentaireReponse;
    }
    public Boolean getDemandeVue() {
        return this.demandeVue;
    }
    
    public void setDemandeVue(Boolean demandeVue) {
        this.demandeVue = demandeVue;
    }




}


