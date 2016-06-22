<%-- 
    Document   : send_msg
    Created on : 5 juin 2013, 11:04:26
    Author     : ayoub
--%>

<%@page import="Metier.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserHelper"%>
<%@page import="Model.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Envoyer Message</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
   <%         Helper h=new Helper();  
   UserHelper uh=new UserHelper();
   List<User> users=null;
   String to=null;
              String role=(String)session.getAttribute("role");   
              if(role.equals("admin"))
                                   {
                  users=uh.getUsers();
                  to="user"; 
                                   }
              else
                  to="admin"; 
%>

               <form method="POST" action="Servlet_controle?Envoi_message">
                <fieldset> 
                <legend><h2>Envoi de Message</h2></legend>
                <h1><small> Completer le formulaire ci-dessous et cliquez sur envoyer message</small> </h1>
            <table>
                 <tr>
                    <td>
                        <label for="date">Date Message : </label>
                    </td>
                    <td>
                        <input type="text" name="date" value="<%= h.getDate().get(0) %>" disabled/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="matricule">Matricule Utilisateur: </label>
                    </td>
                    
                    <td>
                       <% if(request.getParameter("mat")!=null){ %>
                           <select name="matricule">
                               <option selected><%=request.getParameter("mat")%></option> 
                           </select>
                       <% } else { %>
                        <% if(role.equals("user")) { %>
                        <input type="text" name="matricule" value="<%= session.getAttribute("matricule") %> " disabled/>
                    <% } else { %>
                    <select name="matricule">
                        <option selected><%= users.get(0).getMatUser() %> </option>
                        <% for(int i=1;i<users.size();i++){ %>
                        <option><%= users.get(i).getMatUser() %></option>
                        <% } %>
                    </select> 
                    <% }} %>
                    </td>
                </tr>
                    <tr>
                    <td>
                        <label for="msgto">Message To: </label>
                    </td>
                    <td>
                        
                        <input type="text" name="msgto" value="<%=to%>" disabled />
                    </td>
                </tr>  
                    <tr>
                    <td>
                        <label for="objet">Objet Message: </label>
                    </td>
                    <td>
                        <input type="text" name="objet" />
                    </td>
                </tr>
                    <tr>
                    <td>
                        <label for="msg">Message : </label>
                    </td>
                    <td>
                        <textarea name="msg" ></textarea>
                    </td>
                </tr>
            </table>
            <input type="submit" class="button" value="Envoyer Message"/>
                        </fieldset>
         </form>
    </body>
</html>
