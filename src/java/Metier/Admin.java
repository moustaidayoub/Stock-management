package Metier;
// Generated 22 juin 2013 13:35:50 by Hibernate Tools 3.2.1.GA



/**
 * Admin generated by hbm2java
 */
public class Admin  implements java.io.Serializable {


     private String matAdmin;
     private String nomAdmin;
     private String prenomAdmin;
     private String passwordAdmin;

    public Admin() {
    }

	
    public Admin(String matAdmin) {
        this.matAdmin = matAdmin;
    }
    public Admin(String matAdmin, String nomAdmin, String prenomAdmin, String passwordAdmin) {
       this.matAdmin = matAdmin;
       this.nomAdmin = nomAdmin;
       this.prenomAdmin = prenomAdmin;
       this.passwordAdmin = passwordAdmin;
    }
   
    public String getMatAdmin() {
        return this.matAdmin;
    }
    
    public void setMatAdmin(String matAdmin) {
        this.matAdmin = matAdmin;
    }
    public String getNomAdmin() {
        return this.nomAdmin;
    }
    
    public void setNomAdmin(String nomAdmin) {
        this.nomAdmin = nomAdmin;
    }
    public String getPrenomAdmin() {
        return this.prenomAdmin;
    }
    
    public void setPrenomAdmin(String prenomAdmin) {
        this.prenomAdmin = prenomAdmin;
    }
    public String getPasswordAdmin() {
        return this.passwordAdmin;
    }
    
    public void setPasswordAdmin(String passwordAdmin) {
        this.passwordAdmin = passwordAdmin;
    }




}


