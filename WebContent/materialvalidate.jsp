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
			var matnm=document.getElementById('mat-name').value;
			var pattern=/^[A-Za-z ]*$/;
				if(matnm == "")
			{
				$("#valmatnm").show();
				$("#valup").hide();
				document.getElementById("txtmatnm").innerHTML="*this is a required field";
				document.getElementById("mat-name").focus();
				flag=0;
			}
			else
			{
				if(pattern.test(matnm))
				{
					$("#valmatnm").hide();
					$("#valup").hide();
					//alert("How")
					flag=1;
				}
				else
				{
					$("#valmatnm").show();
					$("#valup").hide();
					document.getElementById("txtmatnm").innerHTML="*please enter a valid material name";
					document.getElementById("mat-name").focus();	
					flag=0;
				}
				
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