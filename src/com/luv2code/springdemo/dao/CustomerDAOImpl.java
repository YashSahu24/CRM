package com.luv2code.springdemo.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {

	Session current=sessionFactory.getCurrentSession();
	
	Query<Customer> theQuery=current.createQuery("from Customer order by lastName"
			                                    , Customer.class);
	List<Customer> customers=theQuery.getResultList();
		
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {

		Session current=sessionFactory.getCurrentSession();
		
		current.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomer(int id) {
	
		Session current=sessionFactory.getCurrentSession();
		Customer theCustomer=current.get(Customer.class, id);
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int id) {

		Session current=sessionFactory.getCurrentSession();
		
		Query<Customer> theQuery=current.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", id);
		theQuery.executeUpdate();
	}

}
