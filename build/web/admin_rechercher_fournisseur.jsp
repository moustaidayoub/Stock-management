<%-- 
    Document   : admin_rechercher_fournisseur
    Created on : 12 juin 2013, 22:50:06
    Author     : ayoub
--%>

<%@page import="Metier.Fournisseur"%>
<%@page import="java.util.List"%>
<%@page import="Model.FournisseurHelper"%>
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
           FournisseurHelper fh=new FournisseurHelper();
           List<Fournisseur> frns=null;
           frns=fh.getFournisseurBy(critere,valeur1);

           %>
      
          
     
           <h3>Nombre de Fournisseurs Trouvés : <%= frns.size() %></h3>
         <table class="data">
            <TR class="data">
                         <th class="data"> Nom Fournisseur</th>
                         <th class="data"> Adresse Fournisseur</th>
                         <th class="data"> Télephone Fournisseur</th>
                         <th class="data"> Email Fournisseur</th>
                         <th class="data"> Nombre d'Articles Fournis </th>
                         <th class="data"> Modification </th>
                     </TR>
            <% for (int i=0;i<frns.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= frns.get(i).getNomFournisseur() %></td>
                         <td class="data"> <%= frns.get(i).getAdresseFournisseur() %></td>
                         <td class="data"> <%= frns.get(i).getTelFournisseur() %> </td>
                         <td class="data"> <%= frns.get(i).getEmailFournisseur() %> </td>
                         <td class="data"> <%= frns.get(i).getArticles().size() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_fournisseur=<%= frns.get(i).getIdFournisseur() %>"  > Modifier  </a> </td>
                     </TR>
                          <% } %>
                            
        </table>
                
    </body>
</html> 
