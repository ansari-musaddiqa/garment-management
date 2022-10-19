<%@page import="com.bean.CityBean"%>
<%@page import="com.bean.StateBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StateDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% CityBean cb = (CityBean) request.getAttribute("id"); %>

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
            <a href="#">ADDRESS</a>
          </li>
          
          <li class="breadcrumb-item active">Update City</li>
        </ol>
           
       <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Update City</div>
      <div class="card-body">
        <form action="citycontroller" method="post" onSubmit="return validate()">
       
       		<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value ="<%= cb.getCid() %>">
                </div>
              </div>
          </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="cityName" class="form-control" placeholder="cityName" name="updatecity" value=<%= cb.getCnm() %> required="required" autofocus="autofocus">
                  <label for="cityName">City name</label>
                </div>
              </div>
              <div id="cmb" class="col-md-6">
                <div class="form-label-group">
                  <select name="stateName" disabled id="stateName" class="form-control cmb" placeholder="State Name" required="required" autofocus="autofocus" style="height:49px;">
                  	
                  	<option value="State Name">State Name</option>
                  	<%
                  	StateDao sd=new StateDao();
                  	List<StateBean> list=sd.getAllState1();
                  	
                  	for(StateBean sb:list)
                  	{
                  			if(sb.getStatus()==1)
                  			{
                  	%>
                  	<option value="<%=sb.getSid()%>" <%if(cb.getSid() == sb.getSid()) out.println("selected"); %>>
                  		<%= sb.getSnm() %>
                  	</option>
                  	<%
                  			}
                  	}
                  	%>
                  </select>
                 <!-- <label for="StateName">State name</label> -->
                </div>
              </div>
          </div>
          </div>
        
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" id="citychng" name="change" value="change">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" id="statechng" name="change" value="change">Change 
                  </div>
              </div>
          </div>
          </div>
        
          		    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcitynm">
		  			<label class="form-control valbg" id="txtcitynm">Enter City</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valstatenm">
		  			<label class="form-control valbg" id="txtstatenm">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
         
		<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
		 		<button type="submit" class="btn btn-primary btn-block" formnovalidate value="Save" name="action">SAVE</button>		            
		    </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		         <button type="reset" class="btn btn-primary btn-block">RESET</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewCity.jsp">CANCEL</a>
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
  <jsp:include page="updatecityvalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>