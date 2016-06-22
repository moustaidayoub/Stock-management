<%-- 
    Document   : admin_modifier_classe_article
    Created on : 7 juin 2013, 11:23:27
    Author     : ayoub
--%>

<%@page import="Metier.ClasseArticle"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page import="Metier.Fournisseur"%>
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
        <%  Long idclasse=(Long.decode(request.getParameter("admin_modifier_classe_article")).longValue()); 
ClasseArticleHelper cah=new ClasseArticleHelper();
ClasseArticle classe=cah.getClasse(idclasse);   
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
	 <form method="POST" action="Servlet_controle?Servlet_modification_classe_article=<%= classe.getIdClasse() %>">
           <fieldset>
                <legend><h2>Modifier Classe Articles</h2></legend>
                <h1><small>Modifier les champs souhaités et valider en cliquant sur modifier classe</small></h1>
            <table>
                <tr>
                    <td>
                        <label for="idclasse">Id du Classe : </label>
                    </td>
                    <td>
                        <input type="text" name="idclasse" value="<%= classe.getIdClasse() %> " disabled/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="nomclasse">Nom du Classe : </label>
                    </td>
                    <td>
                        <input type="text" name="nomclasse" value="<%= classe.getNomClasse() %> " />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="quanite">Quantité en Stock : </label>
                    </td>
                    <td>
                        <input type="text" name="quantite" value="<%= classe.getQuantite() %> " disabled/>
                    </td>
                </tr>
                  
              
            </table>
            <input type="submit" class="button" value="Modifier Classe"/>
                        </fieldset>
         </form>
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>
                      

    </body>
</html>


