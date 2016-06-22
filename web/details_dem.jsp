<%-- 
    Document   : details_dem
    Created on : 4 juin 2013, 11:01:39
    Author     : ayoub
--%>

<%@page import="Metier.DemandeArticle"%>
<%@page import="Model.DemandeHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Détails Demande</title>
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
        
        <% DemandeHelper dh=new DemandeHelper();  
       DemandeArticle dem=null;
       String role=(String)session.getAttribute("role"); 
        if(request.getParameter("Servlet_set_demande_vue")==null)
       dem=dh.getDemande(Long.decode(request.getParameter("details_dem")).longValue());
        else
        dem=dh.getDemande(Long.decode(request.getParameter("Servlet_set_demande_vue")).longValue());          
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
        
                <center><legend><h2>Détails Demande d'Article</h2></legend> </center>
        <a onclick="printDiv();"><div id="print" style="margin:0px;"></div></a>
                <table id="tt">
                    <tr><td> Date : </td><td><%= dem.getDateDemande() %> </td></tr>
                    <tr><td> Matricule </td><td><%= dem.getUser().getMatUser() %> </td></tr>
                    <tr><td> Nom</td><td><%= dem.getUser().getNomUser() %> </td></tr>
                    <tr><td> Prenom</td><td><%= dem.getUser().getPrenomUser() %> </td></tr>
                    <tr><td> Classe : </td><td><%= dem.getClasseArticle().getNomClasse() %> </td></tr>
                   <tr><td> Réponse : </td><td><%= dem.getReponse() %> </td></tr>
                   <tr><td> Commentaire: </td><td><%= dem.getCommentaireReponse() %> </td></tr>
                
        </table>
                   <% if(role.equals("admin")){ %>
            <a href="Servlet_controle?repondre_demande=<%=dem.getIdDemande() %>"><div id="repondre"></div></a>
            <h4>Repondre</h4><br/>
            <% } %> 
            
                    <form action="Servlet_controle?<%=role%>_espace_demandes" method="POST">
            <input type="submit" value="retour" />
        </form>        
            
           </fieldset>
        </center>
        
    
		</div>
    
		
	
<div class="clear"></div>

</div>    
    </body>
</html>

