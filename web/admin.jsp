<%-- 
    Document   : admin
    Created on : 5 juin 2013, 13:13:37
    Author     : ayoub
--%>

<%@page import="Model.FournisseurHelper"%>
<%@page import="Model.ArticleHelper"%>
<%@page import="Model.UserHelper"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.Helper"%>
<%@page import="Metier.ClasseArticle"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page import="Metier.DemandeArticle"%>
<%@page import="Metier.Message"%>
<%@page import="java.util.List"%>
<%@page import="Model.DemandeHelper"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
       <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    </head>
     <% MessageHelper mh=new MessageHelper();
    DemandeHelper dh=new DemandeHelper();
    UserHelper uh=new UserHelper();
    ArticleHelper ah=new ArticleHelper();
    FournisseurHelper fh=new FournisseurHelper();
    ClasseArticleHelper cah=new ClasseArticleHelper();
    String mat=(String) session.getAttribute("matricule");
   List<Message> msg=(List<Message>)mh.MsgNonLusAdmin(); 
      List<Message> msgsrecus=(List<Message>)mh.MsgNonLusAdmin(); 
   List<DemandeArticle> demandes=(List<DemandeArticle>)dh.DemandesNonRepondusAdmin();
   List<ClasseArticle> classes=(List<ClasseArticle>) cah.getClassesCritiques(5);
    Calendar cal = Calendar.getInstance(); 
        int year=cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH)+1;
        int day=cal.get(Calendar.DAY_OF_MONTH);
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

<div id="wrapper">
	<div id="leftBar" class="notif">
	<ul >
            <li><a href="Servlet_controle?messages=recus">Messages</a><div id="num" style="margin-left:5px;"><%= msg.size() %></div></li>
		<li><a href="Servlet_controle?admin_espace_demandes=admin_demandes_non_repondus" >Demandes</a><div id="num" style="margin-left:3px;"><%= demandes.size() %></div></li>
		<li><a href="Servlet_controle?admin_gestion_stock=consulter_classes_articles" > Alertes</a><div id="num" style="margin-left:29px;"><%= classes.size() %></div></li> 
	</ul>
	</div>
	<div id="rightContent">
	<h3>Nous somme le, <%= day %>/<%= month %>/<%= year %></h3>
		<div class="shortcutHome">
		<a href="Servlet_controle?messages"><img src="css/img/messages.png"><br>Messagerie</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?admin_espace_demandes"><img src="css/img/demandes.png"><br>Espace Demandes</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?admin_gestion_utilisateurs"><img src="css/img/users.png"><br>Gestion Utilisateurs</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?admin_gestion_stock"><img src="css/img/stock.png"><br>Gestion Stock</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?Mon_compte"><img src="css/img/compte.png"><br>Mon Compte</a>
		</div>
		
		
		<div id="smallRight"><h3>Statistiques</h3>
		<table style="border: none;font-size: 12px;color: #5b5b5b;width: 100%;margin: 10px 0 10px 0;">
			<tr><td style="border: none;padding: 4px;">Nombre de messages reçus</td><td style="border: none;padding: 4px;"><b><%= mh.MsgsRecusAdmin().size() %></b></td></tr>
			<tr><td style="border: none;padding: 4px;">Nombre de demandes reçus</td><td style="border: none;padding: 4px;"><b><%= dh.DemandesRepondusAdmin().size()+dh.DemandesNonRepondusAdmin().size() %></b></td></tr> 
			<tr><td style="border: none;padding: 4px;">Nombre d'utilisateurs</td><td style="border: none;padding: 4px;"><b><%= uh.getUsers().size() %></b></td></tr>
			<tr><td style="border: none;padding: 4px;">Nombre d'articles en stock</td><td style="border: none;padding: 4px;"><b><%= ah.getArticles().size() %></b></td></tr> 
			<tr><td style="border: none;padding: 4px;">Nombre de fournisseurs</td><td style="border: none;padding: 4px;"><b><%= fh.getFournisseurs().size() %></b></td></tr> 
			<tr><td style="border: none;padding: 4px;">Nombre de classes d'articles</td><td style="border: none;padding: 4px;"><b><%= cah.getClasses().size() %></b></td></tr> 
			
                </table>
		</div>
                
		
	</div>
<div class="clear"></div>
<div id="footer">
	&copy; 2013 MOUSTAID AYOUB | Tel: <a >06 30 13 87 57</a> | Email: <a>moustaidayoubcanvas2012@gmail.com</a><br>
	GENIE LOGICIEL-EST SALE 
</div>
</div>
    </body>
</html>
    
