<%-- 
    Document   : Mon_compte
    Created on : 5 juin 2013, 12:50:50
    Author     : ayoub
--%>

<%@page import="Metier.Admin"%>
<%@page import="Model.AdminHelper"%>
<%@page import="Metier.User"%>
<%@page import="Model.UserHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! HttpSession session=null; %>
<%  
String mat=(String) session.getAttribute("matricule");
String role=(String) session.getAttribute("role");
AdminHelper adminh=null;
UserHelper uh=null;
Admin admin=null;
User user=null;
   if(role.equals("admin"))
             {
       adminh=new AdminHelper();
       admin=adminh.getAdmin(mat);
             }
   else 
            { 
       uh=new UserHelper();
       user=uh.getUser(mat);
            }
%>
<html>
    <head>
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mon compte</title>
    </head>
    <body>
        <div id="header">
	<div class="inHeader">
		<div class="mosAdmin">
		Bonjour, <%= session.getAttribute("nom") %> <%= session.getAttribute("prenom") %><br>
		<%= session.getAttribute("role")%> | <a href="Servlet_controle?logout">Se Déconnecter</a>
		</div>
	<div class="clear"></div>
	</div>
</div>
   
	<div id="rightContent" style="margin-right:375px">
            <center>
            <fieldset>
                
                <% if(role.equals("user")) { %>
                <div id="compte_user"></div>
                <% }else{ %>
                <div id="compte_admin"></div>
                <% } %>
                <legend><h2>Mon Compte</h2></legend> 
                <a onclick="printDiv();"><div id="print" style="margin:0px;"></div></a>
                <table id="tt">
                    <% if(role.equals("user")) { %>
                    <tr><td> Matricule : </td><td><%= user.getMatUser() %> </td></tr>
                    <tr><td> Nom : </td><td><%= user.getNomUser() %> </td></tr>
                    <tr><td> Prenom : </td><td><%= user.getPrenomUser() %> </td></tr>
                   <tr><td> Poste : </td><td><%= user.getPosteUser() %> </td></tr>
                </table>
                   <form action="Servlet_controle?user_accueil" method="POST">
            <input type="submit" value="Retour"/>      
         </form>
                   <% }else { %>
                  <tr><td>   Matricule : </td><td><%= admin.getMatAdmin() %> </td></tr>
                    <tr><td> Nom : </td><td><%= admin.getNomAdmin() %> </td></tr>
                    <tr><td> Prenom : </td><td><%= admin.getPrenomAdmin() %> </td></tr>
        
        </table>
                    <form action="Servlet_controle?admin_accueil" method="POST">
        <input type="submit" value="Retour"/>      
         </form>
        <% } %>
            </fieldset>  
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>
       
    </body>
</html>
