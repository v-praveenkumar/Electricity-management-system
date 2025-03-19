package com.service; 
 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bean.AdminConsumer;
import com.bean.AdminCustomer; 
import com.dao.AdminEMSDao; 
 
public class AdminEMSService { 
 
    private AdminEMSDao customerDAO = new AdminEMSDao(); 
 
    public String registerCustomer(AdminCustomer adminCustomer) { 
        try { 
            String success = customerDAO.addCustomer(adminCustomer); 
            if (success.split("/")[0].equals("SUCCESS")) { 
                return success; 
            } 
            return "FAIL"; 
        } catch (Exception e) { 
            return e.getMessage(); // Return specific error message 
        } 
    } 
    
    public String registerConsumer(AdminConsumer adminConsumer) { 
        try { 
            String success = customerDAO.addConsumer(adminConsumer); 
            if (success.split("/")[0].equals("SUCCESS")) { 
                return success; 
            } 
            return "FAIL"; 
        } catch (Exception e) { 
            return e.getMessage(); // Return specific error message 
        } 
    } 
    
    public ArrayList<AdminCustomer> searchCustomerById(String id) throws ClassNotFoundException, SQLException {  
    	ArrayList<AdminCustomer> adminCustomers = customerDAO.searchCustomerById(id); 
        return adminCustomers;
    } 
    
    public ArrayList<AdminConsumer> searchConsumersById(String id) throws ClassNotFoundException, SQLException {  
    	ArrayList<AdminConsumer> adminConsumers = customerDAO.searchConsumersById(id); 
        return adminConsumers;
    } 
    
    public ArrayList<AdminCustomer> searchCustomerByName(String name) throws ClassNotFoundException, SQLException {  
    	 System.out.println(name);
    	ArrayList<AdminCustomer> adminCustomers = customerDAO.searchCustomerByName(name); 
        return adminCustomers;
    } 
    
    public HashMap<String,List<AdminConsumer>> searchConsumersByName(List<AdminCustomer> adminCustomers) throws ClassNotFoundException, SQLException {  
    	 System.out.println(adminCustomers);
    	HashMap<String,List<AdminConsumer>> consumerCustomerMapping = customerDAO.searchConsumersByName(adminCustomers); 
        return consumerCustomerMapping;
    } 
    
    public String updateCustomer(AdminCustomer adminCustomer) { 
        try { 
            String success = customerDAO.updateCustomer(adminCustomer); 
            if (success.split("/")[0].equals("SUCCESS")) { 
                return success; 
            } 
            return "FAIL"; 
        } catch (Exception e) { 
            return e.getMessage(); // Return specific error message 
        } 
    } 
    
}