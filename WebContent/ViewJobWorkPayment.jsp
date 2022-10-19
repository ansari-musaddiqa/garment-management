<%@page import="com.bean.RegisterBean"%>
<%@page import="com.dao.RegisterDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OrderBean"%>
<%@page import="com.dao.OrderDao"%>
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

    <jsp:include page="sidebar.jsp"></jsp:include>
    
    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item active">Job-Worker Details</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            Job-Worker Details
          </div>
          	<div class="card-body">
			
          <div class="table-responsive">
              <table class="table table-bordered tbl_pro" id="dataTable">
                   <thead>
                  <tr>
                  	<th>Id</th>
                  	<th>status</th>
                  	<th>Order_Details_ID</th>
                  	<th>worker_name</th>
                  	<th>work_name</th>
                  	<th>Date_of_return</th>
                    <th>Total_charges</th>
                    <th>Paid_amount</th>
                    <th>Due_amount</th>
                    <th>Description</th>
                    <th>update</th>
                   	<th>complete</th>
                   	</tr>
                </thead>
                <tbody>
              <%
              	OrderDao dao=new OrderDao();
                List <OrderBean> l=dao.getWokerPaymentDetails();
                for(OrderBean b:l)
                {
              %>
          
                  <tr>
                  	<td><%=b.getJobworker_pay_id() %></td> 
                  	<%
                  		if(b.getIsactive()==1)
                  		{
                  		%>
                  			<td>complete</td>
                  		<% 
                  		}
                  		else
                  		{
                  		%>
                  			<td>running</td>
                  		<% 
                  		}
                  	%>
                  	
                  	
                  	
                  	
                  	<td><%=b.getOrder_d_id()%></td>
                  	<td><%=b.getWorker_name()%></td>
                  	<td><%=b.getJob_work_type_name()%></td>
                  	<td><%=b.getDate_of_return()%></td>
                  	<td><%=b.getWorker_charges()%></td>
                  	<td><%=b.getWorker_paid_amt()%></td>
                  	<td><%=b.getDue_payment() %></td>
                  	<td><%=b.getDescription()%></td> 	
<td>			
							  <div class="container">
							  <!-- Button to Open the Modal -->
												<%						          
						          	     		if(b.getIsactive()==1)
						     					     		{
						     					%>
						     				<form action="ordercontroller" method="post">
						     				<input type="hidden" name="id" value="<%=b.getJobworker_pay_id()%>">
									      		<button type="submit" name="action" value="updatejobwork" class="btn btn-primary" data-toggle="modal" data-target="#myModal" disabled>
												    update
												  </button>
							  				</form>
							 					     	<% 
						     					     		}
						     					     		else
						     					     		{
						     					     	%>
						      				<form action="ordercontroller" method="post">
						     					<input type="hidden" name="id" value="<%=b.getJobworker_pay_id()%>">
									      		<button type="submit" name="action" value="updatejobwork" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
												    update
												 </button>
							  				</form>
							 									        <%	
						     					     		}
						     					     	%>
						   
						  <!-- The Modal -->
  		  			  <!-- The Modal -->
						  <div class="modal" id="myModal">
						    <div class="modal-dialog">
						      <div class="modal-content">
						      
						        <!-- Modal Header -->
						        
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						        
						        <!-- Modal body -->
						        <div class="modal-body" style="padding: 3rem; margin-top: -20px;">
						           <div class="card card-register mx-auto mt-5">
						      			<div class="card-header heading">Customization</div>
						      				<div class="card-body">
						        
						        
						        				
						       <form action="ordercontroller" method="post"> 				
						       <div class="table-responsive">
						              <table class="table table-bordered tbl_pro">
						                <thead>
						                  <tr>
						                    <th>Job-Worker</th>
										    <td>
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
										    </td>
										    </tr>
										    <tr>
										    		<th>Date-Of-Return</th>
											    	<td>
								                 				<input type="date" name="returndt" id="returndt" class="form-control" placeholder="Date_Of_Return" required="required" autofocus="autofocus">
	     							             	</td>                 
							              </tr>
							              <tr> 
										    				<th>Job-Work-Charge</th>
										                   <td>   
									                     	 		<input type="text" id="charges" name="charges" class="form-control" placeholder="Charges" required="required">
									                      </td>
									        
										  </tr> 
						                  <tr>  
							     						   <th>paid_amount</th>
						                                   <td>
										                    		<input type="text" id="paidamt" name="paidamt" class="form-control" placeholder="Paid Amount" required="required">
										                   </td>
              
						                   </tr>
						                   <tr>
						                      <th>Description</th>
						                      		         <td >
										                    		<input type="text" id="descrp" name="descrp" class="form-control" placeholder="Descr" required="required">
										              		</td>
		                  						</tr>
		                  						<tr>	
		                  							<td style="border-right:none;"></td>
                  		
		                  							<td>
		                  							<div style="float:rigth">
						    						 	<input type="hidden" name = "id" value = "<%=b.getJobworker_pay_id()%>">
						    							<button type="submit" class="btn btn-primary" name="action" value="updatejobworkform" formnovalidate>update</button>		
						        					</div>
					               					</td>
					      			
						                    
						                 		 </tr>
						                </thead>
						             	</table>
						    				</div>
					      					</form>
					    			</div>
					          
					        	</div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer"></div>
					      </div>
					    </div>
					  </div>
					</div>                        			
                  	      
</td>
                  	<td>
                  		<form action="ordercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=b.getJobworker_pay_id()%>">
                  									     					     	<%
						     					     		if(b.getIsactive()==1)
						     					     		{
						     					     	%>
								                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="completeJobwork" disabled>
								                  				complete
								                  			</button>
						     					     	<% 
						     					     		}
						     					     		else
						     					     		{
						     					     	%>
									                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="completeJobwork">
									                  				complete
									                  			</button>
						     					        <%	
						     					     		}
						     					     	%>
						     					     	   
                  			
                  		</form>
                  	</td>
                  </tr>
                  <%
                }
                  %>
       			</tbody>
       	   	  </table>
       	     </div>
                 
            </div>
               
          </div>
        </div>
        
        
      </div>
      <!-- /.container-fluid -->

      <jsp:include page="footer.jsp"></jsp:include>
      
    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="script.jsp"></jsp:include>
  
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>