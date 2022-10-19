<%@page import="com.bean.MaterialBean"%>
<%@page import="com.dao.MaterialDao"%>
<%@page import="com.bean.ShopBean"%>
<%@page import="com.dao.ShopDao"%>
<%@page import="com.bean.VendorBean"%>
<%@page import="com.dao.VendorDao"%>
<%@page import="com.bean.ColorBean"%>
<%@page import="com.dao.ColorDao"%>
<%@page import="com.bean.SizeBean"%>
<%@page import="com.dao.SizeDao"%>
<%@page import="com.bean.SubCategoryBean"%>
<%@page import="com.dao.SubCategoryDao"%>
<%@page import="com.bean.MainCategoryBean"%>
<%@page import="com.dao.MainCategoryDao"%>
<%@page import="com.bean.CategoryTypeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryTypeDao"%>
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

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">PRODUCT</a>
          </li>
          <li class="breadcrumb-item active">Add Product</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Add Product</div>
      <div class="card-body">
        <form method="post" action="productcontroller" onSubmit="return validate()" enctype="multipart/form-data">
        
         <div class="script1" id="valup">
          <div class="form-group">
		  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		  </div>
        
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="name" name="pnm" class="form-control" placeholder="Name" required="required">
                  <label for="name">Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="code" name="code" class="form-control" placeholder="Name" required="required">
                  <label for="code">Code</label>
                </div>
              </div>
           </div>
      		</div>
      	
      	
		 <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valpnm">
		  			<label class="form-control valbg" id="txtpnm">Enter Size</label>
		  		  </div>
                </div>
              </div>
             
             	<div class="col-md-6">
              <div class="form-label-group">
                  <div class="script1" id="valcode">
		  			<label class="form-control valbg" id="txtcode">Enter code</label>
                  </div>
             </div>
               </div>	
          </div>
			
			
		<div class="form-group">	
            <div class="form-row">
              <div class="col-md-6">
              <div class="form-label-group">
                <input type="number" min="1" id="qty" name="qty" class="form-control" placeholder="Quantity" required="required">
                <label for="qty">Quantity</label>
              </div>
            </div>	  
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="cattype" name="type" class="form-control" required="required">
                    <option>Category Type</option>
                    <%
                  	CategoryTypeDao sd=new CategoryTypeDao();
                  	List<CategoryTypeBean> list=sd.getAllCategoryType();
                  	
                  	for(CategoryTypeBean sb:list)
                  	{
                  		if(sb.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb.getCat_type_id() %>"><%=sb.getCat_type_name() %></option>
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
               <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valqnt">
		  			<label class="form-control valbg" id="txtqnt">Enter State</label>
                  </div>
              </div>
          </div>
              
                           <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valtypenm">
		  			<label class="form-control valbg" id="txttypenm">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
        
			  
		  <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="category" name="main" class="form-control" required="required">
                  	<option value="Category">Main Category Type</option>
                  	<%
                  	MainCategoryDao sd1=new MainCategoryDao();
                  	List<MainCategoryBean> list1=sd1.getAllMainCategory();
                  	
                  	for(MainCategoryBean sb1:list1)
                  	{
                  		if(sb1.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb1.getMain_cat_id()%>"><%=sb1.getMain_cat_name()%></option>
                  	<%
                  		}
                  	}
                  	%>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="sub-category" name="sub" class="form-control" required="required">
                  	<option value="Sub-Category">Sub Category Type</option>
                  	<%
                  	SubCategoryDao sd2=new SubCategoryDao();
                  	List<SubCategoryBean> list2=sd2.getAllSubCategory();
                  	
                  	for(SubCategoryBean sb2:list2)
                  	{
                  		if(sb2.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb2.getSub_cat_id()%>"><%=sb2.getSub_cat_name()%></option>
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
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcatnm">
		  			<label class="form-control valbg" id="txtcatnm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valsubnm">
		  			<label class="form-control valbg" id="txtsubnm">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
			  

       
      <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
            
                  <select style="height:49px;" id="size" name="size" class="form-control" required="required">
                    <option value="Size">Select Size</option>
                    <%
                  	SizeDao sd3=new SizeDao();
                  	List<SizeBean> list3=sd3.getAllSize();
                  	
                  	for(SizeBean sb3:list3)
                  	{
                  		if(sb3.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb3.getSizeid()%>"><%=sb3.getSize()%></option>
                  	<%
                  		}
                  	}
                  	%></select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="color" name="color" class="form-control" required="required">
                    <option value="Color">Select Color</option>
                    <%
                  	ColorDao sd4=new ColorDao();
                  	List<ColorBean> list4=sd4.getAllColor();
                  	
                  	for(ColorBean sb4:list4)
                  	{
                  		if(sb4.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb4.getCid()%>"><%=sb4.getCnm()%></option>
                  	<%
                  		}
                  	}
                  	%></select>
                </div>
              </div>
            </div>
      </div>   
      

				 <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valsizenm">
		  			<label class="form-control valbg" id="txtsizenm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcolnm">
		  			<label class="form-control valbg" id="txtcolnm">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
			  
		

      <div class="form-group">         
          <div class="form-row">
            <div class="col-md-6">
              <div class="form-label-group">
                <select style="height:49px;" id="mat" name="material" class="form-control" required="required">
                    <option value="Material">Select Material</option>
                    <%
                  	MaterialDao sd7=new MaterialDao();
                  	List<MaterialBean> list7=sd7.getAllMaterial();
                  	
                  	for(MaterialBean sb7:list7)
                  	{
                  		if(sb7.getStatus() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb7.getMid()%>"><%=sb7.getMname()%></option>
                  	<%
                  		}
                  	}
                  	%></select>
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-label-group">
                <input type="text" id="descrp" name="des" class="form-control" placeholder="Description" required="required">
                <label for="descrp">Description</label>
              </div>
            </div>
            </div>
      </div>
	  
		    <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valmatnm">
		  			<label class="form-control valbg" id="txtmatnm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              </div>
        
      <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="Vendor" name="vendor" class="form-control" required="required">
                    <option value="Vendor">Vendor</option>
                    <%
                  	VendorDao sd5=new VendorDao();
                  	List<VendorBean> list5=sd5.getAllVendor();
                  	
                  	for(VendorBean sb5:list5)
                  	{
                  		if(sb5.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb5.getV_id()%>"><%=sb5.getF_nm()%> <%=sb5.getL_nm()%></option>
                  	<%
                  		}
                  	}
                  	%>
                    </select>
                </div>
              </div>
            <div class="col-md-6">
              <div class="form-label-group">
                <input type="number" min="0" id="price" name="price" class="form-control" placeholder="Price" required="required">
                <label for="price">Price</label>
              </div>
            </div>
            </div>
      </div>
      
       <div class="form-group">
		    <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valvennm">
		  			<label class="form-control valbg" id="txtvennm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valprice">
		  			<label class="form-control valbg" id="txtprice">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
			  

 
		<div class="form-group">
			<div class="form-row">
			
			  <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="shop" name="shop" class="form-control" required="required">
                    <option value="Shop">Shop</option>
                  	<%
                  	ShopDao sd6=new ShopDao();
                  	List<ShopBean> list6=sd6.getAllShop();
                  	
                  	for(ShopBean sb6:list6)
                  	{
                  		if(sb6.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb6.getBid()%>"><%=sb6.getBnm()%></option>
                  	<%
                  		}
                  	}
                  	%>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
            <label for="inputimage"></label>
			 <input type='file' id ="inputimage" name="image" class="form-control" onchange="readURL(this);" />
	        		  
    <img id="blah" src="#" alt="Your image" />	
    
	</div>
	</div>
	</div>
	</div>
	</div>
	
		<div class="form-group">         
          <div class="form-row">   		
              <div class="col-md-6">
              <div class="form-label-group">
                  <div class="script1" id="valshopnm">
		  			<label class="form-control valbg" id="txtshopnm">Enter State</label>
                  </div>
             </div>
              </div>
               
               
				<div class="col-md-6">
              	<div class="form-label-group">
              
      		   	<div class="script1" id="valimg">
          				<label class="form-control valbg" id="txtimg">Enter Email</label>
		 			 </div>
		  		</div>
      			</div>
      			</div>
      			</div>
      	</div>
      	</div>
      	</div>
      	</div>		
      
			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
		   <button type="submit" class="btn btn-primary btn-block" name="action" value="insert" href="#" formnovalidate>ADD</button>		                         
		      </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		         <button type="reset" class="btn btn-primary btn-block">Reset</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewProduct.jsp">CANCEL</a>
            </div>
          </div>
      </div>
		
      </form>
        
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
  
  <script type="text/javascript">
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#blah')
                  .attr('src', e.target.result)
                  .width(150)
                  .height(200);
          };

          reader.readAsDataURL(input.files[0]);
      }
  }

  </script>
  <jsp:include page="productvalidate.jsp"></jsp:include>
  </body>



<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    