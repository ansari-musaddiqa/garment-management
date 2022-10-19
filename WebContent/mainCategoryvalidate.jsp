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
		//alert("Hyy");
		var flag=0;
		var name=document.getElementById('category').value;
		var cat=document.getElementById('cat-type').value;
		var pattern=/^[A-Za-z ]*$/;
		
		//alert(cat);
		if(name == "" && cat == "Category Type")
		{

			$("#valname").show();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtname").innerHTML="*this is a required field";
			document.getElementById("category").focus();
			document.getElementById("txtcatnm").innerHTML="*please select a category";
			flag=0;
		}
		else if(name == "" && cat != "Category Type")
		{
			$("#valname").show();
			$("#valup").hide();
			$("#valcatnm").hide();
			document.getElementById("txtname").innerHTML="*this is a required field";
			document.getElementById("category").focus();
			flag=0;
		}
		else if(cat == "Category Type" && name != "")
		{
			$("#valname").hide();
			$("#valup").hide();
			$("#valcatnm").show();
			document.getElementById("txtcatnm").innerHTML="*please select a category";
			document.getElementById("cat-type").focus();	
			flag=0;
		}
		else if(!(pattern.test(name)))
			{
			$("#valname").show();
			$("#valup").hide();
			$("#valcatnm").hide();
			document.getElementById("txtname").innerHTML="*Please enter valid main category";
			document.getElementById("category").focus();
			flag=0;
			}
		else
		{
			$("#valname").hide();
			$("#valup").hide();
			$("#valcatnm").hide();
			flag=1;
		}

		if(flag==0)
			{
			return false;
			}
		else
			{
			return true;
			}
	}
</script>