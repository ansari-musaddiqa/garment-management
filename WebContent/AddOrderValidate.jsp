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
		var pro=document.getElementById('code').value;
		var qty=document.getElementById('qty').value;
		var job=document.getElementById('job_work_type').value;
		var ch=document.getElementById('charge').value;
		
		if(option1.checked==true)
		{
			if( ch == "")
			{
				$("#valch").show();
				document.getElementById("txtch").innerHTML="*Required";
				document.getElementById("charge").focus();
				f++;
			}
			else
			{
				$("#valch").hide();
			}

			if( job == "job_work_type")
			{
				$("#valjob").show();
				document.getElementById("txtjob").innerHTML="*Required";
				document.getElementById("job_work_type").focus();
				f++;
			}
			else
			{
				$("#valjob").hide();
			}
			
		}
		else
		{
			$("#valjob").hide();
			$("#valch").hide();
		}

		
		if(qty == "")
		{
			$("#valqty").show();
			document.getElementById("txtqty").innerHTML="*Required";
			document.getElementById("qty").focus();
			f++;
		}
		else
		{
			$("#valqty").hide();	
		}
		
		if(pro == "Code")
		{
			$("#valpro").show();
			document.getElementById("txtpro").innerHTML="*Required";
			document.getElementById("code").focus();
			f++;
		}
		else
		{
			$("#valpro").hide();
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
	
	
	function validate1()
	{
		//alert("hyy");
		var f=0;
		var cus=document.getElementById('custname').value;
		var emp=document.getElementById('orderassign').value;
		var rtd=document.getElementById('returndt').value;
		var paid=document.getElementById('rcvpmnt').value;
		var tot=document.getElementById('ttlpmnt').value;
		
		if(tot == "")
		{
			$("#valtot").show();
			document.getElementById("txttot").innerHTML="*Please Enter Total Amount";
			document.getElementById("ttlpmnt").focus();
			f++;
		}
		else
		{
			$("#valtot").hide();	
		}
		
		var pat=/^[0-9]*$/;
		
		if(paid == "")
		{
			$("#valpaid").show();
			document.getElementById("txtpaid").innerHTML="*Please Enter Recieved Amount";
			document.getElementById("rcvpmnt").focus();
			f++;
		}
		else if(!(pat.test(paid)))
		{
			$("#valpaid").show();
			document.getElementById("txtpaid").innerHTML="*Please Enter Price";
			document.getElementById("rcvpmnt").focus();
			f++;		
		}
		else
		{
			$("#valpaid").hide();
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
		
		if(emp == "Order Assigned By")
		{
			$("#valemp").show();
			document.getElementById("txtemp").innerHTML="*Please Select an Employee";
			document.getElementById("orderassign").focus();
			f++;
		}
		else
		{
			$("#valemp").hide();
		}
	
		if(cus == "Customer Name")
		{
			$("#valcus").show();
			document.getElementById("txtcus").innerHTML="*Please Select a Customer";
			document.getElementById("custname").focus();
			f++;
		}
		else
		{
			$("#valcus").hide();
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