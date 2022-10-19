<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.bean.ShopBean"%>
<%@page import="com.dao.ShopDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.dao.ProductDao"%>

<!DOCTYPE html>
<html lang="en">

<%
	List<ProductBean> show = (List<ProductBean>)request.getAttribute("show");
%>

<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:06 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->

<jsp:include page="head.jsp"></jsp:include>

<body id="page-top">

  <jsp:include page="header.jsp"></jsp:include>
  
  <div id="wrapper">

    <jsp:include page="sidebar.jsp"></jsp:include>
    
    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Product Report</li>
        </ol>
        
        <div class="heading" style="margin-bottom: 40px;">Product Report </div>
       
        <form onSubmit="return validate()" action="productcontroller" method="post">
        
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 6px;  font-weight: bold;">  
                <label for="shop">Shop </label>
              </div>           
            	
              <div class="col-md-3">
              	<div class="form-label-group">
                  <select id="shop" name="shop" class="form-control" required="required" autofocus = "autofocus">
                    <option value="Shop" id="0">Shop</option>
                  	<%
                  	ShopDao sd=new ShopDao();
                  	List<ShopBean> list=sd.getAllShop();
                  	
                  	for(ShopBean sb:list)
                  	{
                  		if(sb.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb.getBid()%>"><%=sb.getBnm()%></option>
                  	<%
                  		}
                  	}
                  	%>
                  </select>
                </div>
              </div>
              
            </div>
          </div>
        
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 3px;  font-weight: bold;">  
                <label for="start">From </label>
                  <i style="color: red; font-size: 20px;">*</i>
              </div>           
            
              <div class="col-md-3">
				<input type="date" id="start" name="trip-start" max="2020-08-18" class="form-control" autofocus = "autofocus">
              </div>
              
            </div>
          </div>
          
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 3px;  font-weight: bold;">
                  <label for="to">To </label>
                  <i style="color: red; font-size: 20px;">*</i>
              </div>           
            
              <div class="col-md-3">    
				<input type="date" id="to" name="to" max="2020-08-17" class="form-control" autofocus = "autofocus">
              </div>
              
            </div>
          </div>
		
		  <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1">
              </div>           
            
              <div class="col-md-2">
              	<button type="submit" class="btn btn-primary btn-block" name="action" value="show" formnovalidate>SHOW REPORT</button>		            		            
              </div>
              
            </div>
          </div>
          
        </form>
        
        <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  	<th>ID</th>
                  	<th>View</th>
                  	<th>Shop Name</th>
                    <th>Product Name</th>
                    <th>Category Type</th>
                    <th>Main-Category</th>
                    <th>Sub-Category</th>
                    <th>Material</th>
                    <th>Size</th>
                    <th>Color</th>
                    <th>Price</th>
                    <th>Quantity</th>
                  </tr>
                </thead>
                
                <tbody>
                  	<%
                  	if(show != null)
                  	{
                  	for(ProductBean product: show)
                  	{
                  	%>
                  <tr>
                  <td><%= product.getProdid() %></td>
                  <td><img class="rounded-circle" height="50" width="50" src="upload/<%= product.getImg() %>"></td>
                  <td><%= product.getBranchnm() %></td>
				  <td><%= product.getProdnm() %></td>
				  <td><%= product.getTypenm() %></td>
				  <td><%= product.getMainnm() %></td>
				  <td><%= product.getSubnm() %></td>
				  <td><%= product.getMatnm() %></td> 
				  <td><%= product.getSizenm() %></td>
				  <td><%= product.getColornm() %></td>
				  <td><%= product.getPrice() %></td>  
				  <td><%= product.getQty() %></td>  
                  </tr>
                  <%
                  	}
                  }
                  %>
                </tbody>
       
              </table>
       		 </div>
        
        
      </div>
      <!-- /.container-fluid -->

      <jsp:include page="footer.jsp"></jsp:include>
      
    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="script.jsp"></jsp:include>
  
  <script type="text/javascript">
  	
  </script>
  
</body>

<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>