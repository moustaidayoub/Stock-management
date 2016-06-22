<%-- 
    Document   : admin_consulter_fournisseurs
    Created on : 7 juin 2013, 10:36:03
    Author     : ayoub
--%>

<%@page import="Metier.Fournisseur"%>
<%@page import="java.util.List"%>
<%@page import="Model.FournisseurHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Page Consultation fournisseurs</title>
        <script type="text/javascript">           
            function generateexcel() {
  var table= document.getElementById('tt');
  var html = table.outerHTML;
  window.open('data:application/vnd.ms-excel,' + escape(html));
}
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
         <%! HttpSession session=null; %>
        <% FournisseurHelper fh=new FournisseurHelper();
        List<Fournisseur> frns=(List<Fournisseur>) fh.getFournisseurs();
%>
        <h3>Consultation Fournisseurs</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
  <table id="tt" class="data">
            <TR class="data">
                         <th class="data"> Nom Fournisseur</th>
                         <th class="data"> Adresse Fournisseur</th>
                         <th class="data"> Télephone Fournisseur</th>
                         <th class="data"> Email Fournisseur</th>
                         <th class="data"> Nombre d'Articles Fournis </th>
                         <th class="data"> Modification </th>
                     </TR>
            <% for (int i=0;i<frns.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data"> <%= frns.get(i).getNomFournisseur() %></td>
                         <td class="data"> <%= frns.get(i).getAdresseFournisseur() %></td>
                         <td class="data"> <%= frns.get(i).getTelFournisseur() %> </td>
                         <td class="data"> <%= frns.get(i).getEmailFournisseur() %> </td>
                         <td class="data"> <%= frns.get(i).getArticles().size() %> </td>
                         <td class="data"> <a href="Servlet_controle?admin_modifier_fournisseur=<%= frns.get(i).getIdFournisseur() %>"  > Modifier  </a> </td>
                     </TR>
                          <% } %>
                            
        </table>
    </body>
</html>


