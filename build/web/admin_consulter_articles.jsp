<%-- 
    Document   : admin_consulter_articles
    Created on : 6 juin 2013, 10:41:20
    Author     : ayoub
--%>

<%@page import="Metier.Article"%>
<%@page import="java.util.List"%>
<%@page import="Model.ArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <script type="text/javascript">
           
            function showPrompt()
            {
                
               var fournisseur=prompt("Identification, veuillez saisir votre prenom","mon prenom");   
            }
            function op(){
 
window.open('admin_modifier_article.jsp', "compare", "height=440,width=640,menubar='no',toolbar='no',location='no',status='no',scrollbars='no'" );
}
function generateexcel() {
  var table= document.getElementById('tt');
  var html = table.outerHTML;
  window.open('data:application/vnd.ms-excel,' + escape(html));
}
function printDiv()
{
  var divToPrint=document.getElementById('tt');
  newWin= window.open("");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}

        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page Consultation articles</title>
    </head>
    <body>
         <%! HttpSession session=null; %>
        <% ArticleHelper ah=new ArticleHelper();
        List<Article> articles=(List<Article>) ah.getArticles();
%>
        <h3>Consultation Articles</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
  <table id="tt" class="data">
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
            <% for (int i=0;i<articles.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= articles.get(i).getFournisseur().getNomFournisseur() %></td>
                         <td class="data"><% if((articles.get(i).getUser())==null){ %> Aucun
                            <% } else { %> <%= articles.get(i).getUser().getMatUser() %> <% } %></td>
                         <td class="data"> <%= articles.get(i).getClasseArticle().getNomClasse() %> </td> 
                         <td class="data" class="data"> <%= articles.get(i).getNumSerie() %> </td>
                         <td class="data"> <%= articles.get(i).getMarque() %> </td>
                         <td class="data"> <%= articles.get(i).getModele() %> </td>
                         <td class="data"> <%= articles.get(i).getDateLivraison() %> </td>
                         <td class="data"> <%= articles.get(i).getNotes() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_article=<%= articles.get(i).getIdArticle() %>"  > Modifier  </a> </td>
                         <td class="data"> <a href="Servlet_controle?Servlet_supprimer_article=<%= articles.get(i).getIdArticle() %>" > Supprimer </a> </td>
                     </TR>
                          <% } %>
                            
        </table>
                        
    </body>
</html>

