<%-- 
    Document   : admin_ajouter_fournisseur
    Created on : 7 juin 2013, 10:18:22
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Ajouter Fournisseur</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
   
        
               <form method="POST" action="Servlet_controle?Servlet_ajouter_fournisseur">
            <fieldset>
                <legend><h2>Ajouter Fournisseur</h2></legend>
                <h1> <small> Completer le formulaire ci-dessous et cliquez sur ajouter fournisseur <small></h1>
            <table>
                 <tr>
                    <td>
                        <label for="nom">Nom du Frounisseur : </label>
                    </td>
                    <td>
                        <input type="text" name="nom" />
                    </td>
                </tr>
                  <tr>
                    <td>
                        <label for="adresse">Adresse du Fournisseur: </label>
                    </td>
                    <td>
                       <textarea name="adresse" ></textarea> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="tel">Télephone du Founisseur: </label>
                    </td>
                    <td>
                        <input type="text" name="tel"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="email">E-mail du Fournisseur: </label>
                    </td>
                    <td>
                        <input type="text" name="email"/>
                    </td>
                </tr>
              
            </table>
            <input type="submit" class="button" value="Ajouter Fournisseur"/>
                        </fieldset>
         </form>
    </body>
</html>


