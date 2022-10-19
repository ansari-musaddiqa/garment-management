<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				$(".script1").hide();
				document.getElementById("firstName").focus();
		});
		
		function validate()
		{
			//alert("hii");
			var pattern=/^[A-Za-z0-9_.-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
			var flag=0;
			var flag1=0,flag2=0,flag3=0,flag4=0,flag5=0,flag6=0,flag7=0;
			if(document.getElementById("inputEmail").value == "")
			{
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*this is a required field";
				document.getElementById("inputEmail").focus();
				flag1=0;
			}
			else
			{
				$("#valuemail").hide();
				flag1=1;
			}
			
			if(!(pattern.test(document.getElementById("inputEmail").value)))
			{
				$("#valuemail").show();
				document.getElementById("txtemail").innerHTML="*Please enter valid email";
				document.getElementById("inputEmail").focus();
				flag1=0;
			}
			else
			{
				$("#valuemail").hide();
				flag1=1;
			}
			

			
			if(document.getElementById("contactNumber").value == "")
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*this is a required field";
				document.getElementById("contactNumber").focus();
				flag2=0;
			}
			else if(!(/^[0-9]*$/.test(document.getElementById("contactNumber").value)))
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter only Numbers";
				document.getElementById("contactNumber").focus();
				flag2=0;
			}
			else if(document.getElementById("contactNumber").value.length != 10)
			{
				$("#valucontact").show();
				document.getElementById("txtcontact").innerHTML="*Please enter valid mobile number";
				document.getElementById("contactNumber").focus();
				flag2=0;
			}
			else
			{
				$("#valucontact").hide();	
				flag2=1;
			}
			
			
			var e = document.getElementById("stateName");
		    var str = e.options[e.selectedIndex].text;
			if(str=="State Name")
			{
				//alert("please select the State");
				$("#valustate").show();
				document.getElementById("txtstate").innerHTML="*this is a required field";
				document.getElementById("stateName").focus();
				flag3=0;
			}
			else
			{
				$("#valustate").hide();
				flag3=1;
			}
 			

			var e = document.getElementById("cityName");
		    var str = e.options[e.selectedIndex].text;
			if(str=="City Name")
			{
				//alert("please select the City");
				$("#valucity").show();
				document.getElementById("txtcity").innerHTML="*this is a required field";
				document.getElementById("cityName").focus();
				flag4=0;
			}
			else
			{
				$("#valucity").hide();
				flag4=1;
			}
			if(document.getElementById("address").value == "")
			{
				$("#valuaddress").show();
				document.getElementById("txtaddress").innerHTML="*this is a required field";
				document.getElementById("address").focus();
				flag5=0;
			}	
			else
			{
				$("#valuaddress").hide();
				flag5=1;
			}
			
			var fname=document.getElementById('firstName').value;	
			var lname=document.getElementById('lastName').value;
			var pat=/^[A-Za-z]*$/;

			if(lname == "")
			{
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*this is a required field";
				document.getElementById("lastName").focus();
				flag6=0;
			}	
			else if(!(pat.test(document.getElementById("lastName").value)))	
			{
				$("#valulname").show();
				document.getElementById("txtlname").innerHTML="*Please enter only character";
				document.getElementById("lastName").focus();
				flag6=0;
			}
			else
			{
				$("#valulname").hide();
				flag6=1;
			}
			if(fname == "")
			{
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*this is a required field";
				document.getElementById("firstName").focus();
				flag7=0;
			}
			else if(!(pat.test(document.getElementById("firstName").value)))	
			{
				$("#valufname").show();
				document.getElementById("txtfname").innerHTML="*Please enter only character";
				document.getElementById("firstName").focus();
				flag7=0;
			}
			else
			{
				$("#valufname").hide();
				flag7=1;
			}
			
		if(flag1 == 0 || flag2 == 0 || flag3 == 0 || flag4 == 0 || flag5 == 0 || flag6 == 0 || flag7 == 0)
		{
			flag=0;
		}
		else
		{
			flag=1;
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