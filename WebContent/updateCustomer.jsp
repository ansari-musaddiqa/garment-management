<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.StateBean"%>
<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
<%@page import="com.bean.CustomerBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% CustomerBean bean=(CustomerBean)request.getAttribute("id"); %>

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
         
          <li class="breadcrumb-item active">Update Customer</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Update Customer</div>
      <div class="card-body">
        <form id="myform" onSubmit="return validate();" method="post" action="customercontroller">
          
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= bean.getCustid() %>>
                </div>
              </div>
          </div>
          </div> 
        

            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="fname" id="firstName" class="form-control" placeholder="First Name" required="required" value="<%=bean.getFname()%>">
                  <label for="firstName">First Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="lname" id="lastName" class="form-control" placeholder="Last Name" required="required" value="<%=bean.getLname()%>" >
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
				  			<label class="form-control valbg" id="txtfname">Enter Fname</label>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valulname">
				  			<label class="form-control valbg" id="txtlname">Enter lname</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
    
        
              <div class="form-group">
      <div class="form-row">
           <div class="col-md-12">
                <div class="form-label-group">
                  <textarea  rows="3" name="add" id="address" class="form-control" placeholder="Address" required="required"></textarea>
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
				  			<label class="form-control valbg" id="txtaddress">Enter Address</label>
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
                  			<option value="<%=cb.getCid()%>" <%if(bean.getCid() == cb.getCid()) out.println("selected"); %>>
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
                  <select style="height:49px;" name="stateName" id="stateName" class="form-control" placeholder="State Name" required="required" autofocus="autofocus">
                          <option value="State Name">State Name</option>
                   		<%
                  			StateDao sd=new StateDao();
                  			List<StateBean> list=sd.getAllState1();
                  	
                  			for(StateBean sb:list)
                  			{
                  				
                  		%>
                  			<option value="<%=sb.getSid()%>" <%if(bean.getSid() == sb.getSid()) out.println("selected"); %>>
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
				  			<label class="form-control valbg" id="txtcity">Enter city</label>
				  		</div>
				  		</div>
				  	</div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valustate">
				  			<label class="form-control valbg" id="txtstate">Enter state</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
		
		
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="phn" id="contactNumber" class="form-control" placeholder="contact Number" required="required" value="<%=bean.getNum()%>">
                  <label for="contactNumber">contact Number</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
              <input type="email" name="eml" id="inputEmail" class="form-control" placeholder="Email address" required="required" value="<%=bean.getEmail()%>">
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
				  			<label class="form-control valbg" id="txtcontact">Enter Contact number</label>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuemail">
				  			<label class="form-control valbg" id="txtemail">Enter Email</label>
				  		</div>
				  		</div>
				  	</div>
			</div>

<input type="hidden" value="<%= bean.getAdd()%>" id="hid">

		  
          
			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
		       <button type="submit" class="btn btn-primary btn-block" name="action" value="save" formnovalidate>SAVE</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		      				  <button type="reset" class="btn btn-primary btn-block">Reset</button>
		</div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewCustomer.jsp">CANCEL</a>
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


  <!-- Bootstrap core JavaScript-->
  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="updateCustValid.jsp"></jsp:include>
   <script type="text/javascript">

  var temp1=document.getElementById("hid").value;
  document.getElementById("address").value=temp1;
  </script>  
  
  </body>

  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    