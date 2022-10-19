<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('descrp').disabled=true;		
		document.getElementById('mcategory').disabled=true;		
		document.getElementById('category').disabled=true;		
		$("#deschng").change(function(){
			if(deschng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('descrp').disabled=false;
				document.getElementById("descrp").focus();
			}
			else
			{
				//$("#valnm").hide();
				document.getElementById('descrp').disabled=true;
			}
		});
		$("#catchng").change(function(){
			if(catchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('mcategory').disabled=false;
				document.getElementById("mcategory").focus();
			}
			else
			{
				$("#valcat").hide();
				document.getElementById('mcategory').disabled=true;
			}
		});
		$("#subchng").change(function(){
			if(subchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('category').disabled=false;
				document.getElementById("category").focus();
			}
			else
			{
				$("#valsub").hide();
				document.getElementById('category').disabled=true;
			}
		});
	});
	
	function validate()
	{
		//alert("Hy");
		var flag1=1,flag2=1,flag3=0,flag=0;
		var cat=document.getElementById('mcategory').value;
		if(catchng.checked == true)
		{
			if(cat == "Main-Category")
			{

				$("#valcat").show();
				//$("#valup").hide();
				document.getElementById("txtcat").innerHTML="*please enter a category";
				document.getElementById("mcategory").focus();
				flag1=0;
			}
			else
			{
				$("#valcat").hide();
				//$("#valup").hide();
				flag1=1;
			}

		}
		else
		{
			if(cat == "Main-Category")
			{

				$("#valcat").show();
				//$("#valup").hide();
				document.getElementById("txtcat").innerHTML="*please enter a category";
				document.getElementById("mcategory").focus();
				flag1=0;
			}
			else
			{
				$("#valcat").hide();
				//$("#valup").hide();
				flag1=1;
			}

		}
		
		if(subchng.checked == true)
		{
			var sub=document.getElementById('category').value;
			if(sub == "")
			{

				$("#valsub").show();
				//$("#valup").hide();
				document.getElementById("txtsub").innerHTML="*this is a required field";
				document.getElementById("category").focus();
				flag2=0;
			}
			else
			{
				$("#valsub").hide();
				//$("#valup").hide();
				flag2=1;
			}

		}
		else
		{
			var sub=document.getElementById('category').value;
			if(sub == "")
			{

				$("#valsub").show();
				//$("#valup").hide();
				document.getElementById("txtsub").innerHTML="*this is a required field";
				document.getElementById("category").focus();
				flag2=0;
			}
			else
			{
				$("#valsub").hide();
				//$("#valup").hide();
				flag2=1;
			}

		}
		
		if(flag1 == 0 || flag2 == 0)
		{
			flag=0;
		}
		else
		{
			flag=1;
		}
		
		//alert(flag);
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