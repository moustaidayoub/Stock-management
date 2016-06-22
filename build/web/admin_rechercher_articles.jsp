<%-- 
    Document   : admin_rechercher_articles
    Created on : 12 juin 2013, 22:38:42
    Author     : ayoub
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Metier.Article"%>
<%@page import="java.util.List"%>
<%@page import="Model.ArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>page de recherche articles pour admin</title>
    </head> 
    <body>
        <%  
        String critere=(String)request.getParameter("critere");
           String valeur1=(String)request.getParameter("rech1");
           String valeur2=(String)request.getParameter("rech2");
           String role=(String)session.getAttribute("role");
           ArticleHelper ah=new ArticleHelper();
           List<Article> listarticles=null;

          if(critere.equals("date"))
                             {
            listarticles=ah.getArticleByDate(valeur1,valeur2);
                       }
           else
                listarticles=ah.getArticleBy(critere,valeur1);
           %>
           <h3>Nombre d'Articles Trouvés : <%= listarticles.size() %></h3>
          <table class="data" >
            <TR class="data">
                         <th class="data"> Fournisseur</th>
                         <th class="data"> Matricule Utilisateur </th>
                         <th class="data"> Classe d'article</th>
                         <th class="data"> Num Serie</th>
                         <th class="data"> Marque</th>
                         <th class="data"> Modele </th>
                         <th class="data"> Date Livraison</th>
                         <th class="data"> Notes </th>
                         <th class="data"> Modification </th>
                         <th class="data"> Suppression </th>
                     </TR>
            <% for (int i=0;i<listarticles.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= listarticles.get(i).getFournisseur().getNomFournisseur() %></td>
                         <td class="data"><% if((listarticles.get(i).getUser())==null){ %> Aucun
                            <% } else { %> <%= listarticles.get(i).getUser().getMatUser() %> <% } %></td>
                         <td class="data"> <%= listarticles.get(i).getClasseArticle().getNomClasse() %> </td> 
                         <td class="data"> <%= listarticles.get(i).getNumSerie() %> </td>
                         <td class="data"> <%= listarticles.get(i).getMarque() %> </td>
                         <td class="data"> <%= listarticles.get(i).getModele() %> </td>
                         <td class="data"> <%= listarticles.get(i).getDateLivraison() %> </td>
                         <td class="data"> <%= listarticles.get(i).getNotes() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_article=<%= listarticles.get(i).getIdArticle() %>"  > Modifier  </a> </td>
                         <td class="data"> <a href="Servlet_controle?Servlet_supprimer_article=<%= listarticles.get(i).getIdArticle() %>" onclick="showConfirm()" > Supprimer </a> </td>
                     </TR>
                      <% } %>
                            
        </table>
       
    </body>
</html> 
