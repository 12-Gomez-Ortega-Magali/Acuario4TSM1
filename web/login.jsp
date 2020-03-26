

<%@page import="Datos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false"%>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AkuaMakiv</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
 
  <link rel="stylesheet" type="text/css" href="css/normalize.css" />
  <link rel="stylesheet" type="text/css" href="css/demo.css" />
  <link rel="stylesheet" type="text/css" href="css/set1.css" />
  <link href="css/overwrite.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  
</head>

<body>
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
   
        <a class="navbar-brand" href="index.jsp"><span>AcuaMakiv</span></a>
      </div>
      <div class="navbar-collapse collapse">
        <div class="menu">
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="index.html">Inicio</a></li>
            <li role="presentation"><a href="registro.jsp">Registrarse</a></li>
            <li role="presentation"><a href="login.jsp">Iniciar sesion</a></li>
          
          </ul>
        </div>
      </div>
    </div>
  </nav>


                </div></header>
                <body>
               
                    <div class="container">

                            <div class="text-center padded-box pb-0">
                                <center>          
                                    <aside  class="col-md-5">
                                        

                                            <h1></h1>
                                             <center><form action="" method="POST">
                                                <div class="list-group list-group-root">
                                                   
                                                        <br><br>
                                                            <h2>Correo</h2>
                                                            <input name="txtUsuario" id="txtusuario"  maxlength="30" class="form-control mr-sm-2" type="email"  placeholder="Correo" aria-label="Correo" required/>
                                                            <h2>Contraseña</h2>   
                                                            <input name="txtPassword" id=""txtpassword  maxlength="15" class="form-control mr-sm-2" type="password"  placeholder="Contraseña" aria-label="Contraseña" required/>
                                                            <br>
                                                            <button class="btn btn-success my-2 my-sm-0" type="submit" name="btnIngresar" style="color:white">Ingresar</button>
                                                            


                                                        </div></aside></center>
                                                    </div>
                                                </div></form></center>
                                
                                              <%
            if (request.getParameter("btnIngresar") != null) {
                Usuario g = new Usuario();

                String usuario = request.getParameter("txtUsuario");
                String password = request.getParameter("txtPassword");
                HttpSession sesion = request.getSession();
                g.setCorreo(usuario);
                g.setContra(password);
                if (g.iniciarSession()) {
                    response.sendRedirect("principal.jsp");
                    sesion.setAttribute("usuario", usuario);
                    int id = g.getId_usuario();
                    sesion.setAttribute("id_usuario", id);
                } else {
                    out.println("<script>window.alert('Error el usuario no existe');</script>");
                }
            }

        %>
                                    
                                            </div>
                                            </section>
                                            </body>
                                            </html>




