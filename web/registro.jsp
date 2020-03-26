<%@page import="Datos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
       <title>AkuaMakiv</title>

         <script src="Script/Script.js" type="text/javascript"></script>
         
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
            <li role="presentation" class="active"><a href="index.jsp">Inicio</a></li>
            <li role="presentation"><a href="registro.jsp">Registrarse</a></li>
            <li role="presentation"><a href="login.jsp">Iniciar sesion</a></li>
          
          </ul>
        </div>
      </div>
    </div>
  </nav>


        <center> <H1 style="color: green" >
                                    Crear cuenta	
                                    </H1></center>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                               

                            </div>
                            <br>
<script src="facebook.js" type="text/javascript"></script>
                            <div class="col-md-9">

                                <fieldset>
                                    <legend> Registro </legend>

                                  <form  class="box" action="" method="post" onsubmit="return validarPasswd();return pruebaemail(txtcorreo.value)">
                                         <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">Obtener algunos datos de Facebook </fb:login-button>
                                           
                                  
                                      
                                      <p>
                                        
                                            <label>Nombre(s):</label>
                                             <input type="text" name="txtNombre" id="txtnombre"  placeholder="Nombre"   required onkeypress=" return soloLetras(event)">
             
                                    </p>
                                    <p>
                                        </label>
                                            <label> Apellido Paterno: </label>
                                       <input type="text" name="txtAppat" id="txtappat"  placeholder="Apellido Paterno"   required onkeypress=" return soloLetras(event)">
                        
                                            <label>Apellido materno:</label>	
                                        <input type="text" name="txtApmat" id="txtapmat"  placeholder="Apellido Materno"   required onkeypress=" return soloLetras(event)">
            
                                    </p>
                                    <p>
                                        <label>Fecha de nacimiento:</label>
                                      <input type="date"   min="1960-01-01" max="2019-10-05" name="txtFecha" id="txtfecha"  placeholder>
                                    </p>
                                      <label>Numero de telefono:</label>
                                            <input type="text" name="txtNum" id="txtcel"  placeholder="No. Telefono"   required onkeypress="return solonumeros(event)" maxlength="10">
                                            <p>
                                       <label>Correo:</label>
                            <input type="email"  name="txtCorreo" id='txtcorreo'  placeholder="Correo"   required>
                                 
                                            <p>
                                      <label>Contraseña:</label>
                                        <input type="text"  name="txtContra" id="txtcontra"  placeholder="Contraseña"   required>
            
                                      
                                      <label>Confirmar Contraseña:</label>
 <input type="password" name="txtContra1" id="txtcontra1"  placeholder="Confirmacion"   required>
                                            </p><center>
                                                <p>  
            <input type="submit" class="btn btn-success" style="color:white" value="Registrar" name="btnRegistrar">
                                                </p>
                                           
                           
                                            </center>
            
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">Obtener algunos datos de Facebook </fb:login-button>
                                     

                                    </form></fieldset></div></div></div>












  
       
        <%
            String boton = request.getParameter("btnRegistrar");
            if (boton != null) {
                Usuario u = new Usuario();
                u.setNombre(request.getParameter("txtNombre"));
                u.setAp_pat(request.getParameter("txtAppat"));
                u.setAp_mat(request.getParameter("txtApmat"));
                u.setFechNa(request.getParameter("txtFecha"));
                u.setNum_tel(request.getParameter("txtNum"));
                u.setCorreo(request.getParameter("txtCorreo"));
                u.setContra(request.getParameter("txtContra"));

                if (u.nuevoUsuario()) {

                    response.sendRedirect("index.jsp");
                    out.println("<script>window.alert('Registro completo');</script>");

                } else {
                    out.println("<script>window.alert('El correo ya existe');</script>");
                }
            }
        %>
 