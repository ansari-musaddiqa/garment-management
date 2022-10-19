<%@page import="com.bean.ShopBean"%>
<%@page import="com.bean.StateBean"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% ShopBean sb = (ShopBean) request.getAttribute("id"); %>
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
          <li class="breadcrumb-item active">Update Shop</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Update Shop</div>
      <div class="card-body">
        <form method="post" id="myform" onsubmit="return validate()" action="shopcontroller">
          
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= sb.getBid() %>>
                </div>
              </div>
          </div>
          </div> 
         

            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="branchName" name="branchname" value="<%= sb.getBnm() %>" class="form-control" placeholder="Branch Name" required="required" autofocus="autofocus">
                  <label for="branchName">Branch Name</label>
                </div>
              </div>
            
              <div class="col-md-6">
			       <div class="form-label-group">
			           <input type="text" id="contactNumber" name="num"  value="<%= sb.getNum() %>" class="form-control" placeholder="contact Number" required="required">
			              <label for="contactNumber">Contact Number</label>
	                </div>
	             </div>
		      </div>
        	  </div>
 
        
        <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="bncheck">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="numcheck">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valufname">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtfname">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcontact">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcontact">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
        
              <div class="form-group">
      				<div class="form-row">
           				<div class="col-md-12">
                			<div class="form-label-group">
			                  <textarea  rows="3" id="address" name="add"  class="form-control" placeholder="Address" required="required"></textarea>
			                  <label for="address">Address</label>
			                </div>
              			</div>
              		</div>
             </div>
              
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="addcheck">Change
                 </div>
              </div>
          </div>
          </div>
          
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <div class="script1" id="valadd">
		  			<label class="form-control valbg" id="txtadd">Enter Size</label>
		  		  </div>
                </div>
              </div>
         	</div>
		
  
          <div class="form-group">
            <div class="form-row">
             
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cityName" id="cityName" class="form-control" placeholder="City Name" required="required" >
 				<option value="City Name">City Name</option>	
                  <%
                  	CityDao cd=new CityDao();
                  	List<CityBean> list=cd.getAllState();
                  	
                  	for(CityBean cb:list)
                  	{
                  		
                  	%>
                  	<option value="<%=cb.getCid()%>" <%if(sb.getCid() == cb.getCid()) out.println("selected"); %>><%=cb.getCnm()%></option>
                  	<%
                  	}
                  	%>
                
                  </select>
                </div>
              </div>
                 
              <div class="col-md-6">
              		<div class="form-label-group">
                  	<select style="height:49px;" name="stateName" id="stateName" class="form-control" placeholder="State Name" required="required" autofocus="autofocus">
 				<option value="State Name">State Name</option>	
 		         <%
                  	StateDao sd=new StateDao();
                  	List<StateBean> list1=sd.getAllState1();
                  	
                  	for(StateBean sb1:list1)
                  	{
                  		
                  	%>
                  	<option value="<%=sb1.getSid()%>" <%if(sb.getSid() == sb1.getSid()) out.println("selected"); %>><%=sb1.getSnm()%></option>
                  	<%
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
                 <input type="checkbox" name="change" value="change" id="citycheck">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="statecheck">Change 
                  </div>
              </div>
          </div>
          </div>
          
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcity">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcity">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valstate">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtstate">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		<input type="hidden" value="<%= sb.getAdd()%>" id="hid">
		
        			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
 	           <button type="submit"  class="btn btn-primary btn-block" name="action" value="save" formnovalidate>SAVE</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		       <button type="reset" class="btn btn-primary btn-block" href="#">RESET</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewShop.jsp">CANCEL</a>
            </div>
          </div>
      </div>
		

          <!-- <a class="btn btn-primary btn" href="login.html">Submit</a>
          <a class="btn btn-primary btn" href="login.html">Reset</a> -->
  
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

  <!-- Logout Modal-->
    <!-- Bootstrap core JavaScript-->
  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="updateShopValid.jsp"></jsp:include>
  <script type="text/javascript">

  var temp1=document.getElementById("hid").value;
  document.getElementById("address").value=temp1;
  
  </script>  
  
  </body>
  
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    