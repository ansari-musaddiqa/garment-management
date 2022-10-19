<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('JobType').disabled=true;		
		$("#jobtypecheck").change(function(){
			if(jobtypecheck.checked == true)
			{
				//alert("true");
				document.getElementById('JobType').disabled=false;
				document.getElementById("JobType").focus();
			}
			else
			{
				//alert("fasle");
				$("#valuejobtype").hide();
				document.getElementById('JobType').disabled=true;
			}
		});
	});
	
	function validate()
	{
		var flag=0;
		if(jobtypecheck.checked == true)
		{
			var name=document.getElementById('JobType').value;
			if(name == "")
			{
				$("#valuejobtype").show();
				document.getElementById("txtjobtype").innerHTML="*this is a required field";
				document.getElementById("JobType").focus();
				flag=0;
			}
			else
			{
				//document.getElementById("JobType").innerHTML="";
				$("#valuejobtype").hide();
				flag=1;
			}

		}
		else
		{
			$("#valuejobtype").hide();	
			document.getElementById('JobType').value="";
			flag=1;
		}
		
		if(flag==0)
			{
			return false;
			}
		else
			{
			return true;
			}
	}
</script>