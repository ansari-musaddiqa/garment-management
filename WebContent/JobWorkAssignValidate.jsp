<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
	});
		
	function validate()
	{
		//alert("hyy");
		var f=0;
		var jobw=document.getElementById('job_worker').value;
		var rtd=document.getElementById('returndt').value;
		var ch=document.getElementById('charges').value;
		var paid=document.getElementById('paidamt').value;
		
		
		
var pat=/^[0-9]*$/;
		
		if(paid == "")
		{
			$("#valpaid").show();
			document.getElementById("txtpaid").innerHTML="*Please Enter Recieved Amount";
			document.getElementById("paidamt").focus();
			f++;
		}
		else if(!(pat.test(paid)))
		{
			$("#valpaid").show();
			document.getElementById("txtpaid").innerHTML="*Please Enter Price";
			document.getElementById("paidamt").focus();
			f++;		
		}
		else
		{
			$("#valpaid").hide();
		}
		
		if(ch == "")
		{
			$("#valch").show();
			document.getElementById("txtch").innerHTML="*Please Enter Charge";
			document.getElementById("charges").focus();
			f++;
		}
		else if(!(pat.test(ch)))
		{
			$("#valch").show();
			document.getElementById("txtch").innerHTML="*Please Enter Charge";
			document.getElementById("charges").focus();
			f++;
		}
		else
		{
			$("#valch").hide();	
		}
		
		if(rtd == "")
		{
			$("#valrdt").show();
			document.getElementById("txtrdt").innerHTML="*Please Enter Return date";
			document.getElementById("returndt").focus();
			f++;
		}
		else
		{
			$("#valrdt").hide();
		}
		
		if(jobw == "job_worker")
		{
			$("#valjobw").show();
			document.getElementById("txtjobw").innerHTML="*Please Select a Worker";
			document.getElementById("job_worker").focus();
			f++;
		}
		else
		{
			$("#valjobw").hide();	
		}
			
		
		if(f>0)
			{
				return false;
			}
		else
			{
				return true;
			}
	}
</script>