<%@page import="com.bean.SubCategoryBean"%>
<%@page import="com.dao.SubCategoryDao"%>
<%@page import="com.bean.MainCategoryBean"%>
<%@page import="com.dao.MainCategoryDao"%>
<%@page import="com.bean.VendorBean"%>
<%@page import="com.dao.VendorDao"%>
<%@page import="com.bean.MaterialBean"%>
<%@page import="com.dao.MaterialDao"%>
<%@page import="com.bean.SizeBean"%>
<%@page import="com.dao.ColorDao"%>
<%@page import="com.bean.ColorBean"%>
<%@page import="com.dao.SizeDao"%>
<%@page import="com.bean.CategoryTypeBean"%>
<%@page import="com.dao.CategoryTypeDao"%>
<%@page import="com.bean.ShopBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ShopDao"%>
<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% ProductBean pb = (ProductBean) request.getAttribute("id"); %>

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
          <li class="breadcrumb-item active">Update Product</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Update Product</div>
      <div class="card-body">
        <form method="post" id="myform" onsubmit="return validate()" action="productcontroller" enctype="multipart/form-data">
        
        
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= pb.getProdid() %>>
                </div>
              </div>
          </div>
          </div> 
        
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="name" id="name" value=<%= pb.getProdnm() %> class="form-control" placeholder="Name" required="required">
                  <label for="name">Name</label>
                </div>
              </div>
              <div class="col-md-6">
              <div class="form-label-group">
                <input type="text" id="code" name="code" value=<%= pb.getCode() %>  class="form-control" placeholder="Quantity" required="required">
                <label for="code">Code</label>
              </div>
            </div>
          
            </div>
          </div>
	
		   <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="namechng">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="codechng">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valpnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtpnm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcode">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcode">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
    	       
		  <div class="form-group">	
            <div class="form-row">	  
			  <div class="col-md-6">
              <div class="form-label-group">
                <input type="number" name="qty" id="qty" min="1"  value=<%= pb.getQty() %> class="form-control" placeholder="Quantity" required="required">
                <label for="qty">Quantity</label>
              </div>
            </div>
			  <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cattype" id="cattype" name="type" class="form-control" required="required">
                    <%
                  	CategoryTypeDao sd=new CategoryTypeDao();
                  	List<CategoryTypeBean> list9=sd.getAllCategoryType();
                  	
                  	for(CategoryTypeBean sb:list9)
                  	{
                  		if(sb.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb.getCat_type_id() %>" <%if(pb.getTypeid() == sb.getCat_type_id()) out.println("selected"); %>> <%=sb.getCat_type_name() %></option>
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
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="qtychng">Change 
                  </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="typechng">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
            		<div class="col-md-6">
		               <div class="form-label-group">
		            	  <div class="script1" id="valqnt">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtqnt">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valtype">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txttype">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
    	
		
	<div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="category" name="category" class="form-control" required="required">
                  	<%
                  	MainCategoryDao sd1=new MainCategoryDao();
                  	List<MainCategoryBean> list1=sd1.getAllMainCategory();
                  	
                  	for(MainCategoryBean sb1:list1)
                  	{
                  		if(sb1.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb1.getMain_cat_id()%>" <%if(pb.getMainid() == sb1.getMain_cat_id()) out.println("selected"); %>> <%=sb1.getMain_cat_name()%></option>
                  	<%
                  		}
                  	}
                  	%>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="sub-category" name="sub-category" class="form-control" required="required">
                  	<%
                  	SubCategoryDao sd2=new SubCategoryDao();
                  	List<SubCategoryBean> list2=sd2.getAllSubCategory();
                  	
                  	for(SubCategoryBean sb2:list2)
                  	{
                  		if(sb2.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb2.getSub_cat_id()%>" <%if(pb.getSubid() == sb2.getSub_cat_id()) out.println("selected"); %>> <%=sb2.getSub_cat_name()%></option>
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
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="catchng">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="subchng">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcatnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcatnm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valsubnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtsubnm">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
    
	    		  
      
    <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
            
                  <select style="height:49px;" id="size" name="size" class="form-control" required="required">
                    <%
                  	SizeDao sd3=new SizeDao();
                  	List<SizeBean> list3=sd3.getAllSize();
                  	
                  	for(SizeBean sb3:list3)
                  	{
                  		if(sb3.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb3.getSizeid()%>" <%if(pb.getSizeid() == sb3.getSizeid()) out.println("selected"); %>> <%=sb3.getSize()%></option>
                  	<%
                  		}
                  	}
                  	%></select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="color" name="color" class="form-control" required="required">
                    <%
                  	ColorDao sd4=new ColorDao();
                  	List<ColorBean> list4=sd4.getAllColor();
                  	
                  	for(ColorBean sb4:list4)
                  	{
                  		if(sb4.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb4.getCid()%>" <%if(pb.getColorid() == sb4.getCid()) out.println("selected"); %>> <%=sb4.getCnm()%></option>
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
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="sizechng">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="colchng">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valsizenm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtsizenm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcolnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcolnm">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
    	
			  
   <div class="form-group">         
          <div class="form-row">
            <div class="col-md-6">
              <div class="form-label-group">
                <select style="height:49px;" id="mat" name="mat" class="form-control" required="required">
                    <%
                  	MaterialDao sd7=new MaterialDao();
                  	List<MaterialBean> list7=sd7.getAllMaterial();
                  	
                  	for(MaterialBean sb7:list7)
                  	{
                  		if(sb7.getStatus() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb7.getMid()%>" <%if(pb.getMatid() == sb7.getMid()) out.println("selected"); %>> <%=sb7.getMname()%></option>
                  	<%
                  		}
                  	}
                  	%></select>
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-label-group">
                <input type="text" id="descrp" name="descrp" class="form-control" placeholder="Description" required="required">
                <label for="descrp">Description</label>
              </div>
            </div>
            </div>
      </div>
	  
	   <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="matchng">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="deschng">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valmatnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtmatnm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valdes">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtdes">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
           
  <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="Vendor" name="vendor" class="form-control" required="required">
                    <%
                  	VendorDao sd5=new VendorDao();
                  	List<VendorBean> list5=sd5.getAllVendor();
                  	
                  	for(VendorBean sb5:list5)
                  	{
                  		if(sb5.getActive() == 1)
                  		{	
                  	%>
                  	<option value="<%=sb5.getV_id()%>" <%if(pb.getVenid() == sb5.getV_id()) out.println("selected"); %>> <%=sb5.getF_nm()%> <%=sb5.getL_nm()%></option>
                  	<%
                  		}
                  	}
                  	%>
                    </select>
                </div>
              </div>
            <div class="col-md-6">
              <div class="form-label-group">
                <input type="number" value=<%= pb.getPrice() %> min="0" id="price" name="price" class="form-control" placeholder="Price" required="required">
                <label for="price">Price</label>
              </div>
            </div>
            </div>
      </div>
    

    
	   <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" id="venchng" name="change" value="change">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" id="pricechng" name="change" value="change" >Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valvennm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtvennm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valprice">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtprice">Enter lname</label>
				  			</div>
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
                  	List<ShopBean> list=sd6.getAllShop();
                  	
                  	for(ShopBean sb6:list)
                  	{
                  		if(sb6.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb6.getBid()%>"<%if(pb.getBranchid() == sb6.getBid()) out.println("selected"); %>> <%=sb6.getBnm()%></option>
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
      		<img height="50" width="50" id="blah" src="upload/<%= pb.getImg() %>" alt="Your image" />	
    
	</div>
	</div>
	</div>
	</div>
	
    		    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="shopchng">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" id="imgchng" name="change" value="change">Change
                 </div>
              </div>
          </div>
          </div>
    
        
        <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valshopnm">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtshopnm">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
          		   		<div class="script1" id="valimg">
          				<div class="form-group">
		  			<label class="form-control valbg" id="txtimg">Enter Email</label>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
    
      
			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
			   <button type="submit" name="action" value="save" class="btn btn-primary btn-block" href="common.jsp" formnovalidate onclick="validate();">SAVE</button>		                         
	        </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		        <button type="reset" class="btn btn-primary btn-block" >Reset</button>
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
  <jsp:include page="updateproductvalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    