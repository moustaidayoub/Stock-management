<%-- 
    Document   : admin_consulter_classes_articles
    Created on : 7 juin 2013, 11:18:40
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
        <title>Page Consultation fournisseurs</title>
        <script type="text/javascript">
            function showConfirm()
            {
                confirm("Continuer l'operation de suppression ?");  
            }   
            function showAlert()
            {
                alert("Vous ne pouvez pas supprimer une classe qui contient des articles !! ");  
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
    </head>
    <body>
         <%! HttpSession session=null; %>
        <% ClasseArticleHelper cah=new ClasseArticleHelper();
        List<ClasseArticle> classes=(List<ClasseArticle>) cah.getClasses();
%>
        <h3>Consultation Classes d'Articles</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
  <table id="tt" class="data">
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
                   </tr> <% }else { %>
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



