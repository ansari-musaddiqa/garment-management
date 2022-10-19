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
		var pass=document.getElementById('inputPass').value;
		var conpass=document.getElementById('inputConPass').value;
		
		
		
		if(conpass == "")
		{
			//alert(conpass);
			//alert("bye");
			$("#valcon").show();
			document.getElementById("txtcon").innerHTML="*Please Enter Confirm Password";
			document.getElementById("inputConPass").focus();
			f++;
			//alert("bye");
		}
		else
		{
			if(pass==conpass)
			{
				$("#valcon").hide();
			}
			else
			{
				//alert("con bye");
				$("#valcon").show();
				document.getElementById("txtcon").innerHTML="*Password & Confirm Password not Matched";
				document.getElementById("inputConPass").focus();
				f++;	
			}

		}
		
		
		
		if(pass == "")
		{
			$("#valpass").show();
			document.getElementById("txtpass").innerHTML="*Please Enter Password";
			document.getElementById("inputPass").focus();
			f++;
		}
		else if(pass.length<8)
		{
			$("#valpass").show();
			document.getElementById('txtpass').innerHTML="*Please enter at lease 8 character";
			document.getElementById("inputPass").focus();
			f++;
		}
		else if(pass.search(/[0-9]/)==-1)
		{
			$("#valpass").show();
			document.getElementById('txtpass').innerHTML="*Please enter atleast one number";
			document.getElementById("inputPass").focus();
			f++;
		}
		else if(pass.search(/[a-z]/)==-1)
		{
			$("#valpass").show();
			document.getElementById('txtpass').innerHTML="*Please enter atleast one small letter";
			document.getElementById("inputPass").focus();
			f++;
		}
		else if(pass.search(/[A-Z]/)==-1)
		{
			$("#valpass").show();
			document.getElementById('txtpass').innerHTML="*Please enter atleast one captial letter";
			document.getElementById("inputPass").focus();
			flag1=0;				
		}
		else if(pass.search(/[@\!\$\^\#\%\&\*\~]/)==-1)
		{
			$("#valpass").show();
			document.getElementById('txtpass').innerHTML="*Please enter atleast one special letter";
			document.getElementById("inputPass").focus();
			flag1=0;				
		}
		else
		{
			$("#valpass").hide();
		}	
	
		
		if(f>0)
			{
			   //alert("flag>0");
				return false;
			}
		else
			{
			   // alert("flag==0");
				return true;
			}
	}
</script>