<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


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
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item active">PRODUCT</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-female"></i>
            Product
          </div>
          	<div class="card-body">
            	
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
      					</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="addProduct.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Add New Product
			                	</a>
			            </div>
			      </div>
			
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  	<th>ID</th>
                  	<th>View</th>
                  	<th>Code</th>
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
                    <th>Update</th>
                    <th>Remove</th>
                  </tr>
                </thead>
                
                <tbody>
                  	  <%
                  	ProductDao pd=new ProductDao();
                  	List<ProductBean> list=pd.getAllProduct();
                  	
                  	for(ProductBean product: list)
                  	{
                  	%>
                  <tr>
                  <td><%= product.getProdid() %></td>
                  <td><img height="50" width="50" src="upload/<%= product.getImg() %>"></td>
                  <td><%= product.getCode()%></td>	
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
						<td>                  
                    	<form action="productcontroller" method="post">
                  			<input type="hidden" name = "id" value = <%= product.getProdid() %>>
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  		</form>
                    </td>
                    <td>
                    	<form action="productcontroller" method="post">
                  			<input type="hidden" name = "id" value = <%= product.getProdid()%>>
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Delete">
                  		</form>
                    </td>
                  </tr>
                  <%
                  }
                  %>
                </tbody>
       
              </table>
       		 </div>
     
            </div>
             
          </div>
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
  
  
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>