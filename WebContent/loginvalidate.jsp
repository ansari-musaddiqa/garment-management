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
			var uname=document.getElementById('inputUname').value;
			var pass=document.getElementById('inputPassword').value;
			//var truenm="Farhaa Mansuri";
			//var truepass="abc";
			var flag=0;
			//alert(eml);
			if(uname == "" && pass == "")
			{
				$("#valup").hide();
				$("#valuname").show();
				document.getElementById("txtuname").innerHTML="*this is a required field";
				document.getElementById("inputUname").focus();
				$("#valpass").show();
				document.getElementById("txtpass").innerHTML="*this is a required field";
				flag++;
			}
			
			else if(uname == "")
			{
				$("#valuname").show();
				$("#valpass").hide();
				$("#valup").hide();
				document.getElementById("txtuname").innerHTML="*this is a required field";
				document.getElementById("inputUname").focus();
				flag++;
			}
			
			else if(pass == "")
			{
				$("#valpass").show();
				$("#valuname").hide();
				$("#valup").hide();
				document.getElementById("txtpass").innerHTML="*this is a required field";
				document.getElementById("inputPassword").focus();
				flag++;
			}
			/*
			else if(uname == truenm && pass == "")
			{
				$("#valpass").show();
				$("#valuname").hide();
				$("#valup").hide();
				document.getElementById("txtpass").innerHTML="*this is a required field";
				document.getElementById("inputPassword").focus();	
				flag=0;
			}
			
			else if(uname == truenm && pass != truepass)
			{
				$("#valup").show();
				$("#valuname").hide();
				$("#valpass").hide();
				document.getElementById("txtup").innerHTML="*the account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.";
				document.getElementById("inputUname").focus();
				document.getElementById("inputUname").value="";
				document.getElementById("inputPassword").value="";
				flag=0;
			}
			
			else if(uname != truenm && pass == truepass)
			{
				$("#valup").show();
				$("#valuname").hide();
				$("#valpass").hide();
				document.getElementById("txtup").innerHTML="*the account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.";
				document.getElementById("inputUname").focus();
				document.getElementById("inputUname").value="";
				document.getElementById("inputPassword").value="";
				flag=0;
			}*/
			else
			{
				$("#valup").hide();
				$("#valuname").hide();
				$("#valpass").hide();
				//flag=1;
			}
			
			if(flag > 0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	</script>