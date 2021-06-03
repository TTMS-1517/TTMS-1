package xupt.se.ttms.idao;

import xupt.se.ttms.dao.EmployeeDAO;
import xupt.se.ttms.dao.PlayDAO;
import xupt.se.ttms.dao.StudioDAO;

public class DAOFactory
{
    private static iStudioDAO stuDao;

    private static iPlayDAO playDao;

    private static iEmployeeDAO empDao;

    public static synchronized iStudioDAO creatStudioDAO()
    {
        if(null == stuDao)
            stuDao=new StudioDAO();
        return stuDao;
    }

    public static synchronized iPlayDAO creatPlayDAO()
    {
        if(null == playDao)
            playDao=new PlayDAO();
        return playDao;
    }

    public static synchronized iEmployeeDAO creatEmployeeDAO()
    {
        if(null == empDao)
            empDao=new EmployeeDAO();
        return empDao;
    }
}
