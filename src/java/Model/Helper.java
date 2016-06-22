/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author ayoub
 */
public class Helper {
    
    public List getDate()
    {
        Date d=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    SQLQuery q=session.createSQLQuery("select sysdate()");
    List<Date> date=(List<Date>) q.list();
  return date;
    }
    
}
