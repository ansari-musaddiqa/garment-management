<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% 
ProductDao dao=new ProductDao();
List<ProductBean> list= new ArrayList<ProductBean>();
list=dao.getAllProduct();
%>
<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:06 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<jsp:include page="head.jsp"></jsp:include>

<body id="page-top">
  <jsp:include page="header.jsp"></jsp:include>
  <div id="wrapper">

    <!-- Sidebar -->
   <jsp:include page="sidebar.jsp"></jsp:include>
<div id="content-wrapper">


<div class="container-fluid">
    <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
          	<a href="#">PRODUCT DETAILS</a>
          </li>
          <li class="breadcrumb-item active">Product Catalogue</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-female"></i>
            PRODUCT CATALOGUE
          </div>
          <div class="card-body" align="center">
       
							<div class="form-group">
				            <div class="form-row">
				             <%
				             	for(ProductBean bean:list)
				             	{
				             %>
				              <div class="col-md-3">
				                <div class="form-label-group">
												        <img src="upload/<%=bean.getImg()%>" class="img-responsive  center-block" alt="Cinque Terre" width="250" height="250">
								</div>
								<div class="form-label-group">
											<h5 style="font-family:Candara;"><%=bean.getProdnm()%>:<%=bean.getMatnm() %></h5>
											<h3 style="color:red;">Rs.<%=bean.getPrice()%></h3>
											<h5><%=bean.getSubnm()%>:<%=bean.getTypenm() %></h5>
											<%
												if(bean.getQty()>0)
												{
											%>
													<h5>in stock</h5>		
													<h6>Available At <%=bean.getBranchnm() %></h6>
											<%
												}
												else
												{
											%> 
													<h5>Out of stock</h5>
											<% 
												}
											%>
								</div>
				              </div>
				              <%
				      		
				             	}
				             
				              %>
				             </div>
				          </div>
				 	  
								     
		</div>
		</div>
		</div>
        
      </div>
      <!-- /.container-fluid -->
      <!-- Sticky Footer -->
<jsp:include page="footer.jsp"></jsp:include>
    </div>
    <!-- /.content-wrapper -->
		
  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


  <!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"></jsp:include>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    