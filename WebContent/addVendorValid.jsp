<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				//alert("hii");
				$(".script1").hide();
		});
		
		function validate()
		{
			
			var flag = 0;
			
		
			var pattern=/^[A-Za-z0-9_.-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
			if(document.getElementById("inputEmail").value == "")
			{
				flag++;
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*this is a required field";
				document.getElementById("inputEmail").focus();
			}
			else if(!(pattern.test(document.getElementById("inputEmail").value)))
			{
				flag++;
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*Please enter valid email";
				document.getElementById("inputEmail").focus();
			}
			else
			{
				$("#valuemail").hide();	
			}			
			
			if(document.getElementById("contactNumber").value == "")
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*this is a required field";
				document.getElementById("contactNumber").focus();
				flag++;
			}
			else if(!(/^[0-9]*$/.test(document.getElementById("contactNumber").value)))
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter only Numbers";
				document.getElementById("contactNumber").focus();
				flag++;
			}
			else if(document.getElementById("contactNumber").value.length != 10)
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter valid mobile number";
				document.getElementById("contactNumber").focus();
				flag++;
			}
			else
			{
				$("#valucontact").hide();	
			}
			
			var e = document.getElementById("stateName");
		    var str = e.options[e.selectedIndex].text;
			if(str=="State Name")
			{
				flag++;
				//alert("please select the State");
				$("#valustate").show();
				document.getElementById("txtstate").innerHTML="*this is a required field";
				document.getElementById("stateName").focus();
				//flag = 0;
			}
			else
			{
				//flag=0;
				$("#valustate").hide();	
				//flag = 1;
			}
			
			
			e = document.getElementById("cityName");
		    str = e.options[e.selectedIndex].text;
			if(str=="City Name")
			{
				flag++;
				//alert("please select the City");
				$("#valucity").show();
				document.getElementById("txtcity").innerHTML="*this is a required field";
				document.getElementById("cityName").focus();
				//flag = 0;
			}
			else
			{
				//flag=0;
				$("#valucity").hide();	
			}
			
			
		
			if(document.getElementById("address").value == "")
			{
				flag++;
				$("#valuaddress").show();
				document.getElementById("txtaddress").innerHTML="*this is a required field";
				document.getElementById("address").focus();
			}	
			else
			{
				//flag=0;
				$("#valuaddress").hide();	
				//flag = 1;
			}
		
			
			var fname=document.getElementById('firstName').value;	
			var lname=document.getElementById('lastName').value;
			var pat=/^[A-Za-z ]*$/;
			
			if(lname == "")
			{
				flag++;
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*this is a required field";
				document.getElementById("lastName").focus();
			}	
			else if(!(pat.test(document.getElementById("lastName").value)))	
			{
				flag++;
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*Please enter only character";
				document.getElementById("lastName").focus();
			}
			else
			{
				$("#valulname").hide();	
			}

			
			if(fname == "")
			{
				flag++;
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*this is a required field";
				document.getElementById("firstName").focus();
			}
			else if(!(pat.test(document.getElementById("firstName").value)))	
			{
				flag++;
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*Please enter only character";
				document.getElementById("firstName").focus();
			}
			else
			{
				$("#valufname").hide();	
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