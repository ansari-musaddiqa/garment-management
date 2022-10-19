<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	$(document).ready
	(
		function(){
		//alert("Hello World");
		$(".script1").hide();
		document.getElementById('inputimage').disabled=true;
		document.getElementById('price').disabled=true;
		document.getElementById('Vendor').disabled=true;
		document.getElementById('descrp').disabled=true;
		document.getElementById('mat').disabled=true;
		document.getElementById('color').disabled=true;
		document.getElementById('size').disabled=true;
		document.getElementById('category').disabled=true;
		document.getElementById('sub-category').disabled=true;
		document.getElementById('cattype').disabled=true;
		document.getElementById('shop').disabled=true;
		document.getElementById('qty').disabled=true;
		document.getElementById('code').disabled=true;
		document.getElementById('name').disabled=true;
		
		$("#imgchng").change(function(){
			if(imgchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('inputimage').disabled=false;
				document.getElementById("inputimage").focus();
			}
			else
			{
				$("#valimg").hide();
				document.getElementById('inputimage').disabled=true;
			}
		});

		$("#pricechng").change(function(){
			if(pricechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('price').disabled=false;
				document.getElementById("price").focus();
			}
			else
			{
				$("#valprice").hide();
				document.getElementById('price').disabled=true;
			}
		});

		$("#venchng").change(function(){
			if(venchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('Vendor').disabled=false;
				document.getElementById("Vendor").focus();
			}
			else
			{
				$("#valvennm").hide();
				document.getElementById('Vendor').disabled=true;
			}
		});

		$("#deschng").change(function(){
			if(deschng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('descrp').disabled=false;
				document.getElementById("descrp").focus();
			}
			else
			{
				$("#valdes").hide();
				document.getElementById('descrp').disabled=true;
			}
		});

		$("#matchng").change(function(){
			if(matchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('mat').disabled=false;
				document.getElementById("mat").focus();
			}
			else
			{
				$("#valmatnm").hide();
				document.getElementById('mat').disabled=true;
			}
		});

		$("#colchng").change(function(){
			if(colchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('color').disabled=false;
				document.getElementById("color").focus();
			}
			else
			{
				$("#valcolnm").hide();
				document.getElementById('color').disabled=true;
			}
		});

		$("#sizechng").change(function(){
			if(sizechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('size').disabled=false;
				document.getElementById("size").focus();
			}
			else
			{
				$("#valsizenm").hide();
				document.getElementById('size').disabled=true;
			}
		});

		$("#subchng").change(function(){
			if(subchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('sub-category').disabled=false;
				document.getElementById("sub-category").focus();
			}
			else
			{
				$("#valsubnm").hide();
				document.getElementById('sub-category').disabled=true;
			}
		});
		
		$("#catchng").change(function(){
			if(catchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('category').disabled=false;
				document.getElementById("category").focus();
			}
			else
			{
				$("#valcatnm").hide();
				document.getElementById('category').disabled=true;
			}
		});

		
		$("#typechng").change(function(){
			if(typechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('cattype').disabled=false;
				document.getElementById("cattype").focus();
			}
			else
			{
				$("#valtypenm").hide();
				document.getElementById('cattype').disabled=true;
			}
		});
		
		$("#shopchng").change(function(){
			if(shopchng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('shop').disabled=false;
				document.getElementById("shop").focus();
			}
			else
			{
				$("#valshopnm").hide();
				document.getElementById('shop').disabled=true;
			}
		});

		$("#qtychng").change(function(){
			if(qtychng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('qty').disabled=false;
				document.getElementById("qty").focus();
			}
			else
			{
				$("#valqnt").hide();
				document.getElementById('qty').disabled=true;
			}
		});

		$("#codechng").change(function(){
			if(codechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('code').disabled=false;
				document.getElementById("code").focus();
			}
			else
			{
				$("#valcode").hide();
				document.getElementById('code').disabled=true;
			}
		});
		
		$("#namechng").change(function(){
			if(namechng.checked == true)
			{
				//alert("Hyy");
				document.getElementById('name').disabled=false;
				document.getElementById("name").focus();
			}
			else
			{
				$("#valpnm").hide();
				document.getElementById('name').disabled=true;
			}
		});

    });
	
	/*function validate()
	{
		if(imgchng.checked == true)
		{
			var img1=document.getElementById('inputimage').value;
			if(img1 == "")
			{

				$("#valimg").show();
				//$("#valup").hide();
				document.getElementById("txtimg").innerHTML="*this is a required field";
				document.getElementById("inputimage").focus();
			}
			else
			{
				$("#valimg").hide();
				//$("#valup").hide();
			}

		}
		else
		{
			$("#valimg").hide();	
			document.getElementById('inputimage').value="";
		}
		
		if(pricechng.checked == true)
		{
			var price=document.getElementById('price').value;
			if(price == "")
			{

				$("#valprice").show();
            	//$("#valup").hide();
				document.getElementById("txtprice").innerHTML="*this is a required field";
				document.getElementById("price").focus();
			}
			else
			{
				$("#valprice").hide();
            //$("#valup").hide();
			}

		}
		else
		{
			$("#valprice").hide();
			//document.getElementById('price').value=" ";			
		}
		
		if(venchng.checked == true)
		{
			var vendor=document.getElementById('Vendor').value;
			if(vendor == "Vendor")
			{

				$("#valvennm").show();
				//$("#valup").hide();
				document.getElementById("txtvennm").innerHTML="*please select a vendor name";
				document.getElementById("Vendor").focus();
			}
			else
			{
				$("#valvennm").hide();
				//$("#valup").hide();
			}

		}
		else
		{
			$("#valvennm").hide();
		}
		
		if(colchng.checked == true)
		{
			var color=document.getElementById('color').value;
			if(color == "Color")
			{

				$("#valcolnm").show();
				//$("#valup").hide();
				document.getElementById("txtcolnm").innerHTML="*please select a color name";
				document.getElementById("color").focus();
			}
			else
			{
				$("#valcolnm").hide();
				//$("#valup").hide();
			}
		}
		else
		{
			$("#valcolnm").hide();
		}
		
		if(sizechng.checked == true)
		{
			var size=document.getElementById('size').value;
			if(size == "Size")
			{

				$("#valsizenm").show();
				//$("#valup").hide();
				document.getElementById("txtsizenm").innerHTML="*please select a size name";
				document.getElementById("size").focus();
			}
			else
			{
				$("#valsizenm").hide();
				//$("#valup").hide();
			}

		}
		else
		{
			$("#valsizenm").hide();
		}
		
		if(subchng.checked == true)
		{
			var sub=document.getElementById('sub-category').value;
			if(sub == "Sub-Category")
			{

				$("#valsubnm").show();
				//$("#valup").hide();
				document.getElementById("txtsubnm").innerHTML="*please select a category type";
				document.getElementById("sub-category").focus();
			}
			else
			{
				$("#valsubnm").hide();
			//	$("#valup").hide();
			}
		}
		else
		{
			$("#valsubnm").hide();
		}
		
		if(catchng.checked == true)
		{
			var cat=document.getElementById('category').value;
			if(cat == "Category")
			{

				$("#valcatnm").show();
				//$("#valup").hide();
				document.getElementById("txtcatnm").innerHTML="*please select a category type";
				document.getElementById("category").focus();
			}
			else
			{
				$("#valcatnm").hide();
				//$("#valup").hide();
			}
		}
		else
		{
			$("#valcatnm").hide();
		}
		
		if(qtychng.checked == true)
		{
			var qty=document.getElementById('qty').value;
			if(qty == "")
			{

				$("#valqnt").show();
				//$("#valup").hide();
				document.getElementById("txtqnt").innerHTML="*please enter quantity";
				document.getElementById("qty").focus();
			}
			else
			{
				$("#valqnt").hide();
			//	$("#valup").hide();
			}
		}
		else
		{
			$("#valqnt").hide();
		}
		
		if(namechng.checked == true)
		{
			var name=document.getElementById('name').value;
			if(name == "")
			{

				$("#valpnm").show();
				//$("#valup").hide();
				document.getElementById("txtpnm").innerHTML="*please enter product name";
				document.getElementById("name").focus();
			}
			else
			{
				$("#valpnm").hide();
			//	$("#valup").hide();
			}
		}
		else
		{
			$("#valpnm").hide();
		}
	}*/
	
	function validate()
    {
		var img1=document.getElementById('inputimage').value;
		var price=document.getElementById('price').value;
		var vendor=document.getElementById('Vendor').value;
		var vendor=document.getElementById('descrp').value;
		var shop=document.getElementById('shop').value;
		var color=document.getElementById('color').value;
		var size=document.getElementById('size').value;
		var type=document.getElementById('cattype').value;
		var cat=document.getElementById('category').value;
		var sub=document.getElementById('sub-category').value;
		var qty=document.getElementById('qty').value;
		var code=document.getElementById('code').value;
		var name=document.getElementById('name').value;
		var mat=document.getElementById('mat').value;
		var flag=0;
		var flag1=1;
		
		$("#imgchng").change(function(){
			if(imgchng.checked == true)
			{
			if(img1 == "")
			{

			$("#valimg").show();
			$("#valup").hide();
			document.getElementById("txtimg").innerHTML="*this is a required field";
			document.getElementById("inputimage").focus();
			flag1=0;
		}
		else
		{
			$("#valimg").hide();
			$("#valup").hide();
			flag=1;
		}
			}
		});
		if(price == "")
		{

			$("#valprice").show();
			$("#valup").hide();
			document.getElementById("txtprice").innerHTML="*this is a required field";
			document.getElementById("price").focus();
			flag1=0;
		}
		else
		{
			$("#valprice").hide();
			$("#valup").hide();
			flag=1;
		}
		if(vendor == "Vendor")
		{

			$("#valvennm").show();
			$("#valup").hide();
			document.getElementById("txtvennm").innerHTML="*please select a vendor name";
			document.getElementById("Vendor").focus();
			flag1=0;
		}
		else
		{
			$("#valvennm").hide();
			$("#valup").hide();
			flag=1;
		}
		if(mat == "Material")
		{
			$("#valmatnm").show();
			$("#valup").hide();
			document.getElementById("txtmatnm").innerHTML="*please select a material name";
			document.getElementById("mat").focus();
			flag1=0;
		}
		else
		{
			$("#valmatnm").hide();
			$("#valup").hide();
			flag=1;
		}
		if(color == "Color")
		{

			$("#valcolnm").show();
			$("#valup").hide();
			document.getElementById("txtcolnm").innerHTML="*please select a color name";
			document.getElementById("color").focus();
			flag1=0;
		}
		else
		{
			$("#valcolnm").hide();
			$("#valup").hide();
			flag=1;
		}

		if(size == "Size")
		{

			$("#valsizenm").show();
			$("#valup").hide();
			document.getElementById("txtsizenm").innerHTML="*please select a size name";
			document.getElementById("size").focus();
			flag1=0;
		}
		else
		{
			$("#valsizenm").hide();
			$("#valup").hide();
			flag=1;
		}
		if(sub == "Sub-Category")
		{

			$("#valsubnm").show();
			$("#valup").hide();
			document.getElementById("txtsubnm").innerHTML="*please select a category type";
			document.getElementById("sub-category").focus();
			flag1=0;
		}
		else
		{
			$("#valsubnm").hide();
			$("#valup").hide();
			flag=1;
		}
		if(cat == "Category")
		{

			$("#valcatnm").show();
			$("#valup").hide();
			document.getElementById("txtcatnm").innerHTML="*please select a category type";
			document.getElementById("category").focus();
			flag1=0;
		}
		else
		{
			$("#valcatnm").hide();
			$("#valup").hide();
			flag=1;
		}

		if(type == "Category Type")
		{
			$("#valtypenm").show();
			$("#valup").hide();
			document.getElementById("txttypenm").innerHTML="*please select a category type";
			document.getElementById("cattype").focus();
			flag1=0;
		}
		else
		{
			$("#valtypenm").hide();
			$("#valup").hide();
			flag=1;
		}

		if(shop == "Shop")
		{

			$("#valshopnm").show();
			$("#valup").hide();
			document.getElementById("txtshopnm").innerHTML="*please select a shop name";
			document.getElementById("shop").focus();
			flag1=0;
		}
		else
		{
			$("#valshopnm").hide();
			$("#valup").hide();
			flag=1;
		}
		if(qty == "")
		{

			$("#valqnt").show();
			$("#valup").hide();
			document.getElementById("txtqnt").innerHTML="*please enter quantity";
			document.getElementById("qty").focus();
			flag1=0;
		}
		else
		{
			$("#valqnt").hide();
			$("#valup").hide();
			flag=1;
		}
		
		if(code == "")
		{

			$("#valcode").show();
			$("#valup").hide();
			document.getElementById("txtcode").innerHTML="*please enter code";
			document.getElementById("code").focus();
			flag1=0;
		}
		else
		{
			$("#valcode").hide();
			$("#valup").hide();
			flag=1;
		}

		if(name == "")
		{

			$("#valpnm").show();
			$("#valup").hide();
			document.getElementById("txtpnm").innerHTML="*please enter product name";
			document.getElementById("name").focus();
			flag1=0;
		}
		else
		{
			$("#valpnm").hide();
			$("#valup").hide();
			flag=1;
		}

		if(flag1 == 0)
		{
			return false;
		}
		else 
		{
			return true;
		}
		
    }
</script>