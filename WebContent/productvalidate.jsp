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
		var img1=document.getElementById('inputimage').value;
		var price=document.getElementById('price').value;
		var vendor=document.getElementById('Vendor').value;
		var shop=document.getElementById('shop').value;
		var color=document.getElementById('color').value;
		var size=document.getElementById('size').value;
		var type=document.getElementById('cattype').value;
		var cat=document.getElementById('category').value;
		var sub=document.getElementById('sub-category').value;
		var qty=document.getElementById('qty').value;
		var name=document.getElementById('name').value;
		var mat=document.getElementById('mat').value;
		var code=document.getElementById('code').value;
		var flag=0;
		var flag1=1;
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