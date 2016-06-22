<%-- 
    Document   : envoyer_demande
    Created on : 4 juin 2013, 12:16:45
    Author     : ayoub
--%>

<%@page import="Model.Helper"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Metier.ClasseArticle"%>
<%@page import="java.util.List"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Envoyer Demande</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
         <% ClasseArticleHelper cah=new ClasseArticleHelper();  
       List<ClasseArticle> ca=(List<ClasseArticle>) cah.getClasses();
         Helper h=new Helper();

        


        %>    
        <form method="POST" action="Servlet_controle?Envoi_demande">
            <fieldset>
                <legend><h2>Demande d'Article</h2></legend>
                <h1><small> Completer le formulaire ci-dessous et cliquez sur envoyer demande </small> </h1>
            <table>
                 <tr>
                    <td>
                        <label for="date">Date Demande : </label>
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
                        <input type="text" name="matricule" value="<%= session.getAttribute("matricule") %> " disabled/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="classe">Classe Article : </label>
                    </td>
                    <td>
                        <select name="idclasse">
                            <% for(int i=0;i<ca.size();i++) { %>
                            <option value="<%= ca.get(i).getIdClasse() %>">
                                <%= ca.get(i).getIdClasse() %>:<%= ca.get(i).getNomClasse() %>
                            </option>
                            
                            <% } %></select>
                    </td>
                </tr>
           
            </table>
            <input type="submit" class="button" value="Envoyer Demande"/>
                        </fieldset>
         </form>
    </body>
</html>
