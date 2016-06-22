<%-- 
    Document   : Espace_demandes
    Created on : 5 juin 2013, 12:15:28
    Author     : ayoub
--%>

<%@page import="Metier.DemandeArticle"%>
<%@page import="Model.DemandeHelper"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! HttpSession session=null; %>
        <% DemandeHelper dh=new DemandeHelper();
        String mat=(String)session.getAttribute("matricule");
        List<DemandeArticle> demvus=(List<DemandeArticle>) dh.DemandesVues(mat);
        List<DemandeArticle> demnonvus=(List<DemandeArticle>) dh.DemandesNonVues(mat);
        List<DemandeArticle> demnonrep=(List<DemandeArticle>) dh.DemandesNonRepondus(mat);
%>      
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/jquery-ui.css" />
        <script src="js/jquery-1.9.1.js"></script> 
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.lightbox_me.js"></script> 
        <script type="text/javascript" src="js/jquery-ui-1.7.2.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>  
        <script type="text/javascript" src="js/sliding_effect.js"></script>  
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <script type="text/javascript" src="js/modernizr.custom.80028.js"></script>
        
        <title>Espace demandes</title>
    </head>
    <body>
       
<form method="post" name="envoieMail" action="" enctype="text/plain"> 
<input type="hidden" name="body" value=""> 
</form>
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
            <li class="item1"><a href="Servlet_controle?user_espace_demandes=envoyer_demande" style="text-indent: 0.4em;">Envoyer Une Demande</a></li>
            <li class="item2"><a href="Servlet_controle?user_espace_demandes=user_demandes_repondus" style="text-indent: 0.4em;">Demandes Répondues<span><%= demnonvus.size()%>/<%= demnonvus.size()+demvus.size() %></span></a></li>
        <li class="item3" ><a href="Servlet_controle?user_espace_demandes=user_demandes_non_repondus" style="text-indent: 0.4em;" >Demandes Non Rép.<span><%= demnonrep.size() %></span></a></li>
        </ul>
	</div>
	</div>
        </div>
	<div id="rightContent">
            <a href="Servlet_controle?user_accueil"><div id="img_retour"></div></a>
	<h6 style="margin-left:660px;">Accueil </h6>
	<h3 style="margin-top:-27px;">Demandes</h3>
        
	<div class="quoteOfDay">
             <form method="POST" action="Servlet_controle?user_espace_demandes=user_recherche_demande">
	<table><tr>
	<td><select name="critere">
              
                    <option value="classeArticle.nomClasse" onclick="document.getElementById('rech2').style.visibility='hidden';">Classe</option>
                    <option value="date" onclick="document.getElementById('rech2').style.visibility='';">Date</option>
                    <option value="reponse" onclick="document.getElementById('rech2').style.visibility='hidden';">Réponse</option>
                    <option value="commentaireReponse" onclick="document.getElementById('rech2').style.visibility='hidden';">Commentaire</option>
	</select></td>
			<td><input type="text" value="Entrez une valeur..." name="rech1" id="datepicker" style="width:125px;"/></td>
                       <td><input type="text" value="Entrez une valeur..." id="rech2" name="rech2" style="width:125px;visibility:hidden;"/></td>
                       <td> <input type="submit" Value="Lancer la recherche"/></td>
   	</tr></table>
            </form>
	</div>	
                  
                
        <div id="include">
            <center>
        <% if(request.getParameter("user_espace_demandes").equals("user_demandes_repondus")) {%>
        <jsp:include page="user_demandes_repondus.jsp" /> 
        <% } %>
        <% if(request.getParameter("user_espace_demandes").equals("user_demandes_non_repondus")) {%>
        <jsp:include page="user_demandes_non_repondus.jsp" /> 
        <% } %>
        <% if(request.getParameter("user_espace_demandes").equals("envoyer_demande")) {%>
        <jsp:include page="envoyer_demande.jsp" /> 
        <% } %>
        <% if(request.getParameter("user_espace_demandes").equals("user_recherche_demande")) {%>
        <jsp:include page="user_recherche_demande.jsp" /> 
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
        
        <% if(request.getParameter("user_espace_demandes").equals("demande_envoyee"))
                                  { %>	
    <div id="note">
        Votre demande a été envoyée
    </div>
        <%} %> 
      
     
     </body>
</html>

        