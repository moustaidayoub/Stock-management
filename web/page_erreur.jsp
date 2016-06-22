<%-- 
    Document   : page_erreur
    Created on : 18 juin 2013, 23:01:24
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />  
        <title>Page d'erreur</title>
        <style>
            html { height: 100%; background: transparent url(css/img/bg.jpg); }
            .errorWrapper { position: absolute; top: 20px; bottom: 0; text-align: center; left: 0; right: 0; height: 430px; }
.logo { background: url(css/img/cmrlogo.png) no-repeat;border-radius:80px 80px 80px 80px; display: block; height: 156px; margin: 0 auto 0px auto; width: 156px; }
.errorWrapper .Title { display: block; text-shadow: 1px 0 0 #fff; text-align: center; font-size: 20px; border-bottom: 1px solid #cdcdcd; padding: 20px 14px; font-weight: bold; color: #d76a6a; font-style: italic; }
.errorWrapper .offline { color: #fff; font-size: 200px; text-stroke: 1px transparent; padding: 0px 0 80px 0; display: block;
text-shadow: 0 1px 0 #ccc,
               0 2px 0 #c9c9c9,
               0 3px 0 #bbb,
               0 4px 0 #b9b9b9,
               0 5px 0 #aaa,
               0 6px 1px rgba(0,0,0,.1),
               0 0 5px rgba(0,0,0,.1),
               
               0 3px 5px rgba(0,0,0,.2),
               0 5px 10px rgba(0,0,0,.25),
               0 10px 10px rgba(0,0,0,.2),
               0 20px 20px rgba(0,0,0,.15); }

.errorDesc { display: block; margin: -20px 0 30px 0; font-weight: bold; font-size: 18px; }



        </style>
    </head>
    <body>
        <%! String erreur=null; %>
        <%
        String query=(String)request.getParameter("erreur");
        if(query.equals("connexion_erreur"))
       erreur="Le matricule ou le mot de passe sont erronés !!";
      %>
       <div class="errorWrapper">
    <span class="logo"></span>
    <span class="Title">La Caisse Marocaine des Retraités</span>
    <span class="offline">Page d'erreur</span>
    <span class="errorDesc"><%= erreur %></span>
    <a href="Servlet_controle?from_erreur" class="button" ><span>Retour</span></a>
</div>    
    </body>
</html>
