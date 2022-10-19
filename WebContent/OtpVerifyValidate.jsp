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
		var otp=document.getElementById('inputOTP').value;
		if(otp == "")
		{
			//alert("bye");
			$("#valeml").show();
			document.getElementById("txteml").innerHTML="*Please Enter OTP";
			document.getElementById("inputOTP").focus();
			f++;
			//alert("bye");
		}
		
		
		if(f>0)
			{
			//   alert("flag>0");
				return false;
			}
		else
			{
			  //  alert("flag==0");
				return true;
			}
	}
</script>