package myPkg.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MessageDao {

	private Connection conn = null;
	
	private static MessageDao instance;
	
	private MessageDao() throws Exception {
		System.out.println("MessageDao() »ý¼ºÀÚ");
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
		conn = ds.getConnection();
	}
	
	public static MessageDao getInstance() throws Exception {
		if(instance == null) instance = new MessageDao();
		return instance;
	} // getInstance
	
	public ArrayList<MessageBean> getToMessage(String id) throws SQLException {
		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		
		String sql = "select * from msg_board where toInfo like ? order by num desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+id);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			MessageBean mb = setMsgBean(rs);
			
			list.add(mb);
		}
		
		return list;
	} // getToMessage
	
	public ArrayList<MessageBean> getSendMessage(String id) throws SQLException {
		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		
		String sql = "select * from msg_board where writer=? order by num desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			MessageBean mb = setMsgBean(rs);
			
			list.add(mb);
		}
		
		return list;
	} // getSendMessage
	
	public int insertMessage(MessageBean mb) throws SQLException {
		int cnt = -1;
		
		String sql = "insert into msg_board values(msg_seq.nextval,?,?,?,?,?,1)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getWriter());
		ps.setString(2, mb.getSubject());
		ps.setString(3, mb.getToInfo());
		ps.setString(4, mb.getContent());
		ps.setString(5, mb.getReg_date());

		cnt = ps.executeUpdate();
		
		return cnt;
	} // insertMessage
	
	public MessageBean getMessageByNum(String num) throws SQLException {
		MessageBean mb = null;
		
		String sql = "select * from msg_board where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		//System.out.println("dao num: "+num);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			mb = setMsgBean(rs);
		}
		
		return mb;
	} // getMessageByNum
	
	public MessageBean getToMessageByNum(String num) throws SQLException {
		MessageBean mb = null;
		
		String sql = "update msg_board set toRead=0 where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		
		sql= "select * from msg_board where num="+num;
		ps = conn.prepareStatement(sql);
		//System.out.println("dao num: "+num);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			mb = setMsgBean(rs);
		}
		
		return mb;
	} // getToMessageByNum
	
	public MessageBean setMsgBean(ResultSet rs) throws SQLException {
		
		int num = rs.getInt("num");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String toInfo = rs.getString("toInfo");
		String content = rs.getString("content");
		String reg_date = rs.getString("reg_date");
		int toRead = rs.getInt("toRead");
		
		MessageBean mb = new MessageBean();
		
		mb.setNum(num);
		mb.setWriter(writer);
		mb.setSubject(subject);
		mb.setToInfo(toInfo);
		mb.setContent(content);
		mb.setReg_date(reg_date);
		mb.setToRead(toRead);
		
		return mb;
	} // setMsgBean
	
	public int updateMessage(MessageBean mb) throws SQLException {
		int cnt = -1;
		
		String sql = "update msg_board set subject=?, content=?, reg_date=? where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getSubject());
		ps.setString(2, mb.getContent());
		ps.setString(3, mb.getReg_date());
		ps.setInt(4, mb.getNum());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // updateMessage

}
