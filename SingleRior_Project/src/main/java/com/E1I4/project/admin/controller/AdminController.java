package com.E1I4.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminController {
	
	@RequestMapping("index.adm")
	public String adminView() {
		return"index";
	}
	@RequestMapping("insertProduct.adm")
	public String insertProduct() {
		return "insertProduct";
	}
	
	@RequestMapping("orderList.adm")
	public String orderList() {
		return "orderList";
	}
	@RequestMapping("manageUser.adm")
	public String manageUser() {
		return "manageUser";
	}
	@RequestMapping("manageProduct.adm")
	public String manageProduct() {
		return "manageProduct";
	}
	@RequestMapping("statUser.adm")
	public String statUser() {
		return "statUser";
	}
	@RequestMapping("statProduct.adm")
	public String statProduct() {
		return "statProduct";
	}
	@RequestMapping("manageNotice.adm")
	public String managerNotice() {
		return "manageNotice";
	}
	@RequestMapping("manageQNA.adm")
	public String managerQNA() {
		return "manageQNA";
	}
	@RequestMapping("insertNotice.adm")
	public String insertNotice() {
		return "insertNotice";
	}
	@RequestMapping("insertQNA.adm")
	public String insertQNA() {
		return "insertQNA";
	}
	@RequestMapping("manageReport.adm")
	public String manageReport() {
		return "manageReport";
	}
	@RequestMapping("manageBanner.adm")
	public String managerBanner() {
		return "manageBanner";
	}
	@RequestMapping("insertBanner.adm")
	public String insertBanner() {
		return "insertBanner";
	}
	@RequestMapping("updateBanner.adm")
	public String updateBanner() {
		return "updateBanner";
	}
}
