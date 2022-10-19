<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		//$(".script1").hide();
		$(".script1").hide();
		$("#myform :text").prop("disabled", true);
		$("#cat-type").prop("disabled", true);
	});
	
	$("#sizecheck").change(function(){
		if(sizecheck.checked == true)
		{
			//alert("Hyy");
			$("#sizename").prop("disabled", false);
		}
		else
		{
			$("#sizename").prop("disabled", true);
		}
	});

	

	$("#cattypecheck").change(function(){
		if(cattypecheck.checked == true)
		{
			//alert("Hyy");
			$("#cat-type").prop("disabled", false);
		}
		else
		{
			$("#cat-type").prop("disabled", true);
		}
	});

	$("#descheck").change(function(){
		if(descheck.checked == true)
		{
			//alert("Hyy");
			$("#descrp").prop("disabled", false);
		}
		else
		{
			$("#descrp").prop("disabled", true);
		}
	});
	
	function validate()
	{
		//alert("");
		flag=0;
		if(cattypecheck.checked == true)
		{
			e = document.getElementById("cat-type");
		    str = e.options[e.selectedIndex].text;
			if(str=="Category Type")
			{
				flag++;
				$("#valulcategorytype").show();
				document.getElementById("txtcattype").innerHTML="*this is a required field";
				document.getElementById("cat-type").focus();
			}
			else
			{
				$("#valulcategorytype").hide();	
			}			
		}					
		if(sizecheck.checked == true)
		{	
			//alert("musaddiqa");
			var str = document.getElementById("sizename").value;
			if(str=="")
			{
				flag++;
				//alert("hiii");
				$("#valuesize").show();
				document.getElementById("txtsize").innerHTML="*this is a required field";
				document.getElementById("sizename").focus();
			}
			else
			{
				$("#valuesize").hide();	
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