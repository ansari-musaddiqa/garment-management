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
			var shop=document.getElementById('shop').value;
			var flag=0;
			var flag1=1;
			var e = document.getElementById("empType");
		    var str = e.options[e.selectedIndex].text;
		    //alert(str);
			if(str=="job worker")
			{
				alert("musaddiqa1");
				e = document.getElementById("jobworkType_id");
			    str = e.options[e.selectedIndex].text;
			    //alert(str);
			    if(str=="0")
			    {
					$("#valuejobtype").show();
					document.getElementById("textjobtype").innerHTML="*this is a required field";
					document.getElementById("jobworkType_id").focus();
					flag1=0;
					//alert(flag);
			    }
			    else
			    {
			    	$("#valuejobtype").hide();
			    	flag=0;
			    }
			}
			
			e = document.getElementById("empType");
		    str = e.options[e.selectedIndex].text;
			if(str=="Emp Type")
			{
				$("#valuemptype").show();
				document.getElementById("txtemptype").innerHTML="*this is a required field";
				document.getElementById("empType").focus();
				flag1=0;
			}
			else
			{
				$("#valuemptype").hide();
				flag=0;
			}
			
			if(document.getElementById("confPass").value == "")
			{
				$("#valconpass").show();
				document.getElementById("txtconpass").innerHTML="*this is a required field";
				document.getElementById("confPass").focus();
				flag1=0;
			}
			else if(!(document.getElementById("confPass").value ==document.getElementById("inputPassword").value))
			{
				$("#valconpass").show();
				document.getElementById("txtconpass").innerHTML="*Password and confirm Password not matched";
				document.getElementById("confPass").focus();
				
				flag1=0;
			}
			else
			{
				$("#valconpass").hide();
				flag=0;
			}


			
			var pass=document.getElementById('inputPassword').value;
			
			if(document.getElementById("inputPassword").value == "")
			{
				$("#valupass").show();
				document.getElementById("txtpass").innerHTML="*this is a required field";
				document.getElementById("inputPassword").focus();
				flag1=0;
			}
			else if(pass.length<8)
			{
				$("#valupass").show();
				document.getElementById('txtpass').innerHTML="*Please enter at lease 8 character";
				document.getElementById("inputPassword").focus();
				flag1=0;
			}
			else if(pass.search(/[0-9]/)==-1)
			{
				$("#valupass").show();
				document.getElementById('txtpass').innerHTML="*Please enter atleast one number";
				document.getElementById("inputPassword").focus();
				flag1=0;
			}
			else if(pass.search(/[a-z]/)==-1)
			{
				$("#valupass").show();
				document.getElementById('txtpass').innerHTML="*Please enter atleast one small letter";
				document.getElementById("inputPassword").focus();
				flag1=0;
			}
			else if(pass.search(/[A-Z]/)==-1)
			{
				$("#valupass").show();
				document.getElementById('txtpass').innerHTML="*Please enter atleast one captial letter";
				document.getElementById("inputPassword").focus();
				flag1=0;				
			}
			else if(pass.search(/[@\!\$\^\#\%\&\*\~]/)==-1)
			{
				$("#valupass").show();
				document.getElementById('txtpass').innerHTML="*Please enter atleast one special letter";
				document.getElementById("inputPassword").focus();
				flag1=0;				
			}
			else
			{
				$("#valupass").hide();
				flag=0;
			}
			
			if(document.getElementById("userName").value == "")
			{
				$("#valusername").show();
				document.getElementById("txtuname").innerHTML="*this is a required field";
				document.getElementById("userName").focus();
				flag1=0;
			}
			else if(!(/^[A-Za-z0-9]{3,20}$/.test(document.getElementById('userName').value)))
			{
				$("#valusername").show();
				document.getElementById("txtuname").innerHTML="*Please enter suffieient user name";
				document.getElementById("userName").focus();
				flag1=0;
		    }
			else
			{
				$("#valusername").hide();
				flag=0;
			}
			
			

			var fileName = document.getElementById("inputimage").value;
	        var idxDot = fileName.lastIndexOf(".") + 1;
	        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
	        
			if(document.getElementById("inputimage").value == "")
			{
				$("#valuphoto").show();
				document.getElementById("txtphoto").innerHTML="*this is a required field";
				document.getElementById("inputimage").focus();
				flag1=0;
			}
			else if (!(extFile=="jpg" || extFile=="jpeg" || extFile=="png"))
			{
				$("#valuphoto").show();
				document.getElementById("txtphoto").innerHTML="*please select photo";
				document.getElementById("inputimage").focus();
				flag1=0;
			}
			else
			{
				$("#valuphoto").hide();
				flag=0;
			}
			
			

			if(shop == "Shop")
			{
				$("#valshopnm").show();
				$("#valup").hide();
				document.getElementById("txtshopnm").innerHTML="*please select a shop name";
				document.getElementById("shop").focus();
				flag1=0;
			}
			else
			{
				$("#valshopnm").hide();
				$("#valup").hide();
				flag=0;
			}

			
			var pattern=/^[A-Za-z0-9_.-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
			if(document.getElementById("inputEmail").value == "")
			{
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*this is a required field";
				document.getElementById("inputEmail").focus();
				flag1=0;
			}
			else if(!(pattern.test(document.getElementById("inputEmail").value)))
			{
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*Please enter valid email";
				document.getElementById("inputEmail").focus();
				flag1=0;
			}
			else
			{
				$("#valuemail").hide();
				flag=0;
			}
			
			if(document.getElementById("contactNumber").value == "")
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*this is a required field";
				document.getElementById("contactNumber").focus();
				flag1=0;
			}
			else if(!(/^[0-9]*$/.test(document.getElementById("contactNumber").value)))
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter only Numbers";
				document.getElementById("contactNumber").focus();	
				flag1=0;
			}
			else if(document.getElementById("contactNumber").value.length != 10)
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter valid mobile number";
				document.getElementById("contactNumber").focus();		
				flag1=0;
			}
			else
			{
				$("#valucontact").hide();
				flag=0;
			}
			
			var e = document.getElementById("stateName");
		    var str = e.options[e.selectedIndex].text;
			if(str=="State Name")
			{
				$("#valustate").show();
				document.getElementById("txtstate").innerHTML="*this is a required field";
				document.getElementById("stateName").focus();
				flag1=0;
			}
			else
			{
				$("#valustate").hide();
				flag=0;
			}
			

			 e = document.getElementById("cityName");
		     str = e.options[e.selectedIndex].text;
			if(str=="City Name")
			{
				$("#valucity").show();
				document.getElementById("txtcity").innerHTML="*this is a required field";
				document.getElementById("cityName").focus();
				flag1=0;
			}
			else
			{
				$("#valucity").hide();	
				flag=0;
			}
			
			
						

			if(document.getElementById("address").value == "")
			{
				$("#valuaddress").show();
				document.getElementById("txtaddress").innerHTML="*this is a required field";
				document.getElementById("address").focus();
				flag1=0;
			}	
			else
			{
				$("#valuaddress").hide();
				flag=0;
			}
			

			var fname=document.getElementById('empfName').value;	
			var lname=document.getElementById('emplName').value;
			var pat=/^[A-Za-z]*$/;
			
			
			
			if(lname == "")
			{
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*this is a required field";
				document.getElementById("emplName").focus();
				flag1=0;
			}	
			else if(!(pat.test(document.getElementById("emplName").value)))	
			{
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*Please enter only character";
				document.getElementById("emplName").focus();
				flag1=0;
			}
			else
			{
				$("#valulname").hide();
				flag=0;
			}
			

			if(fname == "")
			{
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*this is a required field";
				document.getElementById("empfName").focus();
				flag1=0;
			}
			else if(!(pat.test(document.getElementById("empfName").value)))	
			{
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*Please enter only character";
				document.getElementById("empfName").focus();
				flag1=0;
			}
			else
			{
				$("#valufname").hide();	
				flag=0;
			}
						
			if(flag1 == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	</script>