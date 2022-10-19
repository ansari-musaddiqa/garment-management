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
		 var flag=0;
		//alert("Hyy");
		var subnm=document.getElementById('category').value;
		var cat=document.getElementById('cat-type').value;
		var pattern=/^[A-Za-z ]*$/;
		
		//alert(cat);
		if(subnm == "" && cat == "Main-Category")
		{

			$("#valsubnm").show();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtsubnm").innerHTML="*this is a required field";
			document.getElementById("category").focus();
			document.getElementById("txtcatnm").innerHTML="*please select a category";
			flag=0;
		}
		else if(subnm == "" && cat != "Main-Category")
		{
			$("#valsubnm").show();
			$("#valup").hide();
			$("#valcatnm").hide();
			document.getElementById("txtsubnm").innerHTML="*this is a required field";
			document.getElementById("category").focus();
			flag=0;
		}
		else if(cat == "Main-Category" && subnm != "")
		{
			$("#valsubnm").hide();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtsubnm").innerHTML="*please select a category";
			document.getElementById("cat-type").focus();	
		    flag=0;
		}
		else if(!(pattern.test(subnm)))		
		{
			$("#valsubnm").show();
			$("#valup").hide();
			$("#valcatnm").hide();
			document.getElementById("txtsubnm").innerHTML="*Please enter valid subcategory";
			document.getElementById("category").focus();
			flag=0;
		}
		else
		{
			$("#valsubnm").hide();
			$("#valup").hide();
			$("#valcatnm").hide();
			flag=1;
		}

		if(flag==1)
			{
			 return true
			}
		else
			{
			return false;
			}
	}
</script>