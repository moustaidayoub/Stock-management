/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Metier.Message;
import Metier.User;
import Model.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
/**
 *
 * @author ayoub
 */
public class MessageHelper {
    public List MsgsRecusAdmin()
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.msgTo='admin' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
    public List MsgsRecusUser(String matricule)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.user.matUser='"+matricule+"' AND message.msgTo='user' order by message.dateMsg desc ");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
    public List MsgNonLusUser(String matricule)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.user.matUser='"+matricule+"' AND message.msgVue='0' AND message.msgTo='user' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
     public List MsgNonLusAdmin()
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.msgVue='0' AND message.msgTo='admin' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
    public List MsgLusUser(String matricule)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.user.matUser='"+matricule+"' AND message.msgVue='1' AND message.msgTo='user' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
    public List MsgLusAdmin()
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.msgVue='1' AND message.msgTo='admin' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
    public Message getMsg(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Message msg=(Message) session.get(Message.class, id);
   
    return msg;
    }
    public void setVue(Long id)
    {
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Message msg=(Message) session.get(Message.class, id);
    msg.setMsgVue(true);
    session.update(msg);
    session.beginTransaction().commit();
    }
    public List MsgEnvoyesUser(String matricule)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.user.matUser='"+matricule+"' AND message.msgTo='admin' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();         
    return listmsg;
    }
    public List MsgEnvoyesAdmin()
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.msgTo='user' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();         
    return listmsg;
    }
    public void AjouterMessageUser(String matricule,String objet,String msg)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    User user=(User)session.get(User.class, matricule);
     Helper h=new Helper();
     Date date=(Date) h.getDate().get(0);  
    Message message=new Message(user,"admin",date,objet,msg,false);
    session.persist(message);
    session.beginTransaction().commit();
   }
     public void AjouterMessageAdmin(String matricule,String objet,String msg)
        {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    User user=(User)session.get(User.class, matricule);
     Helper h=new Helper();
     Date date=(Date) h.getDate().get(0);  
    Message message=new Message(user,"user",date,objet,msg,false);
    session.persist(message);
    session.beginTransaction().commit();
   }
      public List UserMsgBy(String matricule,String critere,String valeur)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.user.matUser='"+matricule+"' AND  message."+critere+" LIKE '%"+valeur+"%' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
           public List MsgBy(String critere,String valeur)
    {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message."+critere+" LIKE '%"+valeur+"%' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
     
               public List MsgByDate(String date1,String date2)
        {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.dateMsg BETWEEN '"+date1+"' AND '"+date2+"' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
          public List UserMsgByDate(String matricule,String date1,String date2)
        {
        List<Message> listmsg=null;
    Session session=HibernateUtil.getSessionFactory().getCurrentSession();
    session.beginTransaction();
    Query q=session.createQuery("from Message as message where message.dateMsg BETWEEN '"+date1+"' AND '"+date2+"' AND message.user.matUser='"+matricule+"' order by message.dateMsg desc");
    listmsg=(List<Message>) q.list();   
    return listmsg;
    }
}
