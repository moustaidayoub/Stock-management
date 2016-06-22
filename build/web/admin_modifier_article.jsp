<%-- 
    Document   : admin_modifier_article
    Created on : 6 juin 2013, 21:48:01
    Author     : ayoub
--%>

<%@page import="Metier.User"%>
<%@page import="Model.UserHelper"%>
<%@page import="Metier.Fournisseur"%>
<%@page import="Metier.ClasseArticle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Model.FournisseurHelper"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page import="Metier.Article"%>
<%@page import="Model.ArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page modification article</title>
    </head>
         <%  Long idarticle=(Long.decode(request.getParameter("admin_modifier_article")).longValue()); 
ArticleHelper ah=new ArticleHelper();
Article article=ah.getArticle(idarticle);   
ClasseArticleHelper cah=new ClasseArticleHelper();  
FournisseurHelper fh=new FournisseurHelper();
UserHelper uh=new UserHelper();
List<ClasseArticle> ca=(List<ClasseArticle>) cah.getClasses();  
List<Fournisseur> lf=(List<Fournisseur>) fh.getFournisseurs();
List<User> lu=(List<User>) uh.getUsers();    
%>      
    
    <body>
                <div id="header">
	<div class="inHeader">
		<div class="mosAdmin">
		Bonjour, <%= session.getAttribute("nom") %> <%= session.getAttribute("prenom") %><br>
		<%= session.getAttribute("role")%> | <a href="Servlet_controle?logout">Se Déconnecter</a>
		</div>
	<div class="clear"></div>
	</div>
</div>
   
	<div id="rightContent" style="margin-right:375px">
            <center>
	 <form method="POST" action="Servlet_controle?Servlet_modification_article=<%= article.getIdArticle() %>">
            <fieldset>
                <legend><h2>Modification Article</h2></legend>
                <h1><small>Modifier les champs souhaités et valider en cliquant sur modifier article</small></h1>
            <table>
                 <tr>
                    <td>
                        <label for="date">Date Livraison : </label>
                    </td>
                    <td>
                        <input type="text" name="date" value="<%= article.getDateLivraison() %>" disabled/>
                    </td>
                </tr>
              
                 <tr>
                    <td>
                        <label for="idclasse">Classe Article : </label>
                    </td>
                    <td>
                        <select name="idclasse" >
                            
                            <option value="<%= article.getClasseArticle().getIdClasse() %>" selected>
                                <%= article.getClasseArticle().getIdClasse() %>:<%= article.getClasseArticle().getNomClasse() %>
                            </option>
                            
                            </select>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <label for="idfournisseur">Fournisseur : </label>
                    </td>
                    <td>
                       <select name="idfournisseur">
                            <% for(int i=0;i<lf.size();i++) { %>
                            <% if(lf.get(i).getIdFournisseur()==article.getFournisseur().getIdFournisseur()) { %>
                            <option value="<%= lf.get(i).getIdFournisseur() %>" selected>
                                <%= lf.get(i).getIdFournisseur() %>:<%= lf.get(i).getNomFournisseur() %>
                            </option>
                            <% } else { %>
                            <option value="<%= lf.get(i).getIdFournisseur() %>">
                                <%= lf.get(i).getIdFournisseur() %>:<%= lf.get(i).getNomFournisseur() %>
                            </option>
                            <% }} %></select>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="matricule">Matricule Utilisateur: </label>
                    </td>
                    <td>
                        <select name="matricule">
                            <option selected />
                                <% for(int i=0;i<lu.size();i++) { %>
                            
                            <option value="<%= lu.get(i).getMatUser() %>">
                                <%= lu.get(i).getMatUser() %>:<%= lu.get(i).getNomUser() %> <%= lu.get(i).getPrenomUser() %>
                            </option>
                            <% } %></select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="numserie">Numero de Serie: </label>
                    </td>
                    <td>
                        <input type="text" name="numserie" value="<%= article.getNumSerie() %>" />
                    </td>
                </tr>
           <tr>
                    <td>
                        <label for="marque">Marque: </label>
                    </td>
                    <td>
                        <input type="text" name="marque" value="<%= article.getMarque() %>" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="modele">Modele: </label>
                    </td>
                    <td>
                        <input type="text" name="modele" value="<%= article.getModele() %> "/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="notes">Notes: </label>
                    </td>
                    <td>
                       <textarea name="notes" ><%= article.getNotes() %></textarea> 
                    </td>
                </tr>
            </table>
            <input type="submit" class="button" value="Modifier article"/>
                        </fieldset>
         </form>
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>
                 
    </body>
</html>
