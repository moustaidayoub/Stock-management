<%-- 
    Document   : admin_ajouter_utilisateur
    Created on : 7 juin 2013, 14:56:31
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Ajouter Utilisateur</title>
    </head>
    <body>
          <form method="POST" action="Servlet_controle?Servlet_ajouter_utilisateur">
            <fieldset>
                <legend><h2>Ajouter Utilisateur</h2></legend>
                <h1> <small>Completer le formulaire ci-dessous et cliquez sur Ajouter utilisateur</small> <h1>
            <table>
                 <tr>
                    <td>
                        <label for="matriculeuser">Matricule de l'utilisateur : (obligatoire)</label>
                    </td>
                    <td>
                        <input type="text" name="matriculeuser"/>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <label for="nomuser">Nom de l'utilisateur: </label>
                    </td>
                    <td>
                       <input type="text" name="nomuser" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomuser">Prenom de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="prenomuser"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="posteuser">Poste de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="posteuser"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label for="motdepasseuser">Mot de passe de l'utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="motdepasseuser"/>
                    </td>
                </tr>
              
            </table>
            <input type="submit" class="button" value="Ajouter Utilisateur"/>
                        </fieldset>
         </form>
    </body>
</html>


