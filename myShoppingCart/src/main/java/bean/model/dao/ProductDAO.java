package bean.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import bean.model.Product;

public class ProductDAO {

	private List<Product> list;
	
	public ProductDAO() {
		hibernateLink();
	}
	private void hibernateLink() {
		Session session = null;
		Transaction transaction = null;
		
		try {
			Configuration config = new Configuration().configure("hibernate.cfg.xml");
			session = config.buildSessionFactory().openSession();
			transaction = session.beginTransaction();

			list = session.createQuery("FROM Product").list();
			transaction.commit();
		} catch(Exception ex) {
			if(transaction != null)
				transaction.rollback();
			System.out.println(ex);
		} finally {
			if(session != null)
				session.close();
		}
	}
	
	
	public List<Product> getProducts(){
		return list;
	}
	
	public Product getProductById(String id) {
		Product pro = null;
		for(int i=0; i<list.size(); i++) {
			pro = list.get(i);
			if(id.equals(pro.getId()))
				return pro;
		}
		return null;
	}
}
