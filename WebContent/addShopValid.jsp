<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				$(".script1").hide();
				document.getElementById("branchName").focus();
		});
		
		function validate()
		{
			var flag=0,flag1=0,flag2=0,flag3=0;
			var add=document.getElementById('address').value;
			var num=document.getElementById('contactNumber').value;
			var bnm=document.getElementById('branchName').value;
			 
			
			if(add == "")
			{
				$("#valadd").show();
				document.getElementById("txtadd").innerHTML="*this is a required field";
				document.getElementById("address").focus();
				flag1=0;
			}
			else
			{
				$("#valadd").hide();
				flag1=1;
			}
			
			if(num == "")
			{
				$("#valcontact").show();
				document.getElementById("txtcontact").innerHTML="*this is a required field";
				document.getElementById("contactNumber").focus();
				flag2=0;		
			}
			else if(!(/^[0-9]*$/.test(num)))
			{
				$("#valcontact").show();
				document.getElementById("txtcontact").innerHTML="*enter only numbers";
				document.getElementById("contactNumber").focus();
				flag2=0;	
			}
			else
			{
				$("#valcontact").hide();
				flag2=1;
			}
			
			if(bnm == "")
			{
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*this is a required field";
				document.getElementById("branchName").focus();
				flag3=0;	
			}
			else
			{
				$("#valufname").hide();
				flag3=1;
			}
			
			if(flag1 == 0 || flag2 == 0 || flag3 == 0)
			{
				flag=0;
			}
			else
			{
				flag=1;
			}
		if(flag == 0)
		{
			return false;	
		}
		else
		{
			return true;
		}
		}
	</script>