<%-- 
    Document   : recherche
    Created on : 13 juin 2013, 12:29:32
    Author     : ayoub
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Metier.Message"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>JSP Page</title>
    </head> 
    <body>
        <%  
           String critere=(String)request.getParameter("critere");
           String valeur1=(String)request.getParameter("rech1");
           String valeur2=(String)request.getParameter("rech2"); 
           String role=(String)session.getAttribute("role");
           String mat=(String)session.getAttribute("matricule");
           MessageHelper mh=new MessageHelper();
           List<Message> listmsg=null;
     
          if(critere.equals("date"))
           {
               if(role.equals("admin"))
           listmsg=mh.MsgByDate(valeur1,valeur2);
               else 
                   listmsg=mh.UserMsgByDate(mat,valeur1,valeur2);
            }
           else
            {
          if(role.equals("admin"))
           listmsg=mh.MsgBy(critere,valeur1);
               else
           listmsg=mh.UserMsgBy(mat,critere,valeur1);
           }
            
           %>
           <h3>Nombre de Messages Trouvés : <%= listmsg.size() %></h3>
         <table class="data"> 
            <TR class="data"> 
                         <th class="data"> Matricule Utilisateur</th>
                         <th class="data"> Date</th>
                         <th class="data"> Objet</th>
                         <th class="data"> Etat </th>
                         <th class="data"> Lecture </th>
                     </TR>
            <% for (int i=0;i<listmsg.size();i++)
                   { if(listmsg.get(i).isMsgVue()==false && listmsg.get(i).getMsgTo().equals(role)){ %>
                     <TR class="data" style="background-color:#ffff66;">
                         <td class="data">  
                           <%= listmsg.get(i).getUser().getMatUser() %>
                         </td>
                         <td class="data"> <%= listmsg.get(i).getDateMsg() %></td>
                         <td class="data"> <%= listmsg.get(i).getObjetMsg() %></td>
                         <td class="data">
                             <% if(listmsg.get(i).getMsgTo().equals(role)) { %>
                             Reçu
                             <% } else { %>
                             Envoyé
                             <% } %>
                         </td>
                         <td class="data"> <a href="Servlet_controle?Servlet_set_msg_lus=<%= listmsg.get(i).getIdMsg() %>" > lire le message  </a> </td>
                     </TR>
                        <% } else { %>  
                     <TR class="data">
                         <td class="data">  
                           <%= listmsg.get(i).getUser().getMatUser() %>
                         </td>
                         <td class="data"> <%= listmsg.get(i).getDateMsg() %></td>
                         <td class="data"> <%= listmsg.get(i).getObjetMsg() %></td>
                         <td class="data">
                             <% if(listmsg.get(i).getMsgTo().equals(role)) { %>
                             Reçu
                             <% } else { %>
                             Envoyé
                             <% } %>
                         </td>
                         <td class="data"> <a href="Servlet_controle?Servlet_set_msg_lus=<%= listmsg.get(i).getIdMsg() %>" > lire le message  </a> </td>
                     </TR>
                         <% }} %>                
        </table>
    </body>
</html> 
