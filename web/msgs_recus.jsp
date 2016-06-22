<%-- 
    Document   : msgs_recus
    Created on : 31 mai 2013, 12:55:04
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
        <title>Messages Reçu</title>
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
        List<Message> msgsrecus=null;
        List<Message> msgsnonlus=null;
        if(role.equals("user"))
        {
        msgsrecus=(List<Message>) mh.MsgsRecusUser(mat);
        msgsnonlus=(List<Message>) mh.MsgNonLusUser(mat);
       }
        else
        {
        msgsrecus=(List<Message>) mh.MsgsRecusAdmin();
        msgsnonlus=(List<Message>) mh.MsgNonLusAdmin();
       }
%>
        <h3>Messages Reçus (<%= msgsnonlus.size() %>/<%= msgsrecus.size() %>)</h3>
        <a onclick="generateexcel();"><div id="excel"></div></a>
        <a onclick="printDiv();"><div id="print"></div></a>
        <table id="tt" class="data"> 
            <TR class="data"> 
                         <th class="data"> De</th>
                         <th class="data"> Date</th>
                         <th class="data"> Objet</th>
                         <th class="data"> Lecture </th>
                     </TR>
            <% for (int i=0;i<msgsrecus.size();i++)
                   { if(msgsrecus.get(i).isMsgVue()==false){ %>
                   <TR class="data" style="background-color:#ffff66;">
                        <td class="data">
                         <% if(role.equals("admin")) { %>
                         <%= msgsrecus.get(i).getUser().getMatUser() %>
                         <% } else { %> Admin <% } %>
                        </td>
                         <td class="data"> <%= msgsrecus.get(i).getDateMsg() %></td>
                         <td class="data"> <%= msgsrecus.get(i).getObjetMsg() %></td>
                         <td class="data"> <a href="Servlet_controle?Servlet_set_msg_lus=<%= msgsrecus.get(i).getIdMsg() %>" > lire le message  </a> </td>
                     </TR>
                        <% } else { %>  
                     <TR class="data">
                         <td class="data">
                         <% if(role.equals("admin")) { %>
                         <%= msgsrecus.get(i).getUser().getMatUser() %>
                         <% } else { %> Admin <% } %>
                         </td>
                         <td class="data"> <%= msgsrecus.get(i).getDateMsg() %></td>
                         <td class="data"> <%= msgsrecus.get(i).getObjetMsg() %></td>
                         <td class="data"> <a href="Servlet_controle?lire_msg=<%= msgsrecus.get(i).getIdMsg() %>"  > lire le message  </a> </td>
                     </TR> 
                         <% }} %>                
        </table>
    </body>
</html>
