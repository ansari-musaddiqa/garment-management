<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('cat-type').disabled=true;		
		$("#namechng").change(function(){
			if(namechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('cat-type').disabled=false;
				document.getElementById("cat-type").focus();
			}
			else
			{
				$("#valnm").hide();
				document.getElementById('cat-type').disabled=true;
			}
		});
	});
	
	function validate()
	{
		var flag=0;
		if(namechng.checked == true)
		{
			var name=document.getElementById('cat-type').value;
			if(name == "")
			{
				//alert("gg");
				$("#valnm").show();
				//$("#valup").hide();
				document.getElementById("txtnm").innerHTML="*this is a required field";
				document.getElementById("cat-type").focus();
				flag=1;
			}
			else
			{
				$("#valnm").hide();
				//$("#valup").hide();
				flag=0;
			}

		}
		else
		{
			$("#valnm").hide();	
			document.getElementById('cat-type').value="";
			flag=0;
		}
		
		if(flag==0)
			{
			return true;
			}
		else
			{
			return false;
			}
	}
</script>