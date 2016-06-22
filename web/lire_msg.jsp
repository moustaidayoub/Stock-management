<%-- 
    Document   : lire_msg
    Created on : 3 juin 2013, 10:34:36
    Author     : ayoub
--%>

<%@page import="Metier.Message"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>lire msg</title>
         <script type="text/javascript">          
            
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
        <% MessageHelper mh=new MessageHelper();  
        Message msg=null;
        if(request.getParameter("Servlet_set_msg_lus")==null)
       msg=mh.getMsg(Long.decode(request.getParameter("lire_msg")).longValue());
        else
            msg=mh.getMsg(Long.decode(request.getParameter("Servlet_set_msg_lus")).longValue());
        %>
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
       
                <center><legend><h2>Lecture De Message</h2></legend> </center>
                <a onclick="printDiv();"><div id="print" style="margin:0px;"></div></a>
                <table id="tt">
                    <tr><td> Matricule Utilisateur : </td><td><%= msg.getUser().getMatUser() %> </td></tr>
                    <tr><td> Nom Utilisateur : </td><td><%= msg.getUser().getNomUser() %> </td></tr>
                    <tr><td> Prenom Utilisateur : </td><td><%= msg.getUser().getPrenomUser() %> </td></tr>
                    <tr><td> Date : </td><td><%= msg.getDateMsg() %> </td></tr>
                    <tr><td> Objet : </td><td><%= msg.getObjetMsg() %> </td></tr>
                    <tr><td> Message : </td><td><%= msg.getMsg() %></td></tr>
                  
                
        </table>
           <form action="Servlet_controle?messages" method="POST">
            <input type="submit" value="Retour" />
        </form>
            </fieldset>
         
        
    </center>
		</div>
    
		
	
<div class="clear"></div>

</div>    

    </body>
</html>
