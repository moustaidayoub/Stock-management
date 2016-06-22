<%-- 
    Document   : admin_espace_demandes
    Created on : 10 juin 2013, 14:44:00
    Author     : ayoub
--%>

<%@page import="Metier.DemandeArticle"%>
<%@page import="Model.DemandeHelper"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! HttpSession session=null; %>
        <% DemandeHelper dh=new DemandeHelper();
        List<DemandeArticle> demrep=(List<DemandeArticle>) dh.DemandesRepondusAdmin();
        List<DemandeArticle> demnonrep=(List<DemandeArticle>) dh.DemandesNonRepondusAdmin();
%>      
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.js"></script>  
        <script type="text/javascript" src="js/sliding_effect.js"></script>  
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Espace demandes</title>
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
        <li class="item2"><a href="Servlet_controle?admin_espace_demandes=admin_demandes_repondus" style="text-indent: 0.4em;">Demandes Répondues<span><%= demrep.size()%></span></a></li>
        <li class="item3" ><a href="Servlet_controle?admin_espace_demandes=admin_demandes_non_repondus" style="text-indent: 0.4em;" >Demandes Non Rép.<span><%= demnonrep.size() %></span></a></li>
        </ul>
	</div>
	</div>
        </div>
	<div id="rightContent">
            <a href="Servlet_controle?admin_accueil"><div id="img_retour"></div></a>
	<h6 style="margin-left:660px;">Accueil </h6>
	<h3 style="margin-top:-27px;">Demandes</h3>
	<div class="quoteOfDay">
             <form method="POST" action="Servlet_controle?admin_espace_demandes=admin_recherche_demande">
	<table><tr>
	<td><select name="critere">
                    <option value="user.matUser" onclick="document.getElementById('rech2').style.visibility='hidden';">Matricule</option>
                    <option value="classeArticle.nomClasse" onclick="document.getElementById('rech2').style.visibility='hidden';">Classe</option>
                    <option value="date" onclick="document.getElementById('rech2').style.visibility='';">Date</option>
                    <option value="reponse" onclick="document.getElementById('rech2').style.visibility='hidden';">Reponse</option>
                    <option value="commentaireReponse" onclick="document.getElementById('rech2').style.visibility='hidden';">Commentaire</option>
	</select></td>
			<td><input type="text" value="Entrez une valeur..." name="rech1" style="width:125px;"/></td>
                       <td><input type="text" value="Entrez une valeur..." id="rech2" name="rech2" style="width:125px;visibility:hidden;"/></td>
			<td> <input type="submit" Value="Lancer la recherche"/></td>
	</tr></table>
            </form>
	</div>
        <center>
        <% if(request.getParameter("admin_espace_demandes").equals("admin_demandes_repondus")) {%>
        <jsp:include page="admin_demandes_repondus.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_espace_demandes").equals("admin_demandes_non_repondus")) {%>
        <jsp:include page="admin_demandes_non_repondus.jsp" /> 
        <% } %>
         <% if(request.getParameter("admin_espace_demandes").equals("admin_recherche_demande")) {%>
        <jsp:include page="admin_recherche_demande.jsp" /> 
        <% } %>
        </center>
		<div class="clear"></div>
                
	</div>
<div class="clear"></div>
<div id="footer">
	&copy; 2013 MOUSTAID AYOUB | Tel: <a >06 30 13 87 57</a> | Email: <a>moustaidayoubcanvas2012@gmail.com</a><br>
	GENIE LOGICIEL-EST SALE 
</div>
</div>
       
    <% if(request.getParameter("admin_espace_demandes").equals("reponse_envoyee"))
                                  { %>
     <div id="note">
        Votre reponse a été envoyée
    </div>
        <%} %> 
       
    </body>
</html>

        