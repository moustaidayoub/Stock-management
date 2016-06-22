<%-- 
    Document   : user
    Created on : 30 mai 2013, 11:49:40
    Author     : ayoub
--%>

<%@page import="java.util.Calendar"%>
<%@page import="Model.Helper"%>
<%@page import="Model.DemandeHelper"%>
<%@page import="Metier.DemandeArticle"%>
<%@page import="Metier.Message"%>
<%@page import="java.util.List"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! HttpSession session=null; %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page user</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css">
        
    </head>
        <% MessageHelper mh=new MessageHelper();
    DemandeHelper dh=new DemandeHelper();
    String mat=(String) session.getAttribute("matricule");
   List<Message> msg=(List<Message>)mh.MsgNonLusUser(mat); 
   List<DemandeArticle> demande=(List<DemandeArticle>)dh.DemandesNonVues(mat);
   Calendar cal = Calendar.getInstance(); 
        int year=cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH)+1;
        int day=cal.get(Calendar.DAY_OF_MONTH);

%>
    <body>
        <div id="header">
	<div class="inHeader">
		<div class="mosAdmin">
		Bonjour, <b><%= session.getAttribute("nom") %> <%= session.getAttribute("prenom") %></b><br>
		<%= session.getAttribute("role")%> | <a href="Servlet_controle?logout">Se Déconnecter</a>
		</div>
	<div class="clear"></div>
	</div>
</div>

<div id="wrapper">
	<div id="leftBar" class="notif">
	<ul>
            <li><a href="Servlet_controle?messages=recus">Messages</a><div id="num" style="margin-left:5px;"><%= msg.size() %></div></li>
            <li><a href="Servlet_controle?user_espace_demandes=user_demandes_repondus" >Demandes</a><div id="num" style="margin-left:3px;"><%= demande.size() %></div></li>       
        </ul>
	</div>
	<div id="rightContent">
	<h3>Nous somme le, <%= day %>/<%= month %>/<%= year %></h3>
		<div class="shortcutHome" >
		<a href="Servlet_controle?messages" style="width:120px;margin-left:55px;"><img src="css/img/messages.png"><br>Messagerie</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?user_espace_demandes" style="width:120px;margin-left:55px;"><img src="css/img/demandes.png"><br>Espace Demandes</a>
		</div>
		<div class="shortcutHome">
		<a href="Servlet_controle?Mon_compte" style="width:120px;margin-left:55px;"><img src="css/img/compte.png"><br>Mon Compte</a>
		</div>
		
		
		<div id="smallRight"><h3>Statistiques</h3>
		<table style="border: none;font-size: 12px;color: #5b5b5b;width: 100%;margin: 10px 0 10px 0;">
			<tr><td style="border: none;padding: 4px;">Nombre de messages reçus</td><td style="border: none;padding: 4px;"><b><%= mh.MsgsRecusUser(mat).size() %></b></td></tr>
			<tr><td style="border: none;padding: 4px;">Nombre de messages envoyés</td><td style="border: none;padding: 4px;"><b><%= mh.MsgEnvoyesUser(mat).size() %></b></td></tr>
			<tr><td style="border: none;padding: 4px;">Nombre de demandes envoyées</td><td style="border: none;padding: 4px;"><b><%= dh.DemandesRepondus(mat).size()+dh.DemandesNonRepondus(mat).size() %></b></td></tr>
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
