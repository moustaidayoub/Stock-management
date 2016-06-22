<%-- 
    Document   : admin_demandes_repondus
    Created on : 10 juin 2013, 14:19:25
    Author     : ayoub
--%>
<%@page import="Model.DemandeHelper" %>
<%@page import="Metier.DemandeArticle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Demandes répondues</title>
        <script type="text/javascript">          
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
}</script>
    </head>
    <body>
        <%! HttpSession session=null; %>
        <% DemandeHelper dh=new DemandeHelper();
List<DemandeArticle> demrep=(List<DemandeArticle>) dh.DemandesRepondusAdmin();
%>
        <h3>Demandes Répondues (<%= demrep.size() %>)</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
        <table id="tt" class="data">
            <TR class="data">
                         <th class="data"> Date</th>
                         <th class="data"> Classe Article </th>
                         <th class="data"> Reponse</th>
                         <th class="data"> Détails </th>
                     </TR>
            <% for (int i=0;i<demrep.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= demrep.get(i).getDateDemande() %></td>
                         <td class="data"> <%= demrep.get(i).getClasseArticle().getNomClasse() %></td>
                         <td class="data"> <%= demrep.get(i).getReponse() %></td>
                         <td class="data"> <a href="Servlet_controle?details_dem=<%= demrep.get(i).getIdDemande() %>" > Détails...  </a> </td>
                     </TR>
                          <% } %>             
        </table>
    </body>
</html>
