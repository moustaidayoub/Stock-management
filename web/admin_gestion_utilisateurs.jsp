<%-- 
    Document   : admin_gestion_utilisateurs
    Created on : 7 juin 2013, 14:06:02
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
         <link rel="stylesheet" type="text/css" href="css/style.css" />  
        <script type="text/javascript" src="js/jquery.js"></script>  
        <script type="text/javascript" src="js/sliding_effect.js"></script>  
<script type="text/javascript" src="js/modernizr.custom.80028.js"></script>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Page Gestion Utilisateurs</title>
    </head>
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
<div id="wrapper">
	<div id="leftBar">
                         <div id="ctrl">
	<div id="div_menu">
	<ul class="menu">
            <li class="item1"><a>Gestion Utilisateurs</a>
            <ul>
                <li class="subitem1"><a href="Servlet_controle?admin_gestion_utilisateurs=ajouter_utilisateur">Ajouter Utilisateurs</a></li>
                <li class="subitem2"><a href="Servlet_controle?admin_gestion_utilisateurs=consulter_utilisateurs">Consulter Les Utilisateurs</a></li>
            </ul>
            </li>
        </ul>
	</div>
	</div>
       
              
        </div>
	<div id="rightContent">
              <a href="Servlet_controle?admin_accueil"><div id="img_retour"></div></a>
	<h6 style="margin-left:660px;">Accueil </h6>
	<h3 style="margin-top:-27px;">Gestion des utilisateurs</h3>
	<div class="quoteOfDay">
             <form method="POST" action="Servlet_controle?admin_gestion_utilisateurs=admin_rechercher_utilisateurs">
	<table><tr>
	<td><select name="critere">
                    <option value="matUser">Matricule</option>
                    <option value="nomUser">Nom</option>
                    <option value="prenomUser">Prenom</option>
                    <option value="posteUser">Poste</option>		
	</select></td>
			<td><input type="text" value="Entrez une valeur..." name="rech1" style="width:125px;"/></td>
			<td> <input type="submit" class="button" Value="Lancer la recherche"/></td>
	</tr></table>
            </form>
	</div>	
        <div id="include">
        <center>
         <% if(request.getParameter("admin_gestion_utilisateurs").equals("ajouter_utilisateur")) {%>
        <jsp:include page="admin_ajouter_utilisateur.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_utilisateurs").equals("consulter_utilisateurs")) {%>
        <jsp:include page="admin_consulter_utilisateurs.jsp" /> 
        <% } %>
         <% if(request.getParameter("admin_gestion_utilisateurs").equals("admin_rechercher_utilisateurs")) {%>
        <jsp:include page="admin_rechercher_utilisateurs.jsp" /> 
        <% } %>
        </center>
        </div>
		<div class="clear"></div>
		
		
	</div>
<div class="clear"></div>
<div id="footer">
	&copy; 2013 MOUSTAID AYOUB | Tel: <a >06 30 13 87 57</a> | Email: <a>moustaidayoubcanvas2012@gmail.com</a><br>
	GENIE LOGICIEL-EST SALE 
</div>
</div>
        <div id="note">
         <% if(request.getQueryString().contains("utilisateur_ajoute"))
                                  { %>
       Utilisateur ajouté avec succés 
        <%} %>
          <% if(request.getQueryString().contains("utilisateur_modifie"))
                                  { %>
     Utilisateur modifié avec succés 
        <%} %> </div>
        <div id="note" style="background:red;">  
        <% if(request.getQueryString().contains("utilisateur_null"))
                                  { %>
     Veuillez remplir le champ de matricule !
        <%} %>
        <% if(request.getQueryString().contains("utilisateur_existe"))
                                  { %>
     Matricule existe deja !
        <%} %>
        </div>
   
    </body>
</html>
