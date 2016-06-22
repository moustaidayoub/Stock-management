<%-- 
    Document   : index
    Created on : 21 mai 2013, 12:30:52
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Page d'authentification</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>
   	
<div class="container">
   <section id="content">
       
            <div id="logo">  
                 </div>
		<form method="POST" action="Servlet_controle?index">
			<h1>Authentification</h1>
                        
			<div>
				<input type="text" name="matricule" placeholder="Votre Matricule" required="" id="username" />
			</div>
			<div>
				<input type="password" name="password" placeholder="Votre Mot de passe" required="" id="password" />
			</div>
			<div>
				<input type="submit" value="Se Connecter" />
			</div>
		</form><!-- form -->
           
	</section><!-- content -->
</div><!- container -->
</body>
</html>







