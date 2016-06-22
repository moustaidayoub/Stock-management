<%-- 
    Document   : admin_rechercher_classe_article
    Created on : 12 juin 2013, 22:54:20
    Author     : ayoub
--%>

<%@page import="Metier.ClasseArticle"%>
<%@page import="java.util.List"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>page de recherche utilisateur pour admin</title>
    </head> 
    <body>
        <%  
        String critere=(String)request.getParameter("critere");
           String valeur1=(String)request.getParameter("rech1");
           String role=(String)session.getAttribute("role");
           List<ClasseArticle> classes=null;
           ClasseArticleHelper cah=null;
           cah=new ClasseArticleHelper();
           classes=cah.getClasseBy(critere,valeur1);
                      
           %>
           
           <h3>Nombre de Classes d'Articles Trouvées : <%= classes.size() %></h3>
         <table class="data">
            <TR class="data">
                         <th class="data"> Id Classe</th>
                         <th class="data"> Nom Classe</th>
                         <th class="data"> Quantité en Stock</th>
                         <th class="data"> Modification</th>
                     </TR>
            <% for (int i=0;i<classes.size();i++)
                   { %>
                    <% if(classes.get(i).getQuantite()<5){ %> 
                    <TR class="data" style="background-color:#ff6666">
                       <td class="data"> <%= classes.get(i).getIdClasse() %></td>
                         <td class="data"> <%= classes.get(i).getNomClasse() %></td>
                        <td class="data"> <%= classes.get(i).getQuantite() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_classe_article=<%= classes.get(i).getIdClasse() %>"  > Modifier  </a> </td> 
                   </tr><% }else { %>
                       <TR class="data">
                           <td class="data"> <%= classes.get(i).getIdClasse() %></td>
                         <td class="data"> <%= classes.get(i).getNomClasse() %></td>
                        <td class="data"> <%= classes.get(i).getQuantite() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_classe_article=<%= classes.get(i).getIdClasse() %>"  > Modifier  </a> </td> 
                        </tr>  
                           <% }} %>
                           
        </table>
                       
    </body>
</html> 
