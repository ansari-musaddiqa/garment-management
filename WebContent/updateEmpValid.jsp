<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		$("#myform :text").prop("disabled", true);
		$("#myform :password").prop("disabled", true);
		$("#myform :file").prop("disabled", true);
		$("#address").prop("disabled", true);
		$("#stateName").prop("disabled", true);
		$("#cityName").prop("disabled", true);
		$("#inputEmail").prop("disabled", true);
		$("#empType").prop("disabled", true);
		$("#jobworkType").prop("disabled", true);
		$("#shop").prop("disabled", true);
			$("#job").show();
		
		 	var e = document.getElementById("empType");
		    var str = e.options[e.selectedIndex].text;
		    //alert(str);
			if(str=="jobworker")
			{
				//alert("musaddiqa1");
				e = document.getElementById("jobworkType");
			    str = e.options[e.selectedIndex].text;
			    //alert("str1 "+str);
			    if(str=="JobWork Type")
			    {
			    	//alert("hani");
					$("#valuejobtype").show();
					document.getElementById("textjobtype").innerHTML="*this is a required field";
					document.getElementById("jobworkType").focus();
			    }
			    else
			    {
			    	$("#valuejobtype").hide();
			    }
			}	
			else
			{
				//$("#jobworkType").prop("disabled", true);
				$("#job").hide();
				$("#jobc").hide();
			 	$("#valuejobtype").hide();
			}
	
	});

	
	$("#fncheck").change(function(){
		if(fncheck.checked == true)
		{
			//alert("Hyy");
			$("#empfName").prop("disabled", false);
		}
		else
		{
			$("#empfName").prop("disabled", true);
		}
	});

	

	$("#lncheck").change(function(){
		if(lncheck.checked == true)
		{
			//alert("Hyy");
			$("#emplName").prop("disabled", false);
		}
		else
		{
			$("#emplName").prop("disabled", true);
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
	
	$("#shopchng").change(function(){
		if(shopchng.checked == true)
		{
			//alert("Hyy");
			document.getElementById('shop').disabled=false;
			document.getElementById("shop").focus();
		}
		else
		{
			$("#valshopnm").hide();
			document.getElementById('shop').disabled=true;
		}
	});

	
	$("#imgcheck").change(function(){
		if(imgcheck.checked == true)
		{
			//alert("Hyy");
			$("#inputimage").prop("disabled", false);
		}
		else
		{
			$("#inputimage").prop("disabled", true);
		}
	});
	
	
	$("#usercheck").change(function(){
		if(usercheck.checked == true)
		{
			//alert("Hyy");
			$("#userName").prop("disabled", false);
		}
		else
		{
			$("#userName").prop("disabled", true);
		}
	});
	

	$("#passcheck").change(function(){
		if(passcheck.checked == true)
		{
			//alert("Hyy");
			$("#inputPassword").prop("disabled", false);
			$("#confPass").prop("disabled", false);
		}
		else
		{
			$("#inputPassword").prop("disabled", true);
			$("#confPass").prop("disabled", true);
		}
	});
	
	$("#empcheck").change(function(){
		if(empcheck.checked == true)
		{
			//alert("Hyy");
			$("#empType").prop("disabled", false);
		}
		else
		{
			$("#empType").prop("disabled", true);
		}
	});
	
	$("#jobcheck").change(function(){
		if(jobcheck.checked == true)
		{
			//alert("Hyy");
			$("#jobworkType").prop("disabled", false);
		}
		else
		{
			$("#jobworkType").prop("disabled", true);
		}
	});
	
	function validate()
	{
		var shop=document.getElementById('shop').value;
		var flag=0;
		var result=0;
		//alert("");
		if(jobcheck.checked == true)
		{
			alert("mub");
			e = document.getElementById("jobworkType");
		    str = e.options[e.selectedIndex].text;
		    alert(str);
		    if(str=="JobWork Type")
			{
				$("#valuejobtype").show();
				document.getElementById("txtjobtype").innerHTML="*this is a required field";
				document.getElementById("jobworkType").focus();
				flag=1;
				result++;
			}
			else
			{
				$("#valuejobtype").hide();
				flag=0;
			}			
		}
		else
			{
				$("#valuejobtype").hide();	
				flag=0;
			}
		
		
		
					if(empcheck.checked==true)
					{
						e = document.getElementById("empType");
					    str = e.options[e.selectedIndex].text;
						if(str=="Emp Type")
						{
							$("#valuemptype").show();
							document.getElementById("txtemptype").innerHTML="*this is a required field";
							document.getElementById("empType").focus();
							flag=1;
							result++;
					    }
						else
					    {
							$("#valuemptype").hide();
							flag=0;
					    }  
					}
					else
				    {
						$("#valuemptype").hide();
						flag=0;
				    }
					if(usercheck.checked==true)
					{
											
										if(document.getElementById("userName").value == "")
										{
											$("#valusername").show();
											document.getElementById("txtuname").innerHTML="*this is a required field";
											document.getElementById("userName").focus();
											flag=1;
											result++;
										}
										else if(!(/^[A-Za-z0-9]{3,20}$/.test(document.getElementById('userName').value)))
										{
											$("#valusername").show();
											document.getElementById("txtuname").innerHTML="*Please enter suffieient user name";
											document.getElementById("userName").focus();
											flag=1;
											result++;
									    }
										else
										{
											$("#valusername").hide();
											flag=0;
										}
								
					}
					else
					{
						$("#valusername").hide();
						flag=0;
					}
					if(emailcheck.checked==true)
					{
									var pattern=/^[A-Za-z0-9_.-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
									if(document.getElementById("inputEmail").value == "")
									{
										$("#valuemail").show();
										document.getElementById("txtemail").innerHTML="*this is a required field";
										document.getElementById("inputEmail").focus();
										flag=1;
										result++;
									}
									else if(!(pattern.test(document.getElementById("inputEmail").value)))
									{
										$("#valuemail").show();
										document.getElementById("txtemail").innerHTML="*Please enter valid email";
										document.getElementById("inputEmail").focus();
										flag=1;
										result++;
									}
									else
									{
										$("#valuemail").hide();	
										flag=0;
									}

					}
					else
					{
						$("#valuemail").hide();	
						flag=0;
					}
					if(concheck.checked==true)
					{
									if(document.getElementById("contactNumber").value == "")
									{
										$("#valucontact").show();
										document.getElementById("txtcontact").innerHTML="*this is a required field";
										document.getElementById("contactNumber").focus();
										flag=1;
										result++;
									}
									else if(!(/^[0-9]*$/.test(document.getElementById("contactNumber").value)))
									{
										$("#valucontact").show();
										document.getElementById("txtcontact").innerHTML="*Please enter only Numbers";
										document.getElementById("contactNumber").focus();	
										flag=1;
										result++;
									}
									else if(document.getElementById("contactNumber").value.length != 10)
									{
										$("#valucontact").show();
										document.getElementById("txtcontact").innerHTML="*Please enter valid mobile number";
										document.getElementById("contactNumber").focus();		
										flag=1;
										result++;
									}
									else
									{
										$("#valucontact").hide();	
										flag=0;
									}
					}
					else
					{
						$("#valucontact").hide();	
						flag=0;
					}
					
					
					if(statecheck.checked)
					{
								var e = document.getElementById("stateName");
							    var str = e.options[e.selectedIndex].text;
								if(str=="State Name")
								{
									$("#valustate").show();
									document.getElementById("txtstate").innerHTML="*this is a required field";
									document.getElementById("stateName").focus();
									flag=1;
									result++;
								}
								else
								{
									$("#valustate").hide();	
									flag=0;
								}
					}
					else
					{
						$("#valustate").hide();	
						flag=0;
					}
					
					
					
					if(citycheck.checked==true)
					{
								var e = document.getElementById("cityName");
							    var str = e.options[e.selectedIndex].text;
								if(str=="City Name")
								{
									$("#valucity").show();
									document.getElementById("txtcity").innerHTML="*this is a required field";
									document.getElementById("cityName").focus();
									flag=1;
									result++;
								}
								else
								{
									$("#valucity").hide();
									flag=0
								}	
					}
					else
					{
						$("#valucity").hide();
						flag=0
					}	
					
					
					
					if(addcheck.checked==true)
					{
								if(document.getElementById("address").value == "")
								{
									$("#valuaddress").show();
									document.getElementById("txtaddress").innerHTML="*this is a required field";
									document.getElementById("address").focus();
									flag=1;
									result++;
								}	
								else
								{
									$("#valuaddress").hide();
									flag=0;
								}
					}
					else
					{
						$("#valuaddress").hide();
						flag=0;
					}
					
					var fname=document.getElementById('empfName').value;	
					var lname=document.getElementById('emplName').value;
					var pat=/^[A-Za-z]*$/;
					if(lncheck.checked==true)
					{
								if(lname == "")
								{
									$("#valulname").show();
									document.getElementById("txtlname").innerHTML="*this is a required field";
									document.getElementById("emplName").focus();
									flag=1;
									reslut++;
								}	
								else if(!(pat.test(document.getElementById("emplName").value)))	
								{
									$("#valulname").show();
									document.getElementById("txtlname").innerHTML="*Please enter only character";
									document.getElementById("emplName").focus();
									flag=1;
									result++;
								}
								else
								{
									$("#valulname").hide();	
									flag=0;
								}
					}
					else
					{
						$("#valulname").hide();	
						flag=0;
					}
					
					
					if(fncheck.checked==true)
					{
						if(fname == "")
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*this is a required field";
							document.getElementById("empfName").focus();
							flag=1;
							result++;
						}
						else if(!(pat.test(document.getElementById("empfName").value)))	
						{
							$("#valufname").show();
							document.getElementById("txtfname").innerHTML="*Please enter only character";
							document.getElementById("empfName").focus();
							flag=1;
							result++;
						}
						else
						{
							$("#valufname").hide();
							flag=0;
						}
					}
					else
					{
						$("#valufname").hide();
						flag=0;
					}
					
					
					if(imgcheck.checked==true)
					{
									var fileName = document.getElementById("inputimage").value;
							        var idxDot = fileName.lastIndexOf(".") + 1;
							        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
							        
									if(document.getElementById("inputimage").value == "")
									{
										$("#valuphoto").show();
										document.getElementById("txtphoto").innerHTML="*this is a required field";
										document.getElementById("inputimage").focus();
										flag=1;
										result++;
									}
									else if (!(extFile=="jpg" || extFile=="jpeg" || extFile=="png"))
									{
										$("#valuphoto").show();
										document.getElementById("txtphoto").innerHTML="*please select photo";
										document.getElementById("inputimage").focus();
										flag=1;
										result++;	
									}
									else
									{
										$("#valuphoto").hide();
										flag=0;
									}
									
					}

					else
					{
						$("#valuphoto").hide();
						flag=0;
					}
					

					if(shop == "Shop")
					{
						//alert("shop if"+shop);
						$("#valshopnm").show();
						$("#valup").hide();
						document.getElementById("txtshopnm").innerHTML="*please select a shop name";
						document.getElementById("shop").focus();
						result++;
					}
					else
					{
						//alert("shop else"+shop);
						$("#valshopnm").hide();
						$("#valup").hide();
						flag=0;
					}

					
					
					if(flag==0 && result==0)
						{
							return true;
						}
					else
						{
							return false;
						}
	}
</script>