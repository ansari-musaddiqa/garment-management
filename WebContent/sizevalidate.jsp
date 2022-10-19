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
		//alert("shivani");
		var sizenm=document.getElementById('size').value;
		var cat=document.getElementById('cat-type').value;
		var flag = 0;
		//alert(cat);
		if(sizenm == "" && cat == "Category Type")
		{
			flag++;
			$("#valsizenm").show();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtsizenm").innerHTML="*this is a required field";
			document.getElementById("size").focus();
			document.getElementById("txtcatnm").innerHTML="*please select a category";
			//flag = 0;
		}
		else if(sizenm == "" && cat != "Category Type")
		{
			flag++;
			$("#valsizenm").show();
			$("#valup").hide();
			$("#valcatnm").hide();
			document.getElementById("txtsizenm").innerHTML="*this is a required field";
			document.getElementById("size").focus();
			//flag = 0;
		}
		else if(cat == "Category Type" && sizenm != "")
		{
			flag++;
			$("#valsizenm").hide();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtcatnm").innerHTML="*please select a category";
			document.getElementById("cat-type").focus();
			//flag = 0;	
		}
		else
		{
			$("#valsizenm").hide();
			$("#valup").hide();
			$("#valcatnm").hide();
			//flag = 1;
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