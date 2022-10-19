<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('stateName').disabled=true;		
		$("#change").change(function(){
			if(change.checked == true)
			{
				//alert("Hyy");
				document.getElementById('stateName').disabled=false;
				document.getElementById("stateName").focus();
			}
			else
			{
				$("#valnm").hide();
				document.getElementById('stateName').disabled=true;
			}
		});
	});
	
	function validate()
	{
		var flag=0;
		if(change.checked == true)
		{
			var name=document.getElementById('stateName').value;
			if(name == "")
			{
				$("#valnm").show();
				//$("#valup").hide();
				document.getElementById("txtnm").innerHTML="*this is a required field";
				document.getElementById("stateName").focus();
				flag++;
			}
			else
			{
				$("#valnm").hide();
				//$("#valup").hide();
				//flag=1;
			}

		}
		else
		{
			$("#valnm").hide();	
			document.getElementById('stateName').value="";
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