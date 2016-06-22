<%-- 
    Document   : admin_rechercher_utilisateurs
    Created on : 12 juin 2013, 19:37:02
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
        <title>page de recherche utilisateur pour admin</title>
    </head> 
    <body>
        <%  
        String critere=(String)request.getParameter("critere");
           String valeur1=(String)request.getParameter("rech1");
           String role=(String)session.getAttribute("role");
           UserHelper uh=new UserHelper();
           List<User> listusers=null;
              listusers=uh.getUsersBy(critere,valeur1);
           %>
           <h3>Nombre d'Utilisateurs Trouvés : <%= listusers.size() %></h3>
         <table class="data"> 
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
            <% for (int i=0;i<listusers.size();i++)
                   { %>  
                   <tr class="data">  
                        <td class="data"> <%= listusers.get(i).getMatUser() %></td>
                         <td class="data"> <%= listusers.get(i).getNomUser() %></td>
                         <td class="data"> <%= listusers.get(i).getPrenomUser() %> </td>
                         <td class="data"> <%= listusers.get(i).getPosteUser() %> </td>
                         <td class="data"> <%= listusers.get(i).getPasswordUser() %> </td>
                         <td class="data"> <%= listusers.get(i).getDemandeArticles().size() %> </td>
                         <td class="data"> <%= listusers.get(i).getArticles().size() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_utilisateur=<%= listusers.get(i).getMatUser() %>"  > Modifier  </a> </td>
                         <td class="data"> <a href="Servlet_controle?messages=send&mat=<%= listusers.get(i).getMatUser() %>"  > Envoyer message  </a> </td>
                   
                   </tr>
                         <% } %>                
        </table>
    </body>
</html> 
