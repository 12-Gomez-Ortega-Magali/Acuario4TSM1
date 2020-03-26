<%@page import="Datos.Productos"%>
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

        
        
        
        
        <center>
        <div class="row">
                           
                                
                    <div class="container">
                        
                            <br>

                            <div class="col-md-9">

                                <fieldset>
                                    

                                  <form class="box" action="" method="post" onsubmit="return validarPasswd();return pruebaemail(txtcorreo.value)">
                                        <p>
                                        
                                            <label>Nombre(s):</label>
                                             <input type="text" name="txtNombre" id="txtnombre"  placeholder="Nombre"   required onkeypress=" return soloLetras(event)">
             
                                    </p>
                                    <p>
                                        
                                        
                                       
                                    <p>
                                            <label>Descripcion:</label>	
                                        <input type="text" name="txtdesc" id="txtapmat"  placeholder="Descripcion"   required onkeypress=" return soloLetras(event)">
            
                                    </p>
                                    <p>
                                        <label>Cantidad:</label>
                                     <input type="text" name="txtcan" id="txtcel"  placeholder="Cantidad"   required onkeypress="return solonumeros(event)" maxlength="10">
                                           
                                    </p>
                                    <p>
                                      <label>Precio:</label>
                                            <input type="text" name="txtpre" id="txtcel"  placeholder="Precio"   required onkeypress="return solonumeros(event)" maxlength="10">
                                    </p>
                                    <p>
                                     <input type="submit" class="btn btn-success" value="Registrar" name="btnRegistrar">
                                    </p>
                                  </form></fieldset></div></div></div></center>












  
       
        <%
            String boton = request.getParameter("btnRegistrar");
            if (boton != null) {
                Productos u = new Productos();
                u.setNombre(request.getParameter("txtNombre"));
             
                u.setDescripcion(request.getParameter("txtdesc"));
                u.setCantidad(request.getParameter("txtcan"));
                u.setPrecio(request.getParameter("txtpre"));
              

                if (u.nuevoProducto()) {

                    response.sendRedirect("registroj.jsp");
                    out.println("<script>window.alert('Registro completo');</script>");

                } else {
                    out.println("<script>window.alert('El Producto ya existe');</script>");
                }
            }
        %>
 