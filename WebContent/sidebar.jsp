<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<ul class="sidebar navbar-nav">
      <!--li class="nav-item bg-secondary">
        <a class="nav-link" href="dashboard.jsp" style="text-align: center;">
          <img alt="logo" class="img-responsive" src="photos/1.png" height="100px" width="130px">
        </a>
      </li-->
      <li class="nav-item">
        <a class="nav-link" href="dashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>DASHBOARD</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-users"></i>
          <span>USERS</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="ViewEmployees.jsp">Employees</a>
 		  <a class="dropdown-item" href="ViewVendor.jsp">Vendor</a>
 		  <a class="dropdown-item" href="ViewCustomer.jsp">Customers</a>
 		  
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="addDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-address-card"></i>
          <span>ADDRESS</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="addDropdown">
          	<a class="dropdown-item" href="ViewCity.jsp">City</a>
          	<a class="dropdown-item" href="ViewState.jsp">State</a>
      		</div>  
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="addDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-info-circle"></i>
          <span>EMPLOYEES DETAILS</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="addDropdown">
          	<a class="dropdown-item" href="ViewJobType.jsp">Employee Type</a>
          	<a class="dropdown-item" href="ViewTypeOfWork.jsp">Types Of Job Work</a>
      		</div>  
      </li>
      
              
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="catDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-shopping-cart"></i>
          <span>ORDER</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="catDropdown">
          	<a class="dropdown-item" href="AddOrder1.jsp">Add Order</a>
          	<a class="dropdown-item" href="ViewOrder1.jsp">View Order</a>
          	<a class="dropdown-item" href="ViewOrderDetails1.jsp">Order Details</a>
			<a class="dropdown-item" href="ViewJobWorkPayment1.jsp">Job Work Details</a>          	
      		</div>  
      </li>
        
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="catDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-info-circle"></i>
          <span>PRODUCT DETAILS</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="catDropdown">
          	<a class="dropdown-item" href="ViewMaterial.jsp">Material</a>
          	<a class="dropdown-item" href="ViewSize.jsp">Size</a>
          	<a class="dropdown-item" href="ViewColor.jsp">Color</a>
			<a class="dropdown-item" href="productView.jsp">Product Catalogue</a>          	
      		</div>  
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="ViewProduct.jsp">
      		<i class="fas fa-user-secret"></i>
          <span>PRODUCT</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="catDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-tshirt"></i>
          <span>CATEGORY</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="catDropdown">
          	<a class="dropdown-item" href="ViewCategoryType.jsp">Category-Type</a>
          	<a class="dropdown-item" href="ViewMainCategory.jsp">Main-Category</a>
          	<a class="dropdown-item" href="ViewSubCategory.jsp">Sub-Category</a>
      		</div>  
      </li>
    
  
      
<!--       <li class="nav-item">
        <a class="nav-link" href="AddOrder1.jsp">
          <i class="fas fa-shopping-cart"></i>
          <span>ORDER</span></a>
      </li>
 -->     
      <li class="nav-item">
        <a class="nav-link" href="ViewShop.jsp">
      	  <i class="fa fa-home"></i>
          <span>SHOP</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#"  id="rprtDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-chart-bar"></i>
          <span>REPORTS</span>
        </a>
      		<div class="dropdown-menu" aria-labelledby="catDropdown">
          	<a class="dropdown-item" href="productreport.jsp">Product Report</a>
          	<a class="dropdown-item" href="OrderReport.jsp">Order Report</a>
      		</div>
      </li>
    </ul>