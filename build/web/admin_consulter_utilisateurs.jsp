<%-- 
    Document   : admin_consulter_utilisateurs
    Created on : 7 juin 2013, 16:05:19
    Author     : ayoub
--%>

<%@page import="Metier.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page Consultation utilisateurs</title>
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
        <% UserHelper uh=new UserHelper();
        List<User> user=(List<User>) uh.getUsers();
%>
        <h3>Consultation Utilisateurs</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
  <table id="tt" class="data">
            <TR class="data">
                         <th class="data"> Matricule Utilisateur</th>
                         <th class="data"> Nom Utilisateur</th>
                         <th class="data"> Prenom Utilisateur</th>
                         <th class="data"> Poste User</th>
                         <th class="data"> Mot de Passe User</th>
                         <th class="data"> Nombre de Demandes Envoyées</th>
                         <th class="data"> Nombre d'articles</th>
                         <th class="data"> Modification </th>
                         <th class="data"> Envoyer un message</th>
                     </TR>
            <% for (int i=0;i<user.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= user.get(i).getMatUser() %></td>
                         <td class="data"> <%= user.get(i).getNomUser() %></td>
                         <td class="data"> <%= user.get(i).getPrenomUser() %> </td>
                         <td class="data"> <%= user.get(i).getPosteUser() %> </td>
                         <td class="data"> <%= user.get(i).getPasswordUser() %> </td>
                         <td class="data"> <%= user.get(i).getDemandeArticles().size() %> </td>
                         <td class="data"> <%= user.get(i).getArticles().size() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_utilisateur=<%= user.get(i).getMatUser() %>"  > Modifier  </a> </td>
                         <td class="data"> <a href="Servlet_controle?messages=send&mat=<%= user.get(i).getMatUser() %>"  > Envoyer message  </a> </td>
                   
                     </TR>
                          <% } %>
                            
        </table>
    </body>
</html>


