<%-- 
    Document   : msgs_envoyes
    Created on : 4 juin 2013, 12:00:59
    Author     : ayoub
--%>

<%@page import="Metier.Message"%>
<%@page import="java.util.List"%>
<%@page import="Model.MessageHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <title>Messages Envoyes</title>
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
        <% MessageHelper mh=new MessageHelper();
               String mat=(String)session.getAttribute("matricule");
     String role=(String)session.getAttribute("role");
        List<Message> msgenv=null;
        if(role.equals("user"))
        {
        msgenv=(List<Message>) mh.MsgEnvoyesUser(mat);
       }
        else
        {
        msgenv=(List<Message>) mh.MsgEnvoyesAdmin();
       }
%>
        <h3>Messages Envoyes (<%= msgenv.size() %>)</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
        <table id="tt" class="data">
            <TR class="data">
                         <th class="data"> A</th>
                         <th class="data"> Date</th>
                         <th class="data"> Objet</th>
                         <th class="data"> Lecture </th>
                     </TR>
            <% for (int i=0;i<msgenv.size();i++)
                   { %>
                     <TR class="data">
                         <td class="data">
                         <% if(role.equals("admin")) { %>
                         <%= msgenv.get(i).getUser().getMatUser() %>
                         <% } else { %> Admin <% } %>
                        </td>
                         <td class="data"> <%= msgenv.get(i).getDateMsg() %></td>
                         <td class="data"> <%= msgenv.get(i).getObjetMsg() %></td>
                         <td class="data"> <a href="Servlet_controle?lire_msg=<%= msgenv.get(i).getIdMsg() %>" > lire le message  </a> </td>
                     </TR>
                          <% } %>
                                            
        </table>
   </body>
</html>

