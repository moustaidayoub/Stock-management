<%-- 
    Document   : admin_modifier_utilisateur
    Created on : 7 juin 2013, 16:32:03
    Author     : ayoub
--%>

<%@page import="Metier.User"%>
<%@page import="Model.UserHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page modification utilisateur</title>
    </head>
    <body>
        <%  String matricule=request.getParameter("admin_modifier_utilisateur"); 
UserHelper uh=new UserHelper();
User user=uh.getUser(matricule);   
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
	   
<form method="POST" action="Servlet_controle?Servlet_modification_utilisateur=<%= user.getMatUser() %>">
            <fieldset>
                <legend><h2>Modifier Utilisateur</h2></legend>
                 <h1><small>Modifier les champs souhaités et valider en cliquant sur modifier utilisateur</small></h1>
            <table>
                 <tr>
                    <td>
                        <label for="matriculeuser">Matricule de l'utilisateur : </label>
                    </td>
                    <td>
                        <input type="text" name="matriculeuser" value="<%= user.getMatUser() %> "/>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <label for="nomuser">Nom de l'utilisateur: </label>
                    </td>
                    <td>
                       <input type="text" name="nomuser" value="<%= user.getNomUser() %>"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomuser">Prenom de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="prenomuser" value="<%= user.getPrenomUser() %>"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="posteuser">Poste de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="posteuser" value="<%= user.getPosteUser() %>"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="motdepasseuser">Mot de passe de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="motdepasseuser" value="<%= user.getPasswordUser() %>"/>
                    </td>
                </tr>
              
            </table>
            <input type="submit" class="button" value="Modifier Utilisateur"/>
                        </fieldset>
         </form> 
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>
                 


    </body>
</html>


    </body>
</html>

