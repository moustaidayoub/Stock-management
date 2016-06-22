<%-- 
    Document   : admin_modifier_fournisseur
    Created on : 7 juin 2013, 10:42:48
    Author     : ayoub
--%>

<%@page import="Metier.Fournisseur"%>
<%@page import="Model.FournisseurHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page modification article</title>
    </head>
    <body>
        <%  Long idfournisseur=(Long.decode(request.getParameter("admin_modifier_fournisseur")).longValue()); 
FournisseurHelper fh=new FournisseurHelper();
Fournisseur frn=fh.getFournisseur(idfournisseur);   
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
	   <form method="POST" action="Servlet_controle?Servlet_modification_fournisseur=<%= frn.getIdFournisseur() %>">
           <fieldset>
                <legend><h2>Modifier Fournisseur</h2></legend>
                <h1><small>Modifier les champs souhaités et valider en cliquant sur modifier fournisseur</small></h1>
            <table>
                <tr>
                    <td>
                        <label for="id">Id du Frounisseur : </label>
                    </td>
                    <td>
                        <input type="text" name="id" value="<%= frn.getIdFournisseur() %>" disabled/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="nom">Nom du Frounisseur : </label>
                    </td>
                    <td>
                        <input type="text" name="nom" value="<%= frn.getNomFournisseur() %>" />
                    </td>
                </tr>
                  <tr>
                    <td>
                        <label for="adresse">Adresse du Fournisseur: </label>
                    </td>
                    <td>
                       <textarea name="adresse" ><%= frn.getAdresseFournisseur() %></textarea> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="tel">Télephone du Founisseur: </label>
                    </td>
                    <td>
                        <input type="text" name="tel" value="<%= frn.getTelFournisseur() %> "/>
                    </td>
                </tr>
                <tr> 
                    <td>
                        <label for="email">E-mail du Fournisseur: </label>
                    </td>
                    <td>
                        <input type="text" name="email" value=" <%= frn.getEmailFournisseur() %> "/>
                    </td>
                </tr>
              
            </table>
            <input type="submit" class="button" value="Modifier Fournisseur"/>
                        </fieldset>
         </form>
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>

                 
    </body>
</html>


