<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
		$(document).ready
		(
			function(){
				//alert("hello");
				$(".script1").hide();
				$("#myform :text").prop("disabled", true);
				$("#category").prop("disabled", true);
				$("#cat-type").prop("disabled", true);
				$("#descrp").prop("disabled", true);
		});
		
	
		$("#nmcheck").change(function(){
			if(nmcheck.checked == true)
			{
				//alert("Hyy");
				$("#category").prop("disabled", false);
			}
			else
			{
				$("#category").prop("disabled", true);
			}
		});

		

		$("#typecheck").change(function(){
			if(typecheck.checked == true)
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
				$("#descrp").prop("disabled", false);
			}
			else
			{
				$("#descrp").prop("disabled", true);
			}
		});
		
		
		
		
				
		function validate()
		{
			
			var flag1=1,flag2=1,flag=0;
			if(typecheck.checked==true)
			{
					var e = document.getElementById("cat-type");
				    var str = e.options[e.selectedIndex].text;
					if(str=="Category Type")
					{
						//alert("please select the State");
						$("#valtype").show();
						document.getElementById("txttype").innerHTML="*this is a required field";
						document.getElementById("cat-type").focus();
						flag1=0;
					}
					else
					{
						$("#valtype").hide();	
						flag1=1;
					}
			}
							
						

			var lname=document.getElementById('category').value;
			var pat=/^[A-Za-z]*$/;
			
			
			if(nmcheck.checked==true)
			{
						if(lname == "")
						{
							$("#valname").show();
							document.getElementById("txtname").innerHTML="*this is a required field";
							document.getElementById("category").focus();
							flag2=0;
						}	
						else if(!(pat.test(document.getElementById("category").value)))	
						{
							$("#valname").show();
							document.getElementById("txtname").innerHTML="*Please enter only character";
							document.getElementById("category").focus();
							flag2=0;
						}
						else
						{
							$("#valname").hide();	
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