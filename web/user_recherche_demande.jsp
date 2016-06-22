<%-- 
    Document   : user_recherche_demande
    Created on : 12 juin 2013, 15:33:20
    Author     : ayoub
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Metier.DemandeArticle"%>
<%@page import="java.util.List"%>
<%@page import="Model.DemandeHelper"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>page de recherche demande pour user</title>
    </head> 
    <body>
         <%  
        String critere=(String)request.getParameter("critere");
           String valeur1=(String)request.getParameter("rech1");
           String valeur2=(String)request.getParameter("rech2"); 
           String role=(String)session.getAttribute("role");
           String mat=(String)session.getAttribute("matricule");
           DemandeHelper dh=new DemandeHelper();
           List<DemandeArticle> listdem=null;
 
           if(critere.equals("date"))
           { 
              listdem=dh.UserDemandesByDate(mat,valeur1,valeur2);  
            }
             else
              listdem=dh.UserDemandesBy(mat,critere,valeur1); 
                
          
           %>  
    
           <h3>Nombre de Demandes Trouvés :<%= listdem.size() %></h3>
         <table class="data"> 
            <TR class="data"> 
                         <th class="data">Mat user</th>
                         <th class="data"> Classe</th>
                         <th class="data"> Date Demande</th>
                         <th class="data"> Reponse</th> 
                         <th class="data"> Commentaire</th>
                         <th class="data"> Etat</th>
                         <th class="data"> Détails </th>
                     </TR>
            <% for (int i=0;i<listdem.size();i++)
                   { %>  
                     <TR class="data">
                         <td class="data"> <%= listdem.get(i).getUser().getMatUser() %> </td> 
               <td class="data"> <%= listdem.get(i).getClasseArticle().getIdClasse() %>:<%= listdem.get(i).getClasseArticle().getNomClasse() %></td>
                         <td class="data"> <%= listdem.get(i).getDateDemande() %></td> 
                         <td class="data"> <%= listdem.get(i).getReponse() %></td>
                         <td class="data"> <%= listdem.get(i).getCommentaireReponse() %></td>
                         <td class="data">
                             <% if(listdem.get(i).getReponse()==null) { %>
                             Non Répondue
                             <% } else { %>
                             Répondue
                             <% } %>
                         </td>
                          <td class="data"> <a href="Servlet_controle?details_dem=<%= listdem.get(i).getIdDemande() %>" > Détails...  </a> </td>
                       </TR>
                         <% } %>                
        </table>
    </body>
</html> 
