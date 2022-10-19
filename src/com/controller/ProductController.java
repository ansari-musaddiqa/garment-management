package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.bean.ProductBean;
import com.bean.ShopBean;
import com.dao.ProductDao;
import com.dao.ShopDao;

@WebServlet("/productcontroller")
@MultipartConfig(fileSizeThreshold=1024*1024*10,maxFileSize=1024*1024*50,maxRequestSize=1024*1024*100)
public class ProductController extends HttpServlet{

	String pnm="",des="",img="",code="";
	int qty=0,bid=0,typeid=0,mainid=0,subid=0,sizeid=0,colorid=0,matid=0,venid=0,price=0;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			Part part=req.getPart("image");
			String path=req.getServletContext().getRealPath("/") + "\\upload\\" + part.getSubmittedFileName();
			part.write(path);
			
			ProductBean pb=new ProductBean();
			pb.setProdnm(req.getParameter("pnm"));
			pb.setCode(req.getParameter("code"));
			pb.setQty(Integer.parseInt(req.getParameter("qty")));
			pb.setBranchid(Integer.parseInt(req.getParameter("shop")));
			pb.setTypeid(Integer.parseInt(req.getParameter("type")));
			pb.setMainid(Integer.parseInt(req.getParameter("main")));
			pb.setSubid(Integer.parseInt(req.getParameter("sub")));
			pb.setSizeid(Integer.parseInt(req.getParameter("size")));
			pb.setColorid(Integer.parseInt(req.getParameter("color")));
			pb.setMatid(Integer.parseInt(req.getParameter("material")));
			pb.setDes(req.getParameter("des"));
			pb.setVenid(Integer.parseInt(req.getParameter("vendor")));
			pb.setPrice(Integer.parseInt(req.getParameter("price")));
			pb.setImg(part.getSubmittedFileName());
			
			ProductDao pd=new ProductDao();
			pd.insertproduct(pb);
			
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
		{
			
			int id = Integer.parseInt(req.getParameter("id"));
			ProductDao pd = new ProductDao();
			ProductBean pb = pd.getProductById(id);
			pnm = pb.getProdnm();
			code=pb.getCode();
			qty=pb.getQty();
			bid=pb.getBranchid();
			typeid=pb.getTypeid();
			mainid=pb.getMainid();
			subid=pb.getSubid();
			sizeid=pb.getSizeid();
			colorid=pb.getColorid();
			matid=pb.getMatid();
			venid=pb.getVenid();
			price=pb.getPrice();
			des=pb.getDes();
			img=pb.getImg();
			req.setAttribute("id", pb);
			req.getRequestDispatcher("updateProduct.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
		{
			String pnm1,code1,qty1,shop,type1,main1,sub1,size1,clr1,mat1,ven1,price1,img1;
			ProductBean pb = new ProductBean();
			System.out.println("\n\tname:"+req.getParameter("name"));
			pb.setProdid(Integer.parseInt(req.getParameter("id")));
			pnm1 = req.getParameter("name");
			code1=req.getParameter("code");
			qty1 = req.getParameter("qty");
			shop = req.getParameter("shop");
			type1 = req.getParameter("cattype");
			main1 = req.getParameter("category");
			sub1 = req.getParameter("sub-category");
			size1 = req.getParameter("size");
			clr1 = req.getParameter("color");
			mat1 = req.getParameter("mat");
			ven1 = req.getParameter("Vendor");
			price1 = req.getParameter("price");
			System.out.println(code1);
			ProductDao pd = new ProductDao();
			if(pnm1 == null || code1 == null || qty1 == null || shop == null || type1 == null || main1 == null || sub1 == null || size1 == null || clr1 == null || mat1 == null || ven1 == null || price1 == null)
			{	
				if(pnm1 != null)
				{
					pnm = pnm1;
				}
				if(code1 != null)
				{
					code = code1;
				}
				if(qty1 != null)
				{
					qty = Integer.parseInt(qty1);
				}
				if(shop != null)
				{
					bid = Integer.parseInt(shop);
				}
				if(type1 != null)
				{
					typeid = Integer.parseInt(type1);
				}
				if(main1 != null)
				{
					mainid = Integer.parseInt(main1);
				}
				if(sub1 != null)
				{
					subid = Integer.parseInt(sub1);
				}
				if(size1 != null)
				{
					sizeid = Integer.parseInt(size1);
				}
				if(clr1 != null)
				{
					colorid = Integer.parseInt(clr1);
				}
				if(mat1 != null)
				{
					matid = Integer.parseInt(mat1);
				}
				if(ven1 != null)
				{
					venid = Integer.parseInt(ven1);
				}
				if(price1 != null)
				{
					price = Integer.parseInt(price1);
				}
				
			}
			else
			{
				pnm = pnm1;
				code=code1;
				qty = Integer.parseInt(qty1);
				bid = Integer.parseInt(shop);
				typeid = Integer.parseInt(type1);
				mainid = Integer.parseInt(main1);
				subid = Integer.parseInt(sub1);
				sizeid = Integer.parseInt(size1);
				colorid = Integer.parseInt(clr1);
				matid = Integer.parseInt(mat1);
				venid = Integer.parseInt(ven1);
				price = Integer.parseInt(price1);
			}
			Part part=req.getPart("image");
			if(part!=null)
			{
				String path=req.getServletContext().getRealPath("/") + "\\upload\\" + part.getSubmittedFileName();
				part.write(path);
				pb.setImg(part.getSubmittedFileName());
				System.out.println("\n\tnot null");
			}		
			else
			{
				System.out.println("\n\tnull");
				pb.setImg(img);
			}
			pb.setProdnm(pnm);
			pb.setCode(code);
			pb.setQty(qty);
			pb.setBranchid(bid);
			pb.setTypeid(typeid);
			pb.setMainid(mainid);
			pb.setSubid(subid);
			pb.setSizeid(sizeid);
			pb.setColorid(colorid);
			pb.setMatid(matid);
			pb.setVenid(venid);
			pb.setPrice(price);
			pd.updateProduct(pb);
			
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}

		else if(action.equalsIgnoreCase("show")) //execute when clicked on show report button
		{
			String shop = req.getParameter("shop");
			if(shop.equals("Shop"))
			{
				bid = 0;
			}
			else
			{
				bid = Integer.parseInt(shop);
			}

			System.out.print("Start Date : "+req.getParameter("trip-start")+"\nTo date : "+req.getParameter("to")+"\nshop : "+bid);
			
			ProductBean pb = new ProductBean();
			pb.setShopid(bid);
			pb.setFrmdt(req.getParameter("trip-start"));
			pb.setTodt(req.getParameter("to"));
			
			ProductDao dao = new ProductDao();
			List<ProductBean> list = dao.getProductsReport(pb);
			
			req.setAttribute("show",list);
			req.getRequestDispatcher("productreport.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			req.getRequestDispatcher("ViewShop.jsp").forward(req, res);
		}
	}
}
