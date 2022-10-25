package demo.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.model.dao.ProductDAO;

@Controller
public class ProductController {

	@RequestMapping(value="/products", method=RequestMethod.GET)
	public String productIndex(Model model) {
		ProductDAO productDAO = new ProductDAO();
		
		model.addAttribute("productList", productDAO.getProducts());
		return "products";
	}
}
