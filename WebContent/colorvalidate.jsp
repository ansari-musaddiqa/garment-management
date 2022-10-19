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
		var colornm=document.getElementById('color').value;
		var pattern=/^[A-Za-z ]*$/;
		//var des=document.getElementById('descrp').value;
		var flag = 0;
		//alert(colornm);
		if(colornm == "" )
		{
		
			$("#valcolornm").show();
			$("#valup").hide();
			$("#valdesnm").hide();
			document.getElementById("txtcolornm").innerHTML="*this is a required field";
			document.getElementById("color").focus();
			flag = 0;
		}
		else
		{
			$("#valcolornm").hide();
			$("#valup").hide();
			$("#valdesnm").hide();
			flag=1;
			if(pattern.test(colornm))
			{
				$("#valcolornm").hide();
				$("#valup").hide();
				//alert("How")
				$("#valdesnm").hide();
				flag=1;
			}
			else
			{
				$("#valcolornm").show();
				$("#valup").hide();
				$("#valdesnm").hide();
				document.getElementById("txtcolornm").innerHTML="*please enter a valid color name";
				document.getElementById("color").focus();
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