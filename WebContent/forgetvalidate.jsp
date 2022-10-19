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
		var eml=document.getElementById('inputEmail').value;
		if(eml == "")
		{
			$("#valeml").show();
			$("#valup").hide();
			document.getElementById("txteml").innerHTML="*this is a required field";
			document.getElementById("inputEmail").focus();
			f++;
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