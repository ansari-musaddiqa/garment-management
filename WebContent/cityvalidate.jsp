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
		var truenm="Ahmedabad";
		var citynm=document.getElementById('cityName').value;
		var pattern=/^[A-Za-z ]*$/;
		var statenm=document.getElementById('stateName').value;
		var flag=0;
		if(citynm == "" && statenm == "State Name")
		{

			$("#valcitynm").show();
			$("#valup").hide();
			$("#valstatenm").show();
			document.getElementById("txtcitynm").innerHTML="*this is a required field";
			document.getElementById("cityName").focus();
			document.getElementById("txtstatenm").innerHTML="*please select a state";
			flag=0;
		}
		else if(citynm == "" && statenm != "State Name")
		{
			$("#valcitynm").show();
			$("#valup").hide();
			$("#valstatenm").hide();
			document.getElementById("txtcitynm").innerHTML="*this is a required field";
			document.getElementById("cityName").focus();
			flag=0;
		}
		else if(statenm == "State Name" && citynm != "")
		{
			$("#valcitynm").hide();
			$("#valup").hide();
			$("#valstatenm").show();
			document.getElementById("txtstatenm").innerHTML="*please select a state";
			document.getElementById("stateName").focus();
			flag=0;
		}
		else
		{
			$("#valcitynm").hide();
			$("#valup").hide();
			$("#valstatenm").hide();
			flag=1;
			if(pattern.test(citynm))
			{
				$("#valcitynm").hide();
				$("#valup").hide();
				//alert("How")
				$("#valstatenm").hide();
				flag=1;
			}
			else
			{
				$("#valcitynm").show();
				$("#valup").hide();
				$("#valstatenm").hide();
				document.getElementById("txtcitynm").innerHTML="*please enter a valid city name";
				document.getElementById("cityName").focus();
				flag=0;
			}
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