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
			var catnm=document.getElementById("cat-type").value;
			var pattern=/^[A-Za-z ]*$/;
				
			var flag=0;
			//alert("Hyy");
			
			
			if(catnm == "")
			{
				//alert("h");
				$("#valcatnm").show();
				$("#valup").hide();
				document.getElementById("txtcatnm").innerHTML="*this is a required field";
				document.getElementById("cat-type").focus();
				flag++;
			}

			else if(!(pattern.test(catnm)))
			{
					$("#valcatnm").show();
					$("#valup").hide();
					document.getElementById("txtcatnm").innerHTML="*please enter a valid category name";
					document.getElementById("cat-type").focus();	
					flag++;
			}
			else
			{
				$("#valcatnm").hide();
				$("#valup").hide();
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