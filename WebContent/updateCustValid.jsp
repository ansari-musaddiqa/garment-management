<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				//alert("hii");
				$(".script1").hide();
				$(".script1").hide();
				$("#myform :text").prop("disabled", true);
				$("#address").prop("disabled", true);
				$("#stateName").prop("disabled", true);
				$("#cityName").prop("disabled", true);
				$("#inputEmail").prop("disabled", true);		
		});
		
	
		$("#fncheck").change(function(){
			if(fncheck.checked == true)
			{
				//alert("Hyy");
				$("#firstName").prop("disabled", false);
			}
			else
			{
				$("#firstName").prop("disabled", true);
			}
		});

		

		$("#lncheck").change(function(){
			if(lncheck.checked == true)
			{
				//alert("Hyy");
				$("#lastName").prop("disabled", false);
			}
			else
			{
				$("#lastName").prop("disabled", true);
			}
		});
		
		$("#addcheck").change(function(){
			if(addcheck.checked == true)
			{
				$("#address").prop("disabled", false);
			}
			else
			{
				$("#address").prop("disabled", true);
			}
		});
		
		
		$("#citycheck").change(function(){
			if(citycheck.checked == true)
			{
				//alert("Hyy");
				$("#cityName").prop("disabled", false);
			}
			else
			{
				$("#cityName").prop("disabled", true);
			}
		});
		
		
		$("#statecheck").change(function(){
			if(statecheck.checked == true)
			{
				//alert("Hyy");
				$("#stateName").prop("disabled", false);
			}
			else
			{
				$("#stateName").prop("disabled", true);
			}
		});
		
		
		$("#concheck").change(function(){
			if(concheck.checked == true)
			{
				//alert("Hyy");
				$("#contactNumber").prop("disabled", false);
			}
			else
			{
				$("#contactNumber").prop("disabled", true);
			}
		});
		
		
		
		$("#emailcheck").change(function(){
			if(emailcheck.checked == true)
			{
				//alert("Hyy");
				$("#inputEmail").prop("disabled", false);
			}
			else
			{
				$("#inputEmail").prop("disabled", true);
			}
		});
		
				
			function validate()
		{
			var flag=0;
				
				if(emailcheck.checked==true)
				{
							var pattern=/^[A-Za-z0-9_.-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
							if(document.getElementById("inputEmail").value == "")
							{
								$("#valuemail").show();
								document.getElementById("txtemail").innerHTML="*this is a required field";
								document.getElementById("inputEmail").focus();
								flag++;
							}
							else if(!(pattern.test(document.getElementById("inputEmail").value)))
							{
								$("#valuemail").show();
								document.getElementById("txtemail").innerHTML="*Please enter valid email";
								document.getElementById("inputEmail").focus();
								flag++;
							}
							else
							{
								$("#valuemail").hide();	
							}		
				}	
			
				if(concheck.checked==true)
				{
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
				}
				

				if(statecheck.checked==true)
				{
						var e = document.getElementById("stateName");
					    var str = e.options[e.selectedIndex].text;
						if(str=="State Name")
						{
							//alert("please select the State");
							$("#valustate").show();
							document.getElementById("txtstate").innerHTML="*this is a required field";
							document.getElementById("stateName").focus();
							flag++;
						}
						else
						{
							$("#valustate").hide();	
						}
				}
				
				if(citycheck.checked==true)
				{
							var e = document.getElementById("cityName");
						    var str = e.options[e.selectedIndex].text;
							if(str=="City Name")
							{
								//alert("please select the City");
								$("#valucity").show();
								document.getElementById("txtcity").innerHTML="*this is a required field";
								document.getElementById("cityName").focus();
								flag++;
							}
							else
							{
								$("#valucity").hide();	
							}
				}
				
				if(addcheck.checked==true)
				{
							if(document.getElementById("address").value == "")
							{
								$("#valuaddress").show();
								document.getElementById("txtaddress").innerHTML="*this is a required field";
								document.getElementById("address").focus();
								flag++;
							}	
							else
							{
								$("#valuaddress").hide();	
							}
				}
						

			var fname=document.getElementById('firstName').value;	
			var lname=document.getElementById('lastName').value;
			var pat=/^[A-Za-z]*$/;
			
			
			if(lncheck.checked==true)
			{
						if(lname == "")
						{
							$("#valulname").show();
							document.getElementById("txtlname").innerHTML="*this is a required field";
							document.getElementById("lastName").focus();
							flag++;
						}	
						else if(!(pat.test(document.getElementById("lastName").value)))	
						{
							$("#valulname").show();
							document.getElementById("txtlname").innerHTML="*Please enter only character";
							document.getElementById("lastName").focus();
							flag++;
						}
						else
						{
							$("#valulname").hide();	
						}
			}

			if(fncheck.checked==true)
			{
						if(fname == "")
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*this is a required field";
							document.getElementById("firstName").focus();
							flag++;
						}
						else if(!(pat.test(document.getElementById("firstName").value)))	
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*Please enter only character";
							document.getElementById("firstName").focus();
							flag++;
						}
						else
						{
							$("#valufname").hide();	
						}
			}
			
			
			if(flag>0)
				{
					return false;
				}
			else
				{
					return true;
				}
			
		}
	</script>