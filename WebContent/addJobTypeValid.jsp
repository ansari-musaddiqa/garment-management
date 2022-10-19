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
		var flag=0;
		//alert("Hyy");
		var nm=document.getElementById('JobType').value;
		//var pattern=/^[A-Za-z_- ]*$/;	
		//var pattern=/^[A-Za-z ]*$/;
		var pattern=/^[A-Za-z ]*$/;
			
		if(nm == "" )
		{
			$("#valjobtype").show();
			document.getElementById("txtjobtype").innerHTML="*this is a required field";
			document.getElementById("JobType").focus();
			flag++;
		}
		else if(!(pattern.test(nm)))
		{
			$("#valjobtype").show();
			document.getElementById("txtjobtype").innerHTML="*Please enter valid employee type";
			document.getElementById("JobType").focus();
			flag++;
		}
		else
		{
			$("#valjobtype").hide();	
		}
		
		
		if(flag>0)
			{
				return false;
			}
		else
			{
				return true;
			}
	}

</script>