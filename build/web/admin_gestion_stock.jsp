<%-- 
    Document   : admin_gestion_stock
    Created on : 5 juin 2013, 14:09:11
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Gestion Du Stock </title>
 <link rel="stylesheet" type="text/css" href="css/style.css" />  
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/jquery.main.js"></script> 
        <script type="text/javascript" src="js/jquery-1.7.2.js"></script> 
        <script type="text/javascript" src="js/sliding_effect.js"></script>  
     <script type="text/javascript" src="js/modernizr.custom.80028.js"></script>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png">
        <script>
        $(function() {
    var menu_ul = $('.menu > li > ul'),
        menu_a  = $('.menu > li > a');
    menu_ul.hide();
    menu_a.click(function(e) {
        e.preventDefault();
        if(!$(this).hasClass('active')) {
            menu_a.removeClass('active');
            menu_ul.filter(':visible').slideUp('normal');
            $(this).addClass('active').next().stop(true,true).slideDown('normal');
        } else {
            $(this).removeClass('active');
            $(this).next().stop(true,true).slideUp('normal');
        }
    });
});
</script>
    </head>
    <%! HttpSession session=null; %>
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
            <li class="item1"><a href="#">Gestion Articles</a>
            <ul>
                <li class="subitem1"><a href="Servlet_controle?admin_gestion_stock=ajouter_article">Ajouter Articles</a></li>
                <li class="subitem2"><a href="Servlet_controle?admin_gestion_stock=consulter_articles">Consulter Les Articles</a></li>
            </ul>
        </li>
        <li class="item2"><a href="#">Gestion Fournisseurs</a>
            <ul>
                <li class="subitem1"><a href="Servlet_controle?admin_gestion_stock=ajouter_fournisseur">Ajouter Fournisseurs</a></li>
                <li class="subitem2"><a href="Servlet_controle?admin_gestion_stock=consulter_fournisseurs">Consulter Les Fournisseurs</a></li>
            </ul>
        </li>
        <li class="item3"><a href="#">Gestion Classes </a>
            <ul>
                <li class="subitem1"><a href="Servlet_controle?admin_gestion_stock=ajouter_classe_article">Ajouter Classes</a></li>
                <li class="subitem2"><a href="Servlet_controle?admin_gestion_stock=consulter_classes_articles">Consulter Les Classes</a></li>
            </ul>
        </li>
        </ul>
	</div>
	</div>
            </div>
	<div id="rightContent">
            <a href="Servlet_controle?admin_accueil"><div id="img_retour"></div></a>
	<h6 style="margin-left:660px;">Accueil </h6>
	<h3 style="margin-top:-27px;">Gestion de Stock</h3>
     
        <section class="ac-container">
            <div>
                <input id="ac-1" name="accordion-1" type="radio" checked />
                <label for="ac-1"><center>Rechercher Articles</center></label>
                <article class="ac-small">
                    <div class="quoteOfDay" style="width:570px;margin-left:15px;">
                        <form method="POST" action="Servlet_controle?admin_gestion_stock=admin_rechercher_articles">
                            <table><tr>
                                    <td><select name="critere">
                                            <option value="user.matUser" onclick="document.getElementById('rech2').style.visibility='hidden';">Matricule</option>
                                            <option value="classeArticle.nomClasse" onclick="document.getElementById('rech2').style.visibility='hidden';">Classe</option>
                                            <option value="fournisseur.nomFournisseur" onclick="document.getElementById('rech2').style.visibility='hidden';">Fournisseur</option>
                                            <option value="numSerie" onclick="document.getElementById('rech2').style.visibility='hidden';">Num Serie</option>
                                            <option value="marque" onclick="document.getElementById('rech2').style.visibility='hidden';">Marque</option>
                                            <option value="modele" onclick="document.getElementById('rech2').style.visibility='hidden';">Modele</option>
                                            <option value="date" onclick="document.getElementById('rech2').style.visibility='';">Date</option>
                                            <option value="notes" onclick="document.getElementById('rech2').style.visibility='hidden';">Notes</option>
                                        </select></td>
                                    <td><input type="text" value="Entrez une valeur..." name="rech1" style="width:120px;" /></td>
                                    <td><input type="text" value="Entrez une valeur..." id="rech2" name="rech2" style="width:120px;visibility:hidden;"/></td>
                                    <td> <input type="submit" class="button" Value="Lancer la recherche" style="width:130px;" /></td>
                                </tr></table>
                        </form>
                    </div>	
                </article>
            </div>
            <div>
                <input id="ac-2" name="accordion-1" type="radio" />
                <label for="ac-2"><center>Rechercher Fournisseurs</center></label>
                <article class="ac-small">
                    <div class="quoteOfDay" style="width:570px;margin-left:15px;">
                        <form method="POST" action="Servlet_controle?admin_gestion_stock=admin_rechercher_fournisseur">
                            <table><tr>
                                    <td><select name="critere">
                                            <option value="nomFournisseur">nomFournisseur</option>
                                            <option value="adresseFournisseur">adresseFournisseur</option>
                                            <option value="telFournisseur">telFournisseur</option>
                                            <option value="emailFournisseur">emailFournisseur</option>
                                        </select></td>
                                    <td><input type="text" name="rech1" style="width:125px;"/></td>
                                    <td> <input type="submit" class="button" Value="Lancer la recherche"/></td>
                                </tr></table>
                        </form>
                    </div>	
                </article>
            </div>
            <div>
                <input id="ac-3" name="accordion-1" type="radio" />
                <label for="ac-3"><center>Rechercher Classes d'Articles</center></label>
                <article class="ac-small">
                    <div class="quoteOfDay" style="width:570px;margin-left:15px;">
                        <form name="form" method="POST" action="Servlet_controle?admin_gestion_stock=admin_rechercher_classe_article">
                            <table><tr>
                                    <td><select name="critere">
                                            <option value="nomClasse">Classe d'Article</option>
                                            <option value="quantite">Quantite d'Articles</option>
                                        </select></td>
                                    <td><input type="text" name="rech1" style="width:125px;"/></td>
                                    <td> <input type="submit" class="button" Value="Lancer la recherche"/></td>
                                </tr></table>
                        </form>
                    </div>     
                </article>
            </div>
                                    
        </section>
        <div id="include" style="width:666px; margin-left:30px;">  
        <center>
       <% if(request.getParameter("admin_gestion_stock").equals("ajouter_article")) {%>
        <jsp:include page="admin_ajouter_article.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("consulter_articles")) {%>
        <jsp:include page="admin_consulter_articles.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("ajouter_fournisseur")) {%>
        <jsp:include page="admin_ajouter_fournisseur.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("consulter_fournisseurs")) {%>
        <jsp:include page="admin_consulter_fournisseurs.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("ajouter_classe_article")) {%>
        <jsp:include page="admin_ajouter_classe_article.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("consulter_classes_articles")) {%>
        <jsp:include page="admin_consulter_classes_articles.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("admin_rechercher_articles")) {%>
        <jsp:include page="admin_rechercher_articles.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("admin_rechercher_classe_article")) {%>
        <jsp:include page="admin_rechercher_classe_article.jsp" /> 
        <% } %>
        <% if(request.getParameter("admin_gestion_stock").equals("admin_rechercher_fournisseur")) {%>
        <jsp:include page="admin_rechercher_fournisseur.jsp" /> 
        <% } %>
        </center>
        </div>
        </div>
		<div class="clear"></div>
		
		
	</div>
<div class="clear"></div>
    <center><div id="footer" >
	&copy; 2013 MOUSTAID AYOUB | Tel: <a >06 30 13 87 57</a> | Email: <a>moustaidayoubcanvas2012@gmail.com</a><br>
	GENIE LOGICIEL-EST SALE 
</div></center>
</div>
 <div id="note">
         <% if(request.getQueryString().contains("classe_supprimee"))
                                  { %>
    Classe Article supprimée avec succés 
        <%} %>
         <% if(request.getQueryString().contains("article_ajoute"))
                                  { %>
      Article ajouté avec succés 
        <%} %>
         <% if(request.getQueryString().contains("fournisseur_ajoute"))
                                  { %>
      Fournisseur ajouté avec succés 
        <%} %>
        <% if(request.getQueryString().contains("article_supprime"))
                                  { %>
      Article supprimé avec succés 
        <%} %>
          <% if(request.getQueryString().contains("article_modifie"))
                                  { %>
    Article modifié avec succés
        <%} %>
        <% if(request.getQueryString().contains("fournisseur_modifie"))
                                  { %>
   Fournisseur modifié avec succés 
        <%} %>
         <% if(request.getQueryString().contains("classe_article_ajoute"))
                                  { %>
    Classe article ajouté avec succés 
        <%} %>
         <% if(request.getQueryString().contains("classe_modifie"))
                                  { %>
    Classe article modifie avec succés 
        <%} %>
         <% if(request.getQueryString().contains("reponse_envoye"))
                                  { %>
    reponse envoyee avec succés 
        <%} %>
         <% if(request.getQueryString().contains("utilisateur_ajoute"))
                                  { %>
    Utilisateur ajouté avec succés 
        <%} %>
          <% if(request.getQueryString().contains("utilisateur_modifie"))
                                  { %>
    Utilisateur modifié avec succés 
        <%} %>
    </div>
    </body>
</html>
