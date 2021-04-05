package myPkg.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	private Connection conn = null;
	
	private static MemberDao instance;
	
	private MemberDao() throws Exception {
		System.out.println("MemberDao()");
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
		conn = ds.getConnection();
		System.out.println("conn:" + conn);
	} // 생성자
	
	public static MemberDao getInstance() throws Exception {
		if(instance == null) {
			instance = new MemberDao();
		}
		
		return instance;
	} // 외부의 객체 한번 생성
	
	public int getMemberCheck(String id, String pw) throws SQLException {
		int cnt = -1;
		
		String sql = "select * from edu_member where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) { // 회원인 아이디
			sql = "select * from (select * from edu_member where id=?) where pw=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		}
		
		return cnt;
	} // getMemberCheck
	
	public MemberBean getSearch(String id) throws SQLException {
		MemberBean mb = null;
		
		String sql = "select * from edu_member where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) { // 회원인 아이디
			mb = setBean(rs);
		}
		
		return mb;
	} // getSearch
	
	public MemberBean setBean(ResultSet rs) throws SQLException {
		MemberBean mb = new MemberBean();
		
		mb.setNo(rs.getInt("no"));
		mb.setName(rs.getString("name"));
		mb.setId(rs.getString("id"));
		mb.setPw(rs.getString("pw"));
		mb.setEmail(rs.getString("email"));
		mb.setHp1(rs.getInt("hp1"));
		mb.setHp2(rs.getInt("hp2"));
		mb.setHp3(rs.getInt("hp3"));
		mb.setBirth(rs.getString("birth"));
		mb.setRank(rs.getInt("rank"));
		mb.setJoindate(rs.getString("joindate"));
		
		return mb;
	} // setBean
	
	public int insertMember(MemberBean mb) throws SQLException {
		int cnt = -1;
		
		String sql = "insert into edu_member values(mem_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getName());
		ps.setString(2, mb.getId());
		ps.setString(3, mb.getPw());
		ps.setString(4, mb.getEmail());
		ps.setInt(5, mb.getHp1());
		ps.setInt(6, mb.getHp2());
		ps.setInt(7, mb.getHp3());
		ps.setString(8, mb.getBirth());
		ps.setInt(9, mb.getRank());
		ps.setString(10, mb.getJoindate());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // insertMember
	
	public MemberBean getSearch(String name, String email) throws SQLException {
		MemberBean mb = null;
		
		String sql = "select * from edu_member where name=? and email=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, email);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) { // 회원인 아이디
			mb = setBean(rs);
		}
		
		return mb;
	} // getSearch
	
	public MemberBean getSearch(String id, String name, String email) throws SQLException {
		MemberBean mb = null;
		
		String sql = "select * from edu_member where id=? and name=? and email=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);;
		ps.setString(2, name);
		ps.setString(3, email);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) { // 회원인 아이디
			mb = setBean(rs);
		}
		
		return mb;
	} // getSearch
	
	public ArrayList<String> getDataByRank(int rank) throws SQLException {
		ArrayList<String> teachers = new ArrayList<String>();
		
		String sql = "select name from edu_member where rank="+rank;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			teachers.add(rs.getString("name"));
		}
		
		return teachers;
	} // getDataByRank
	
	public ArrayList<MemberBean> getAllMember() throws SQLException {
		ArrayList<MemberBean> list = new ArrayList<MemberBean>();
		
		String sql = "select * from edu_member order by no";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			MemberBean mb = setBean(rs);
			
			list.add(mb);
		}
		
		return list;
	} // getAllLecture
	
	public int updateMember(MemberBean mb) throws SQLException {
		int cnt = -1;
		
		String sql = "select * from edu_member where no="+mb.getNo();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			if(mb.getPw().equals(rs.getString("pw"))) {
				sql = "update edu_member set name=?, email=?, hp1=?, hp2=?, hp3=?, birth=? where no=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mb.getName());
				ps.setString(2, mb.getEmail());
				ps.setInt(3, mb.getHp1());
				ps.setInt(4, mb.getHp2());
				ps.setInt(5, mb.getHp3());
				ps.setString(6, mb.getBirth());
				ps.setInt(7, mb.getNo());
				
				cnt = ps.executeUpdate();
			}
		}
		
		return cnt;
	} // updateMember
	
	public int deleteMember(String no) throws SQLException {
		int cnt = -1;

		String sql = "delete from edu_member where no="+no;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // updateMember
	
	public MemberBean getSearchByNo(String no) throws SQLException {
		MemberBean mb = null;
		
		String sql = "select * from edu_member where no="+no;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			mb = setBean(rs);
		}
		
		return mb;
	} // getSearchByNo
}
