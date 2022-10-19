<%@page import="com.bean.CityBean"%>
<%@page import="com.dao.CityDao"%>
<%@page import="com.bean.StateBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.VendorBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% VendorBean vb = (VendorBean) request.getAttribute("id"); %>
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
            <a href="#">USERS</a>
          </li>
          <li class="breadcrumb-item active">Update Vendor</li>
        </ol>
           
            <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Update Vendor</div>
      <div class="card-body">
        <form id="myform" onSubmit="return validate();" method="post" action="vendorcontroller">
          
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= vb.getV_id() %>>
                </div>
              </div>
          </div>
          </div> 
          
	    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="firstName" class="form-control" name="fname" value="<%=vb.getF_nm()%>" placeholder="First Name" required="required">
                  <label for="firstName">First Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="lastName" class="form-control" name="lname" value="<%=vb.getL_nm()%>" placeholder="Last Name" required="required">
                  <label for="lastName">Last Name</label>
                </div>
              </div>
            </div>
          </div>
 
    
    	    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="fncheck">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="lncheck">Change 
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
		            	  <div class="script1" id="valulname">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtlname">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
          
              <div class="form-group">
      <div class="form-row">
           <div class="col-md-12">
                <div class="form-label-group">
                  <textarea  rows="3" id="address" class="form-control" name="add" placeholder="Address" required="required"></textarea>
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
 
            <div class="form-row">
		              <div class="col-md-12">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuaddress">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtaddress">Enter Address</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>


              <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cityName" id="cityName" class="form-control" placeholder="City Name" required="required" autofocus="autofocus">
                   		<option value="City Name">City Name</option>
                   		<%
                  			CityDao cd=new CityDao();
                  			List<CityBean> city=cd.getAllState();
                  
                  			for(CityBean cb : city)
                  			{
                  				
                  		%>
                  			<option value="<%=cb.getCid()%>" <%if(vb.getC_id() == cb.getCid()) out.println("selected"); %>>
                  				<%= cb.getCnm() %>
                  			</option>
                  		<%
                  				
                  			}
                  		%>
                  </select>
                </div>
              </div>
               <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="stateName" id="stateName" class="form-control" required="required" autofocus="autofocus">
                   		<option value="State Name">State Name</option>
                   		<%
                  			StateDao sd=new StateDao();
                  			List<StateBean> list=sd.getAllState1();
                  	
                  			for(StateBean sb:list)
                  			{
                  				
                  		%>
                  			<option value="<%=sb.getSid()%>" <%if(vb.getS_id() == sb.getSid()) out.println("selected"); %>>
                  				<%= sb.getSnm() %>
                  			</option>
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
		            	  <div class="script1" id="valucity">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcity">Enter city</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valustate">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtstate">Enter state</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
		     
         
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="contactNumber" class="form-control" name="phn" value="<%=vb.getMo_no()%>" placeholder="contact Number" required="required">
                  <label for="contactNumber">Contact Number</label>
                </div>
              </div>
               <div class="col-md-6">
                <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" name="eml" value="<%=vb.getEmail()%>" placeholder="Email address" required="required">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
            </div>
          </div>


		    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="concheck">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="emailcheck">Change 
                  </div>
              </div>
          </div>
          </div>
       
                  <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valucontact">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcontact">Enter Contact number</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuemail">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtemail">Enter Email</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>

<input type="hidden" value="<%= vb.getAdres()%>" id="hid">

					<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
               <button type="submit" class="btn btn-primary btn-block" name="action" value="save" formnovalidate>SAVE</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		            <button type="reset" class="btn btn-primary btn-block">RESET</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewVendor.jsp">CANCEL</a>
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
  <jsp:include page="updateVendorValid.jsp"></jsp:include>
  <script type="text/javascript">

  var temp1=document.getElementById("hid").value;
  document.getElementById("address").value=temp1;
  </script>  
  
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>