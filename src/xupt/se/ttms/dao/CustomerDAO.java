package xupt.se.ttms.dao;

import xupt.se.ttms.idao.iCustomerDAO;
import xupt.se.ttms.model.Customer;
import xupt.se.ttms.model.Employee;
import xupt.se.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class CustomerDAO  implements iCustomerDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Customer customer)
    {
        int result=0;
        try
        {
            String sql="insert into customer(cus_name, cus_email, cus_pwd )"
                    + " values('" + customer.getName() + "', '" + customer.getEmail() + "', '" + customer.getPwd() + "' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                customer.setID(rst.getInt(1));
            }
            db.close(rst);
            db.close();
            result=1;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return result;
        }
    }


    @SuppressWarnings("finally")
    @Override
    public List<Customer> select(String customerEmail)
    {
        DBUtil db=null;
        List<Customer> customerList=null;
        customerList=new LinkedList<Customer>();
        try
        {
            customerEmail.trim();
            String sql="select * from customer where cus_email like '" + customerEmail + "'";
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table customer");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Customer customer = new Customer();
                    customer.setID(rst.getInt("cus_id"));
                    customer.setName(rst.getString("cus_name"));
                    customer.setEmail(rst.getString("cus_email"));
                    customer.setPwd(rst.getString("cus_pwd"));
                    customerList.add(customer);
                }
            }
            db.close(rst);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return customerList;
        }
    }
}
