<%@page import="com.bean.ShopBean"%>
<%@page import="com.dao.ShopDao"%>
<%@page import="com.bean.TypeOfWorkBean"%>
<%@page import="com.dao.TypeOfWorkDao"%>
<%@page import="com.bean.JobTypeBean"%>
<%@page import="com.dao.JobTypeDao"%>
<%@page import="com.bean.StateBean"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
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
            <a href="dashboard.jsp">DSAHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">USERS</a>
          </li>
          <li class="breadcrumb-item active">Register</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Register</div>
      <div class="card-body">
        
        <form onSubmit="return validate()" action="registercontroller" method="post" enctype="multipart/form-data">
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
				<input type="text" id="empfName" name="fname" class="form-control" placeholder="First Name" required="required" autofocus="autofocus" onblur="">
                <label for="empfName">First Name</label>
                </div>
               </div> 
              
            
              
              <div class="col-md-6">
                <div class="form-label-group">
				<input type="text" id="emplName" name="lname" class="form-control" placeholder="Name" required="required" autofocus="autofocus" onblur="nameVal()">
                  <label for="emplName" >Last Name</label>
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
                  <textarea  rows="3" id="address" name="add" class="form-control" placeholder="Address" required="required"></textarea>
                  <label for="address">Address</label>
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
                  <select id="cityName" name="cityname" class="form-control" placeholder="City Name" required="required" autofocus="autofocus">
           			<option value="City Name">City Name</option> 
                   <%
                     	CityDao cd = new CityDao();
                		List<CityBean> list = cd.getAllState();
                		  
                		 for(CityBean cb : list)
                		 {
                	%> 
           				<option value="<%=cb.getCid()%>"><%=cb.getCnm()%></option>
           		
           			<% System.out.println("jsp "+cb.getCid());
                			 }
                			
           			%>
                  </select>
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="form-label-group">
                  <select id="stateName" name="statename" class="form-control" placeholder="State Name" required="required" autofocus="autofocus" onblur="comStaVal()">
                   	<option value="State Name">State Name</option>
                   	<%
                     	StateDao sd = new StateDao();
                		List<StateBean> lst = sd.getAllState1();
                		  
                		 for(StateBean sb : lst)
                		 {
                   %> 
           				<option value="<%=sb.getSid()%>"><%=sb.getSnm() %></option>
           			<%
                		 }
           			%> 	
                  </select>
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
                  <input type="text" id="contactNumber" name="contact" class="form-control" placeholder="contact Number" required="required" onblur="conVal()">
                  <label for="contactNumber">Contact Number</label>
                </div>
              </div>
               
          
                  
          	<div class="col-md-6">    
              <div class="form-label-group">
              <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">Email address</label>
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
	
	        <div class="form-row">
		               <div class="col-md-6">
             			 <div class="form-label-group">
                  			<div class="script1" id="valshopnm">
		  					<label class="form-control valbg" id="txtshopnm">Enter Shop</label>
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
				<input type="text" id="userName" name="uname" class="form-control" placeholder="User Name" required="required" autofocus="autofocus">
                  <label for="userName">User Name</label>        
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
			                 		   			<input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" required="required">
			              						<label for="inputPassword">Password</label>
			       				     </div>
              					</div>
          
					          	<div class="col-md-6">    
					              <div class="form-label-group">
					          	  <input type="password" id="confPass" name="conpass" class="form-control" placeholder="Confirm Password" required="required">
					              <label for="confPass">Confirm Password</label>
					           </div>
					          </div>
           				 </div>
           </div>
          			 	<div class="form-row">
		           			 <div class="col-md-6">
				                <div class="form-label-group">				
									<div class="script1" id="valupass">
									  		<label class="form-control valbg" id="txtpass">Enter password</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
				                <div class="form-label-group">				
									<div class="script1" id="valconpass">
									  		<label class="form-control valbg" id="txtconpass">Enter confirmpassword</label>
									</div>
								</div>
							</div>
						  </div>


		  
	
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select name="empType" id="empType" class="form-control" placeholder="Emp Type" required="required" autofocus="autofocus" onchange="getval(this);">
				  		<option value="Emp Type">Emp Type</option>
				  		
				  		<%
				  			JobTypeDao jd = new JobTypeDao();
					        List<JobTypeBean> job = jd.getAllJobType();
					        
					        for(JobTypeBean jb : job)
					        {
				  		%>
				  		
				  		<option value="<%=jb.getJob_type_id()%>" id="jobt"><%=jb.getJob_name() %></option>
				  
				  		<%
					        }
				  		%>
                  </select>
                </div>
              </div>
              
              <div id="job" class="col-md-6">
                <div class="form-label-group">
                  <select id="jobworkType_id" name="jobworktype_name" class="form-control" placeholder="jobworkType" required="required" autofocus="autofocus">
                    	<option value="0">JobWork Type</option>
                    	<%
				  			TypeOfWorkDao td  = new TypeOfWorkDao();
					        List<TypeOfWorkBean> wrk = td.getAllTypeOfWork();
					        
					        for(TypeOfWorkBean tb : wrk)
					        {
				  		%>
				  		
				  		<option value="<%=tb.getWork_id()%>"><%=tb.getWork_name() %></option>
				  		<%
					        }
				  		%>
                  </select>
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
				
 				
 		  <div class="form-group">
           <div class="form-row">
              <div class="col-md-4">
                <div class="form-label-group">
 		         <button type="submit" class="btn btn-primary btn-block" href="common.jsp" name="action" value="insert" formnovalidate >Add</button>
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
   <script typeQ="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello");
		$("#job").hide();
		//$("#joberr").hide();
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
		var temp=sel.value;
		//var temp=sel.innerHTML;
		//alert(sel.value);
		//alert(temp);
		if(temp == "12")
		{
			$("#job").show(200);
		}
		else
		{
			//alert("musaddiqa");
			$("#job").hide(200);
			//$("$valuejobtype").hide();
		}
	}
</script>
	<jsp:include page="registerValidation.jsp"></jsp:include>   
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    