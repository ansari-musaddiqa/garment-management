<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello");
		//$(".script1").hide();
		$(".script1").hide();
		$("#colorname").prop("disabled", true);
		$("#descrp").prop("disabled", true);
	});
	
	$("#colorcheck").change(function(){
		if(colorcheck.checked == true)
		{
			//alert("Hyy");
			$("#colorname").prop("disabled", false);
		}
		else
		{
			$("#colorname").prop("disabled", true);
		}
	});

	$("#descheck").change(function(){
		if(descheck.checked == true)
		{
			//alert("Hyy");
			$("#descrp").prop("disabled", false);
		}
		else
		{
			$("#descrp").prop("disabled", true);
		}
	});
	
	function validate()
	{
		flag=0;
		//alert("");
		if(colorcheck.checked == true)
		{	
			//alert("musaddiqa");
			var str = document.getElementById("colorname").value;
			if(str=="")
			{
				flag=1;
				//alert("hiii");
				$("#valuecolor").show();
				document.getElementById("txtcolor").innerHTML="*this is a required field";
				document.getElementById("colorname").focus();
			}
			else
			{
				flag=0;
				$("#valuecolor").hide();	
			}			
			
			if(flag==1)
				{
					return false;
				}
			else
				{
					return true;
				}
		}	
	}
</script>