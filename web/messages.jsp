<%-- 
    Document   : messages
    Created on : 4 juin 2013, 11:26:45
    Author     : ayoub
--%>

<%@page import="Metier.Message"%>
<%@page import="java.util.List"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! HttpSession session=null; %>
        <% MessageHelper mh=new MessageHelper();
        String mat=(String)session.getAttribute("matricule");
        String role=(String)session.getAttribute("role");
        List<Message> msgsrecus=null;
        List<Message> msgnonlus=null;
        List<Message> msgenv=null;
        
        if(role.equals("user"))
        {
        msgsrecus=(List<Message>) mh.MsgsRecusUser(mat);
        msgnonlus=(List<Message>) mh.MsgNonLusUser(mat);
        msgenv=(List<Message>) mh.MsgEnvoyesUser(mat);
       }
        else
        {
        msgsrecus=(List<Message>) mh.MsgsRecusAdmin();
        msgnonlus=(List<Message>) mh.MsgNonLusAdmin();
        msgenv=(List<Message>) mh.MsgEnvoyesAdmin();
       }
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type="text/javascript" src="js/modernizr.custom.80028.js"></script>
         <link rel="stylesheet" type="text/css" href="css/style.css" />  
        <script type="text/javascript" src="js/jquery.js"></script>  
        <script type="text/javascript" src="js/sliding_effect.js"></script>  

        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <title>Messages</title>
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
<div id="wrapper">


	<div id="leftBar">
                  <div id="ctrl">
	<div id="div_menu">
	<ul class="menu">
            <li class="item1"><a href="Servlet_controle?messages=send" style="text-indent: 1em;">Envoyer Un Message</a></li>
            <li class="item2"><a href="Servlet_controle?messages=recus" style="text-indent:1em;">Mesages Reçus<span><%= msgnonlus.size()%>/<%= msgsrecus.size() %></span></a></li>
        <li class="item3" ><a href="Servlet_controle?messages=envoyes" style="text-indent: 1em;" >Messages Envoyés<span><%= msgenv.size()%></span></a></li>
        </ul>
	</div>
	</div>
            
 
        </div>
            <div id="rightContent">
            <a href="Servlet_controle?<%= role %>_accueil"><div id="img_retour"></div></a>
	<h6 style="margin-left:660px;">Accueil </h6>
        <h3 style="margin-top:-27px;">Messagerie</h3>
	<div class="quoteOfDay">
            <form method="POST" action="Servlet_controle?messages=recherche_msg">
	<table><tr>
	<td><select name="critere">
                <% if(role.equals("admin")){ %>
                    <option value="user.matUser" onclick="document.getElementById('rech2').style.visibility='hidden';">Matricule</option>
                    <% } %> 
                    <option value="date" onclick="document.getElementById('rech2').style.visibility='';">Date</option>
                    <option value="objetMsg" onclick="document.getElementById('rech2').style.visibility='hidden';">Objet</option>
                    <option value="msg" onclick="document.getElementById('rech2').style.visibility='hidden';">Message</option>		
	</select></td>
			<td><input type="text" name="rech1" style="width:125px;"/></td>
                       <td><input type="text" value="Entrez une valeur..." id="rech2" name="rech2" style="width:125px;visibility:hidden;"/></td>
			<td> <input type="submit" class="button" Value="Lancer la recherche"/></td>
	</tr></table>
            </form>
	</div>	
               <div id="include">       
                    <center>         
        <% if(request.getParameter("messages").equals("send")) {%>
        <jsp:include page="send_msg.jsp" /> 
        <% } %>
        <% if(request.getParameter("messages").equals("recus")) {%>
        <jsp:include page="msgs_recus.jsp" /> 
        <% } %>
         <% if(request.getParameter("messages").equals("envoyes")) {%>
        <jsp:include page="msgs_envoyes.jsp" /> 
        <% } %>
        <% if(request.getParameter("messages").equals("recherche_msg")) {%>
        <jsp:include page="recherche_msg.jsp" /> 
        <% } %>
                    </center>
               </div>
        
		<div class="clear"></div>
		
		
	</div>
<div class="clear"></div>
<center><div id="footer">
	&copy; 2013 MOUSTAID AYOUB | Tel: <a >06 30 13 87 57</a> | Email: <a>moustaidayoubcanvas2012@gmail.com</a><br>
	GENIE LOGICIEL-EST SALE 
</div></center>
</div>
        
        <% if(request.getParameter("messages").equals("msg_envoye"))
                                  { %>
                                  <div id="note">msg envoyé avec succés</div> 
        <%} %>
        
        
       
       
       
    </body>
</html>
