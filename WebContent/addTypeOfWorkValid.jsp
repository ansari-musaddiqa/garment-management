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
		var co=document.getElementById('typeOfWork').value;
		var pattern=/^[A-Za-z ]*$/
		if(co == "" )
		{
			$("#valtypeofwork").show();
			document.getElementById("txttypeofwork").innerHTML="*this is a required field";
			document.getElementById("typeOfWork").focus();
			flag++;
		}
		else if(!(pattern.test(co)))
		{
			$("#valtypeofwork").show();
			document.getElementById("txttypeofwork").innerHTML="*Please enter only character";
			document.getElementById("typeOfWork").focus();
			flag++;		
		}
		else
		{
			$("#valtypeofwork").hide();
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