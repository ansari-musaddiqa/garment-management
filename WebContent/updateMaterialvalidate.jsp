<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('mat-name').disabled=true;		
		

		$("#namechng").change(function(){
			if(namechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('mat-name').disabled=false;
				document.getElementById("mat-name").focus();
			}
			else
			{
				$("#valnm").hide();
				document.getElementById('mat-name').disabled=true;
			}
		});
		
		
	});
	
	
	
	function validate()
	{
		var flag=0;
		if(namechng.checked == true)
		{
			var name=document.getElementById('mat-name').value;
			if(name == "")
			{

				$("#valnm").show();
				//$("#valup").hide();
				document.getElementById("txtnm").innerHTML="*this is a required field";
				document.getElementById("mat-name").focus();
				flag=0;
			}
			else
			{
				$("#valnm").hide();
				//$("#valup").hide();
				flag=1;
			}

		}
		else
		{
			$("#valnm").hide();	
			document.getElementById('mat-name').value="";
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