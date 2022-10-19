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
					flag=0;
					f=0;
									if(document.getElementById("confPass").value == "")
									{
										$("#valconpass").show();
										document.getElementById("txtconpass").innerHTML="*this is a required field";
										document.getElementById("confPass").focus();
										flag=1;
									}
									else if(!(document.getElementById("confPass").value ==document.getElementById("inputPassword").value))
									{
										$("#valconpass").show();
										document.getElementById("txtconpass").innerHTML="*Password and confirm Password not matched";
										document.getElementById("confPass").focus();		
										flag=1;
										
									}
									else
									{
										$("#valconpass").hide();
										flag=0;
									}
				var flag1=0;
				var pass=document.getElementById('inputPassword').value;
							
				if(document.getElementById("inputPassword").value == "")
				{
					$("#valupass").show();
					document.getElementById("txtpass").innerHTML="*this is a required field";
					document.getElementById("inputPassword").focus();
					flag1=1;
				}
				else if(pass.length<8)
				{
					$("#valupass").show();
					document.getElementById('txtpass').innerHTML="*Please enter at lease 8 character";
					document.getElementById("inputPassword").focus();
					flag1=1;	
				}
				else if(pass.search(/[0-9]/)==-1)
				{
					$("#valupass").show();
					document.getElementById('txtpass').innerHTML="*Please enter atleast one number";
					document.getElementById("inputPassword").focus();
					flag1=1;
				}
				else if(pass.search(/[a-z]/)==-1)
				{
					$("#valupass").show();
					document.getElementById('txtpass').innerHTML="*Please enter atleast one small letter";
					document.getElementById("inputPassword").focus();
					flag1=1;
				}
				else if(pass.search(/[A-Z]/)==-1)
				{
					$("#valupass").show();
					document.getElementById('txtpass').innerHTML="*Please enter atleast one captial letter";
					document.getElementById("inputPassword").focus();
					flag1=1;				
				}
				else if(pass.search(/[@\!\$\^\#\%\&\*\~]/)==-1)
				{
					$("#valupass").show();
					document.getElementById('txtpass').innerHTML="*Please enter atleast one special letter";
					document.getElementById("inputPassword").focus();
					flag1=1;				
				}
				else
				{
					$("#valupass").hide();
					flag1=0;
				}
				
				
				
				if(document.getElementById("curpassword").value == "")
				{
				  f=1;
					$("#valucurpass").show();
					document.getElementById("txtcurpass").innerHTML="*this is a required field";
					document.getElementById("curpassword").focus();
					flag=1;
				}
		    	else
				{
					f=0;
					$("#valucurpass").hide();
				}
		
				if(flag==1 || flag1==1 || f==1)
					{
						return false;
					}
				else
					{
						return true;
					}
	  }
</script>