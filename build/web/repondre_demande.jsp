<%-- 
    Document   : repondre_demande
    Created on : 10 juin 2013, 15:50:20
    Author     : ayoub
--%>

<%@page import="Model.DemandeHelper"%>
<%@page import="Metier.DemandeArticle"%>
<%@page import="Model.Helper"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Metier.ClasseArticle"%>
<%@page import="java.util.List"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Répondre Demande</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
         <% 
         DemandeHelper dh=new DemandeHelper();
         DemandeArticle dem=new DemandeArticle();
         dem=dh.getDemande(Long.decode(request.getParameter("repondre_demande")).longValue()); 
        %>
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
	 <form method="POST" action="Servlet_controle?Servlet_reponse_demande=<%=dem.getIdDemande()%>">
            <fieldset>
                <legend><h2>Réponse à Demande d'Article</h2></legend> 
                <h1><small> Completer le formulaire ci-dessous et cliquez sur envoyer réponse</small> </h1>
                <h2><small style="color:blue;">Il existe <%= dem.getClasseArticle().getQuantite()%> Article(s) de cette classe en stock</small></h2>
                <table>
                    <tr><td> DATE : </td><td><%= dem.getDateDemande() %> </td></tr>
                    <tr><td> UTILISATEUR : </td><td><%= dem.getUser().getMatUser() %> </td></tr>
                    <tr><td> CLASSE : </td><td><%= dem.getClasseArticle().getNomClasse() %> </td></tr>
                   <tr>
                        <td><label for="reponse">Reponse: </label>   </td>
                        <td><Select name="reponse" ><option>Accepter</option> <option>Refuser</option></select></td>
                    </tr>
                    <tr>
                        <td><label for="commentaire">Commentaire : </label></td>
                        <td><textarea name="commentaire" ></textarea></td>
                    </tr>
                
        </table>
                    <input type="submit" class="button" value="Envoyer Reponse"/>        
            </fieldset>
         
         </form>
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>
    
        
        
    </body>
</html>
