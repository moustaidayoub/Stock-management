<%-- 
    Document   : admin_ajouter_article
    Created on : 5 juin 2013, 14:26:31
    Author     : ayoub
--%>

<%@page import="Metier.Fournisseur"%>
<%@page import="Model.FournisseurHelper"%>
<%@page import="java.util.List"%>
<%@page import="Model.ClasseArticleHelper"%>
<%@page import="Metier.ClasseArticle"%>
<%@page import="Model.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Ajouter Article</title>
    </head>
    <body>
        <%! HttpSession session=null; %>
        <% Helper h=new Helper();
ClasseArticleHelper cah=new ClasseArticleHelper();  
FournisseurHelper fh=new FournisseurHelper();
List<ClasseArticle> ca=(List<ClasseArticle>) cah.getClasses();  
List<Fournisseur> lf=(List<Fournisseur>) fh.getFournisseurs();        
%>
        
               <form method="POST" action="Servlet_controle?Servlet_ajout_article">
            <fieldset>
                <legend><h2>Ajouter Articles</h2></legend>
                <h1><small> Completer le formulaire ci-dessous et cliquez sur ajouter articles</small> <h1>
            <table>
                 <tr>
                    <td>
                        <label for="date">Date Livraison : </label>
                    </td>
                    <td>
                        <input type="text" name="date" value="<%= h.getDate().get(0) %>" disabled/>
                    </td>
                </tr>
              
                 <tr>
                    <td>
                        <label for="idclasse">Classe Article : </label>
                    </td>
                    <td>
                        <select name="idclasse">
                            <% for(int i=0;i<ca.size();i++) { %>
                            <option Value="<%= ca.get(i).getIdClasse() %>"> 
                                <%= ca.get(i).getIdClasse() %>:<%= ca.get(i).getNomClasse() %> 
                            </option>
                            
                            <% } %></select>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <label for="idfournisseur">Fournisseur : </label>
                    </td>
                    <td>
                        <select name="idfournisseur">
                            <% for(int i=0;i<lf.size();i++) { %>
                            <option value="<%= lf.get(i).getIdFournisseur() %>">
                                <%= lf.get(i).getIdFournisseur() %>:<%= lf.get(i).getNomFournisseur() %>
                            </option>
                            <% } %>
                           </select>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="matricule">Matricule Utilisateur: </label>
                    </td>
                    <td>
                        <input type="text" name="matricule" value="Aucun" disabled/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="numserie">Numero de Serie: </label>
                    </td>
                    <td>
                        <input type="text" name="numserie" />
                    </td>
                </tr>
           <tr>
                    <td>
                        <label for="marque">Marque: </label>
                    </td>
                    <td>
                        <input type="text" name="marque"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="modele">Modele: </label>
                    </td>
                    <td>
                        <input type="text" name="modele"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="notes">Notes: </label>
                    </td>
                    <td>
                       <textarea name="notes" ></textarea> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="qte">Quantite: </label>
                    </td>
                    <td>
                        <select name="qte">
                            <option selected>1</option>
                            <% for(int i=2;i<51;i++) { %>
                            <option> <%= i %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" class="button" value="Ajouter articles"/>
                        </fieldset>
         </form>
    </body>
</html>

