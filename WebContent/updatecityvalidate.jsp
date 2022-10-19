<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		
		document.getElementById('cityName').disabled=true;
		$("#citychng").change(function(){
		if(citychng.checked == true)
		{
			//alert("Hyy");
			document.getElementById('cityName').disabled=false;
			document.getElementById("cityName").focus();
		}
		else
		{
			document.getElementById('cityName').disabled=true;
			$("#valcitynm").hide();	
		}
		});
		
		document.getElementById('stateName').disabled=true;
		$("#statechng").change(function(){
		if(statechng.checked == true)
		{
			//alert("Hyy");
			document.getElementById('stateName').disabled=false;
			document.getElementById("stateName").focus();
		}
		else
		{
			$("#valstatenm").hide();
			document.getElementById('stateName').disabled=true;
		}
		});

	})
	function validate()
	{
		//alert("Hyy");
		//var checkcity=document.getElementById('citychng').checkstate;
		//alert(checkcity);
		var flag=0;				
		if(statechng.checked == true)
		{
			//alert("Hyy1");
			//document.getElementById('cityName').disabled=false;
			var statenm=document.getElementById('stateName').value;
			//var pattern=/^[A-Za-z]*$/
			if(statenm == "State Name")
			{
				//$("#valcitynm").show();
				//$("#valup").hide();
				$("#valstatenm").show();
				document.getElementById("txtstatenm").innerHTML="*please select a state";
				document.getElementById("stateName").focus();
				//return false;
				flag++;
			}
			else
			{
				$("#valstatenm").hide();
				//return true;
				//flag=0;
			}
		}
		else
		{
			$("#valstatenm").hide();
		}
		
		if(citychng.checked == true)
		{
			//alert("Hyy");
			
			//document.getElementById('cityName').disabled=false;
			var citynm=document.getElementById('cityName').value;
			var pattern=/^[A-Za-z]*$/
			if(citynm == "")
			{
				$("#valcitynm").show();
				//$("#valup").hide();
				//$("#valstatenm").hide();
				document.getElementById("txtcitynm").innerHTML="*this is a required field";
				document.getElementById("cityName").focus();
				//return false;
				flag++;
			}
			else
			{
				if(pattern.test(citynm))
				{
					$("#valcitynm").hide();
					//$("#valup").hide();
					//alert("How")
					//$("#valstatenm").hide();
					//return true;
					//flag=0;
				}
				else
				{
					$("#valcitynm").show();
					//$("#valup").hide();
					//$("#valstatenm").hide();
					document.getElementById("txtcitynm").innerHTML="*please enter a valid city name";
					document.getElementById("cityName").focus();
					//return false;
					flag++;
				}
			}			
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