package demo.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.Item;
import bean.model.Product;
import bean.model.dao.ProductDAO;

@Controller
@RequestMapping(value="/cart", method=RequestMethod.GET)
public class ShoppingCartController {
	
	private List<Item> itemList = new ArrayList<Item>();
	
	@RequestMapping("/buy/{id}/{quantity}")
	public String buy(@PathVariable(value="id") String id, 
			@PathVariable(value="quantity") int quantity ) {

		int index = getIndex(id);
		if(index >= 0) {
			int q = itemList.get(index).getQuantity();
			itemList.get(index).setQuantity(q + quantity);
			return "redirect:/cart/show";
		}
		
		ProductDAO productDAO = new ProductDAO();
		List<Product> proList = productDAO.getProducts();
		for(int i=0; i<proList.size(); i++) {
			if(proList.get(i).getId().equalsIgnoreCase(id)) {
				itemList.add(new Item(proList.get(i), quantity));
				return "redirect:/cart/show";
			}
		}
		
		return "redirect:/cart/show";
	}
	
	@RequestMapping("/show")
	public String shoppingCart(Model model) {
		model.addAttribute("itemList", itemList);
		return "shopping_cart";
	}
	
	
	@RequestMapping("/modify/{id}/{quantity}")
	public String modify(@PathVariable String id, @PathVariable int quantity) {
		
		int idInt = getIndex(id);
		
		if(quantity == 0)
			itemList.remove(idInt);
		else
			itemList.get(idInt).setQuantity(quantity);
		
		return "redirect:/cart/show";
		
	}
	
	
	private int getIndex(String id) {
		for(int i=0; i<itemList.size(); i++) {
			if(itemList.get(i).getProduct().getId().equalsIgnoreCase(id))
				return i;
		}
		return -1;
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		int total = 0;
		
		for(int i=0; i<itemList.size(); i++) {
			total += (itemList.get(i).getQuantity() * itemList.get(i).getProduct().getPrice());
		}
		model.addAttribute("total", total);
		itemList.clear();
		
		return "checkout";
	}
	

}
