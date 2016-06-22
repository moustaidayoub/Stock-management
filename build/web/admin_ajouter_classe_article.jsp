<%-- 
    Document   : admin_ajouter_classe_article
    Created on : 7 juin 2013, 11:04:23
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Ajouter Classe Article</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
               <form method="POST" action="Servlet_controle?Servlet_ajouter_classe_article">
            <fieldset>
                <legend><h2>Ajouter Classe Articles</h2></legend>
                <h1> <small>Completer le formulaire ci-dessous et cliquez sur ajouter classe articles </small></h1>
            <table>
                 <tr>
                    <td>
                        <label for="nomclasse">Nom du classe : </label>
                    </td>
                    <td>
                        <input type="text" name="nomclasse" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="quantite">Quantite du classe: </label>
                    </td>
                    <td>
                        <input type="text" name="quantite" value="Calculée automatiquement" disabled/>
                    </td>
                </tr>
              
            </table>
            <input type="submit" class="button" value="Ajouter Classe Articles"/>
                        </fieldset>
         </form>
    </body>
</html>



