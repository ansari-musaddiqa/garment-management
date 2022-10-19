<%@page import="com.bean.RegisterBean"%>
<%@page import="com.dao.RegisterDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OrderBean"%>
<%@page import="com.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<% int forid=(int)request.getAttribute("ordeid"); %>
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
          <li class="breadcrumb-item">
            <a href="#">ORDER</a>
          </li>
			
          <li class="breadcrumb-item">
            <a href="#">Order-Details</a>
          </li>
			          
          <li class="breadcrumb-item active">Assign Job-Work</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header heading">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            Assign Job-Work
          </div>
          	<div class="card-body">
          	
          				                <form action="ordercontroller" method="post" onSubmit="return validate();"> 				
						                 
						                 <div class="form-group">         
								            <div class="form-row">
								              <div class="col-md-6">
								                <div class="form-label-group">
								          	    		<select name="job_worker" id="job_worker" class="form-control" required="required" autofocus="autofocus">
								                        <option value="job_worker">Job-Worker</option>
								                        		
															<%
																RegisterDao rd11 = new RegisterDao();
																List<RegisterBean> lst11 = rd11.getAllEmployees();
																
																for(RegisterBean b1 : lst11)
																{										
															%>    
																<option value="<%=b1.getEmp_id()%>">
																	<%=b1.getFirst_name() + " " + b1.getLast_name()%>
																</option>
															<%
																}
															%> 
								                      </select>
								                </div>
								              </div>
								              
								              
								              <div class="col-md-6">
								                <div class="form-label-group">
										        		<input type="date" name="returndt" id="returndt" class="form-control" placeholder="Date_Of_Return" required="required" autofocus="autofocus">
										        <label for="returndt">Return Date</label>
								                </div>
								              </div>
	
								            </div>
								          </div>
											
											
											
			<div class="form-group">
		            <div class="form-row">
		               <div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valjobw">
				  			<label class="form-control valbg" id="txtjobw">jobwork</label>
		                  </div>
		              	</div>
		           		</div>
		           		
		           		<div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valrdt">
				  			<label class="form-control valbg" id="txtrdt">date</label>
		                  </div>
		              	</div>
		           		</div>
		          </div>
				 </div>
        
        
									
									<div class="form-group">         
								            <div class="form-row">
								              <div class="col-md-6">
								                <div class="form-label-group">
										   		<input type="number" min=1 id="charges" name="charges" class="form-control" placeholder="Charges" required="required">
									       
										        <label for="charges">Job-Work_charges</label>
								                </div>
								              </div>
								              
								              
								              <div class="col-md-6">
								                <div class="form-label-group">
								                	<input type="number" min=1 id="paidamt" name="paidamt" class="form-control" placeholder="Paid Amount" required="required">
										        <label for="paidamt">Paid Amount</label>
								                </div>
								              </div>
	
								            </div>
								     </div>
								     
								     
		     <div class="form-group">
		            <div class="form-row">
		               <div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valch">
				  			<label class="form-control valbg" id="txtch">Charge</label>
		                  </div>
		              	</div>
		           		</div>
		           		
		           		<div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valpaid">
				  			<label class="form-control valbg" id="txtpaid">paid</label>
		                  </div>
		              	</div>
		           		</div>
		          </div>
			</div>
        
								     <div class="form-group">         
								            <div class="form-row">
								              <div class="col-md-6">
								                <div class="form-label-group">
												<input type="text" id="descrp" name="descrp" class="form-control" placeholder="Descr" required="required">
										        <label for="descrp">Description</label>
								                </div>
								              </div>
								              
								              
								              <div class="col-md-6">
								                <div class="form-label-group">
										        		        
								                </div>
								              </div>
	
								            </div>
								     </div>
								     
								     
								     
							     <div class="form-group">         
							          <div class="form-row">
							            <div class="col-md-4">
							            			 	<input type="hidden" name = "forid" value = "<%=forid%>">
													    <button type="submit" name="action" value="assign" class="btn btn-primary btn-block" formnovalidate>ADD</button>
								        </div>
							            <div class="col-md-4">
									  				  <button type="reset" class="btn btn-primary btn-block">Reset</button>
									    </div>
							            <div class="col-md-4">
												   <a class="btn btn-primary btn-block" href="ViewJobWorkPayment.jsp">CANCEL</a>
							            </div>
							          </div>
							      </div>
											</form>
						            	   
		   </div>
              
          </div>
        </div>
        
        
      </div>
      <!-- /.container-fluid -->

      <jsp:include page="footer.jsp"></jsp:include>
      
    </div>
    <!-- /.content-wrapper -->

  
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="JobWorkAssignValidate.jsp"></jsp:include>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>