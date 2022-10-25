package bean.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Product {

	@Id
	private String id;
	private String name;
	private String image;
	private double price;
	
	public Product() {
	}
	public Product(String id, String name, String image, double price) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + "]";
	}
	
	
}
