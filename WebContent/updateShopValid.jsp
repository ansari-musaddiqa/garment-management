<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				$(".script1").hide();
				$("#myform :text").prop("disabled", true);
				$("#branchName").prop("disabled", true);
				$("#contactNumber").prop("disabled", true);
				$("#address").prop("disabled", true);
				$("#cityName").prop("disabled", true);		
				$("#stateName").prop("disabled", true);		
		});
		
	
		$("#bncheck").change(function(){
			if(bncheck.checked == true)
			{
				//alert("Hyy");
				$("#branchName").prop("disabled", false);
			}
			else
			{
				$("#branchName").prop("disabled", true);
			}
		});

		

		$("#numcheck").change(function(){
			if(numcheck.checked == true)
			{
				//alert("Hyy");
				$("#contactNumber").prop("disabled", false);
			}
			else
			{
				$("#contactNumber").prop("disabled", true);
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
		
		
		
				
		function validate()
		{
			
			var flag1=1,flag2=1,flag3=1,flag4=1,flag5=1,flag6=1,flag7=1,flag=0;
			if(statecheck.checked==true)
			{
					var e = document.getElementById("stateName");
				    var str = e.options[e.selectedIndex].text;
					if(str=="State Name")
					{
						//alert("please select the State");
						$("#valstate").show();
						document.getElementById("txtstate").innerHTML="*this is a required field";
						document.getElementById("stateName").focus();
						flag1=0;
					}
					else
					{
						$("#valstate").hide();	
						flag1=1;
					}
			}
			
			if(citycheck.checked==true)
				{
						var e = document.getElementById("cityName");
					    var str = e.options[e.selectedIndex].text;
						if(str=="City Name")
						{
							//alert("please select the City");
							$("#valcity").show();
							document.getElementById("txtcity").innerHTML="*this is a required field";
							document.getElementById("cityName").focus();
							flag2=0;
						}
						else
						{
							$("#valcity").hide();	
							flag2=1;
						}
				}
			
				if(addcheck.checked==true)
				{
							if(document.getElementById("address").value == "")
							{
								$("#valadd").show();
								document.getElementById("txtadd").innerHTML="*this is a required field";
								document.getElementById("address").focus();
								flag3=0;
							}	
							else
							{
								$("#valadd").hide();	
								flag3=1;
							}
				}
				
				if(numcheck.checked==true)
				{
						if(document.getElementById("contactNumber").value == "")
						{
							$("#valcontact").show();
							document.getElementById("txtcontact").innerHTML="*this is a required field";
							document.getElementById("contactNumber").focus();
							flag4=0;
						}
						else if(!(/^[0-9]*$/.test(document.getElementById("contactNumber").value)))
						{
							$("#valcontact").show();
							document.getElementById("txtcontact").innerHTML="*Please enter only Numbers";
							document.getElementById("contactNumber").focus();	
							flag4=0;
						}
						else if(document.getElementById("contactNumber").value.length != 10)
						{
							$("#valcontact").show();
							document.getElementById("txtcontact").innerHTML="*Please enter valid mobile number";
							document.getElementById("contactNumber").focus();		
							flag4=0;
						}
						else
						{
							$("#valcontact").hide();	
							flag4=1;
						}
				}
				

				
				
						

			var lname=document.getElementById('branchName').value;
			var pat=/^[A-Za-z]*$/;
			
			
			if(bncheck.checked==true)
			{
						if(lname == "")
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*this is a required field";
							document.getElementById("branchName").focus();
							flag5=0;
						}	
						else if(!(pat.test(document.getElementById("branchName").value)))	
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*Please enter only character";
							document.getElementById("branchName").focus();
							flag5=0;
						}
						else
						{
							$("#valufname").hide();	
							flag5=1;
						}
			}

			
			if(flag1 == 0 || flag2 == 0 || flag3 == 0 || flag4 == 0 || flag5 == 0)
			{
				flag=0;
			}
			else
			{
				flag=1;
			}
			if(flag == 0)
			{
				//alert(flag);
				return false;
			}
			else
			{
				//alert(flag);
				return true;
			}
		}
	</script>