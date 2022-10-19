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
			//alert("Hyy");
			var flag=0;
			var truenm="Gujarat";
			var statenm=document.getElementById('stateName').value;
			var pattern=/^[A-Z a-z]*$/
			if(statenm == "")
			{
				$("#valstatenm").show();
				$("#valup").hide();
				document.getElementById("txtstatenm").innerHTML="*this is a required field";
				document.getElementById("stateName").focus();
				flag=0;
			}
			else if(statenm == truenm)
			{
				$("#valstatenm").hide();
				$("#valup").hide();
				flag=1;
			}
			else
			{
				if(pattern.test(statenm))
				{
					$("#valstatenm").hide();
					$("#valup").hide();
					//alert("How")
					flag=1;
				}
				else
				{
					$("#valstatenm").show();
					$("#valup").hide();
					document.getElementById("txtstatenm").innerHTML="*please enter a valid state name";
					document.getElementById("stateName").focus();
					flag=0;
				}
				
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