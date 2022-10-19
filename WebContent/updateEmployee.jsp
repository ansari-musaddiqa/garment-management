<%@page import="com.dao.ShopDao"%>
<%@page import="com.bean.ShopBean"%>
<%@page import="com.dao.TypeOfWorkDao"%>
<%@page import="com.bean.TypeOfWorkBean"%>
<%@page import="com.dao.JobTypeDao"%>
<%@page import="com.bean.JobTypeBean"%>
<%@page import="com.bean.StateBean"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
<%@page import="com.bean.RegisterBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% RegisterBean bean=(RegisterBean)request.getAttribute("upid");%>
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
            <a href="#">USERS</a>
          </li>
          <li class="breadcrumb-item active">Update Employee</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <!-- <div class="card-header heading" >Register</div>-->
      <div class="card-header heading">Update Employee</div>
      <div class="card-body">
        <form id="myform" action="registercontroller" method="post"  onSubmit="return validate();" enctype="multipart/form-data">
        
       
       <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
					<input type="hidden" name="id" value="<%=bean.getEmp_id()%>">
                </div>
              </div>
        </div>
                   
        <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
				<input type="text" id="empfName" name="firstname" class="form-control" placeholder="First Name" required="required" autofocus="autofocus" value="<%=bean.getFirst_name()%>">
                  <label for="empfName">First Name</label>
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="form-label-group">
				<input type="text" id="emplName" name="lastname" class="form-control" placeholder="Name" required="required" autofocus="autofocus" value="<%=bean.getLast_name()%>">
                  <label for="emplName">Last Name</label>           
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
                  <textarea  rows="3" id="address" name="address" class="form-control" placeholder="Address" required="required"><%bean.getAddress(); %></textarea>
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
                     	CityDao cd = new CityDao();
                		List<CityBean> list = cd.getAllState();
                	  
                		 for(CityBean cb : list)
                		 {
                	%> 
           				<option value="<%=cb.getCid()%>" <%if(bean.getCity_id() == cb.getCid()) out.println("selected"); %>><%=cb.getCnm()%></option>
           		
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
                     	StateDao sd = new StateDao();	
                   	List<StateBean> lst = sd.getAllState1();
                		  
                		 for(StateBean sb : lst)
                		 {
                   %> 
           				<option value="<%=sb.getSid()%>" <%if(bean.getState_id() == sb.getSid()) out.println("selected"); %>>
           				<%=sb.getSnm() %>
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
                  <input type="text" id="contactNumber" name="contactnum" class="form-control" placeholder="contact Number" required="required" value="<%=bean.getPhoneno()%>">
                  <label for="contactNumber">Contact Number</label>
                </div>
              </div>
          
          	<div class="col-md-6">    
              <div class="form-label-group">
              <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required="required" value="<%=bean.getEmail()%>">
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
	
     
	      
		<div class="form-group">
			<div class="form-row">
			
			
				<div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="shop" name="shop" class="form-control" required="required">
                	<option value="Shop">Shop</option>
              
                   <%
                  	ShopDao sd6=new ShopDao();
                  	List<ShopBean> li=sd6.getAllShop();
                  	
                  	for(ShopBean sb6:li)
                  	{
                  		if(sb6.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb6.getBid()%>"<%if(bean.getShop_id() == sb6.getBid()) out.println("selected"); %>> <%=sb6.getBnm()%></option>
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
		    		<input type="hidden" name="hidimage" value="upload/<%=bean.getPhoto() %>">
		    		<img id="blah" src="upload/<%=bean.getPhoto() %>" alt="Your image" height="50" width="50"/>		 		    
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
                 <input type="checkbox" name="change" value="change" id="imgcheck">Change
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
		            	  <div class="script1" id="valuphoto">
				  			<label class="form-control valbg" id="txtphoto">Select photo</label>
				  		</div>
				  		</div>
				  	</div>
		 	</div>
	 
	
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
				  <input type="text" id="userName" name="username" class="form-control" placeholder="User Name" required="required" autofocus="autofocus" value="<%=bean.getUname()%>">
                  <label for="userName">User Name</label>
                </div>
              </div>
          </div>
          </div>
		  
		  
		      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="usercheck">Change
                 </div>
              </div>
          </div>
          </div>
       
		 
		            <div class="form-row">
		           			 <div class="col-md-12">
				                <div class="form-label-group">				 	 
						          <div class="script1" id="valusername">
								   		<label class="form-control valbg" id="txtuname">Enter user Name</label>
								  </div>
		  						</div>
		  					</div>
		  			</div>
		  
		   
	
	         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="empType" id="empType" class="form-control" placeholder="Emp Type" required="required" autofocus="autofocus" onchange="getval(this);">
				  <option value="Emp Type" class="n">Emp Type</option>
                 		<%
				  			JobTypeDao jd = new JobTypeDao();
					      
                 		List<JobTypeBean> job = jd.getAllJobType();
					        
					        for(JobTypeBean jb : job)
					        {
				  		%>
				  		
				  		<option value="<%=jb.getJob_type_id()%>" 
				  		id="jobt" <%if(bean.getJob_type_id()==jb.getJob_type_id()){out.println("selected");} %>>
				  		<%=jb.getJob_name() %>
				  		</option>
				  
				  		<%
					        }
				  		%>
                </select>
                </div>
              </div>
              
              <div id="job" class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="jobworkType" id="jobworkType" class="form-control" placeholder="jobworkType" required="required" autofocus="autofocus">
                	<option value="JobWork Type">JobWork Type</option>
                    	<%
				  			TypeOfWorkDao td  = new TypeOfWorkDao();    
                    	List<TypeOfWorkBean> wrk = td.getAllTypeOfWork();
					        
					        for(TypeOfWorkBean tb : wrk)
					        {
				  		%>
				  		
				  		<option value="<%=tb.getWork_id()%>" <%if(bean.getWork_id()==tb.getWork_id()){out.println("selected");} %>><%=tb.getWork_name() %></option>
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
                 <input type="checkbox" name="change" value="change" id="empcheck">Change
                 </div>
              </div>
		               <div id="jobc" class="col-md-6">
		                <div class="form-label-group checkchange">
		                 <input type="checkbox" name="change" value="change" id="jobcheck">Change 
		                </div>
		              </div> 
          </div>
          </div>
       
 					 <div class="form-row">
		           			 <div class="col-md-6">
				                <div class="form-label-group">
				            	  <div class="script1" id="valuemptype">
						  			<label class="form-control valbg" id="txtemptype">Enter employee type</label>
						  		</div>
						  		</div>
						  	</div>
						  	<div class="col-md-6">
				                <div class="form-label-group">
				            	  <div class="script1" id="valuejobtype">
						  			<label class="form-control valbg" id="textjobtype">Enter job type</label>
						  		</div>
						  		</div>
						  	</div>
					  </div>
			
 <input type="hidden" value="<%= bean.getAddress()%>" id="hid">
 		
 		 <div class="form-group">
           <div class="form-row">
		              <div class="col-md-4">
		                <div class="form-label-group">
		         			 <button type="submit" value="save" name="action" class="btn btn-primary btn-block" href="" formnovalidate>SAVE</button>
		          		</div>
		          	  </div>
		             
		             <div class="col-md-4">  
			           <div class="form-label-group"> 
			           <button type="reset" class="btn btn-primary btn-block">Reset</button>
			           </div>
			         </div>
		          
				          <div class="col-md-4">
				           <div class="form-label-group">
				          	<a class="btn btn-primary btn-block" href="ViewEmployees.jsp">Cancel</a>
				          </div>
		  				 </div>
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

  <!-- Logout Modal-->

  <!-- Bootstrap core JavaScript-->
  <jsp:include page="script.jsp"></jsp:include>
   <script type="text/javascript">
  
	$(document).ready
	(
		function(){
		//$(".job").hide();
		$("#valuejobtype").hide();
		});
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
	function getval(sel){
		if(sel.value == "6")
		{
			$("#job").show(200);
			$("#jobc").show();
		}
		else
		{
			$("#job").hide(200);
			$("#jobc").hide();
			
		}
	}
</script>

	<script type="text/javascript">
	  var temp1=document.getElementById("hid").value;
  	  document.getElementById("address").value=temp1;
  	</script>  
  
<jsp:include page="updateEmpValid.jsp"></jsp:include> 
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    