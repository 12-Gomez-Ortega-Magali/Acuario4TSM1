<%@page import="Datos.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%><!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AkuaMakiv</title>


  <link href="css/bootstrap.min.css" rel="stylesheet">
 
  <link rel="stylesheet" type="text/css" href="css/normalize.css" />
  <link rel="stylesheet" type="text/css" href="css/demo.css" />
  <link rel="stylesheet" type="text/css" href="css/set1.css" />
  <link href="css/overwrite.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  
</head>

<body>
     <%!
            HttpSession sesion;
            String usuario;
            String id;
        %>
          
        <%
            try {
                sesion = request.getSession();
                if (sesion.getAttribute("usuario") != null) {
                    usuario = sesion.getAttribute("usuario").toString();
                    id = sesion.getAttribute("id_usuario").toString();
                } else {
                    out.println("<script>location.replace('index.jsp');</script>");
                }
            } catch (Exception e) {
                response.sendRedirect("index.jsp");
            }

            Empleado u = new Empleado();
            u.setId_empleado(Integer.parseInt(id));
            u.buscarInformacion();

           

        %>
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
    
      <div class="navbar-header">
   
        <a class="navbar-brand" href="index.jsp"><span>AcuaMakiv</span></a>
      </div>
      <div class="navbar-collapse collapse">
        <div class="menu">
          <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" ><h4>Bienvenido! <%=u.getNombre()%> <%=u.getAp_pat()%></h4></li>
              
              <li role="presentation" ><a href="index.html">Inicio</a></li>
            <li role="presentation"><a href="registrop.jsp">Registrar un producto</a></li>
            <li role="presentation"><a href="productos.jsp">Mis productos</a></li>
          
            <li role="presentation"><a href="pedidos.jsp">Ver pedidos</a></li>
          
          </ul>
        </div>
      </div>
    </div>
  </nav>


 
    <br>
    <br>
    <br>
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="text-center">
          <h2>AcuaMakiv</h2>
          <p>Los mejores productos<br>Para tu acuario  <br> Al mejor precio</p>
        </div>
        <hr>
      </div>
    </div>
  </div>

 
     

  
    <footer>
    <div class="last-div">
      <div class="container">
        <div class="row">
          <div class="copyright">
            &copy; Magaly Gomez & Ivan Hernandez . All Rights Reserved
       
          </div>
        </div>
      </div>
      
     
    </div>
  </footer>

 

</body>

</html>
