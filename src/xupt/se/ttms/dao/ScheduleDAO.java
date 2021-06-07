package xupt.se.ttms.dao;

import xupt.se.ttms.idao.iScheduleDAO;
import xupt.se.ttms.idao.iStudioDAO;
import xupt.se.ttms.model.Schedule;
import xupt.se.ttms.model.Studio;
import xupt.se.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class ScheduleDAO implements iScheduleDAO
{
    @SuppressWarnings("finally")
    @Override
    public int insert(Schedule stu)
    {
        int result=0;
        try
        {
            String sql="insert into studio(studio_name, studio_row_count, studio_col_count, studio_introduction )"
                    + " values('" + stu.getStudioid() + "', " + stu.getPlayid() + ", " + stu.getSchedtime() + ", '"
                    + stu.getPrice() + "' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                stu.setID(rst.getInt(1));
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
    public int update(Schedule stu)
    {
        int result=0;
        try
        {
            String sql="update schedule set " + " studio_name ='" + stu.getStudioid() + "', " + " studio_row_count = "
                    + stu.getPlayid() + ", " + " studio_col_count = " + stu.getSchedtime() + ", "
                    + " studio_introduction = '" + stu.getPrice() + "' ";
            sql+=" where studio_id = " + stu.getID();
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
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

    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from  studio where studio_id = " + ID;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @SuppressWarnings("finally")
    public String selectstudioid(int condt)
    {
        DBUtil db=null;
        String result="";
        try
        {
            String sql="select studio_name from studio  where studio_id= " + condt;
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    result=rst.getString("studio_name");
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
            return result;
        }
    }

    @SuppressWarnings("finally")
    @Override
    public List<Schedule> select(int playid)
    {
        DBUtil db=null;
        List<Schedule> stuList=null;
        stuList=new LinkedList<Schedule>();
        try
        {
            String sql="select * from schedule where play_id = '" + playid + "'";
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table studio");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Schedule stu=new Schedule();
                    stu.setID(rst.getInt("sched_id"));
                    stu.setStudioid(rst.getInt("studio_id"));
                    stu.setPlayid(rst.getInt("play_id"));
                    stu.setSchedtime(rst.getString("sched_time"));
                    stu.setPrice(rst.getInt("sched_ticket_price"));
                    stuList.add(stu);
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
            return stuList;
        }
    }

}

