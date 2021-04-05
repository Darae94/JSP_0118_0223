package myPkg.lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LectureDAO {

	private Connection conn = null;
	
	private static LectureDAO instance;
	
	private LectureDAO() throws Exception {
		System.out.println("LectureDAO()");
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
		conn = ds.getConnection();
		//System.out.println("conn:" + conn);
	} // 积己磊
	
	public static LectureDAO getInstance() throws Exception {
		if(instance == null) {
			instance = new LectureDAO();
		}
		
		return instance;
	} // 寇何狼 按眉 茄锅 积己
	
	public ArrayList<LectureVO> getAllLecture() throws SQLException {
		ArrayList<LectureVO> list = new ArrayList<LectureVO>();
		
		String sql = "select * from lecture order by num";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			LectureVO vo = new LectureVO();
			
			vo.setNum(rs.getInt("num"));
			vo.setName( rs.getString("name"));
			vo.setTeacher( rs.getString("teacher"));
			vo.setStuNo(rs.getString("stuNo"));
			vo.setMaxcount(rs.getInt("maxcount"));
			vo.setLec_date(rs.getString("lec_date"));
			vo.setTime(rs.getString("time"));
			vo.setContext(rs.getString("context"));
			
			list.add(vo);
		}
		
		return list;
	} // getAllLecture
	
	public int insertLecture(LectureVO lv) throws SQLException {
		int cnt = -1;
		
		String sql = "insert into lecture values(lec_seq.nextval,?,?,'',20,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, lv.getName());
		ps.setString(2, lv.getTeacher());
		ps.setString(3, lv.getLec_date());
		ps.setString(4, lv.getTime());
		ps.setString(5, lv.getContext());
		
		cnt = ps.executeUpdate();
		System.out.println("insert cnt: "+cnt);
		return cnt;
	} // insertLecture
	
	public LectureVO getLectureByNum(String num) throws SQLException {
		LectureVO vo = null;
		
		String sql = "select * from lecture where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			vo = new LectureVO();
			vo.setNum(rs.getInt("num"));
			vo.setName(rs.getString("name"));
			vo.setTeacher(rs.getString("teacher"));
			vo.setStuNo(rs.getString("stuNo"));
			vo.setMaxcount(rs.getInt("maxcount"));
			vo.setLec_date(rs.getString("lec_date"));
			vo.setTime(rs.getString("time"));
			vo.setContext(rs.getString("context"));
		}
		
		return vo;
	} // getLectureByNum
	
	public int getAllCount() throws SQLException {
		int count = 0;
		
		String sql = "select count(*) cnt from lecture";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		return count;
	} // getAllCount
	
	public int updateLecture(LectureVO vo) throws SQLException {
		int cnt = -1;
		
		String sql = "update lecture set name=?, teacher=?, lec_date=?, time=?, context=? where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, vo.getName());
		ps.setString(2, vo.getTeacher());
		ps.setString(3, vo.getLec_date());
		ps.setString(4, vo.getTime());
		ps.setString(5, vo.getContext());
		ps.setInt(6, vo.getNum());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // updateLecture
	
	public int deleteLecture(String num) throws SQLException {
		int cnt = -1;
		
		String sql = "delete from lecture where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		cnt = ps.executeUpdate();
		
		return cnt;
	} // deleteLecture
	
	public ArrayList<LectureVO> getLectureByTeacher(String t) throws SQLException {
		ArrayList<LectureVO> list = new ArrayList<LectureVO>();
		System.out.println(t);
		
		String sql = "select * from lecture where teacher=? order by num";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, t);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			LectureVO vo = new LectureVO();
			
			vo.setNum(rs.getInt("num"));
			vo.setName( rs.getString("name"));
			vo.setTeacher( rs.getString("teacher"));
			vo.setStuNo(rs.getString("stuNo"));
			vo.setMaxcount(rs.getInt("maxcount"));
			vo.setLec_date(rs.getString("lec_date"));
			vo.setTime(rs.getString("time"));
			vo.setContext(rs.getString("context"));
			
			list.add(vo);
		}
		
		return list;
	} // getLectureByTeacher
	
	public int updateLecturebynum(String num, String stu) throws SQLException {
		int cnt = -1;
		System.out.println("Dao class "+num+"/"+stu);
		String sql = "select * from lecture where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("stuNo"));
			if(rs.getString("stuNo") == null || !rs.getString("stuNo").contains(stu)) {
				sql = "update lecture set stuNo=? where num=?";
				ps = conn.prepareStatement(sql);
				if(rs.getString("stuNo") == null ) {
					stu = stu + "";
				} else if(!rs.getString("stuNo").contains(stu)) {
					stu += rs.getString("StuNo");
				}
				ps.setString(1, stu);
				ps.setString(2, num);
				
				cnt = ps.executeUpdate();
			}
		}
		
		return cnt;
	} // updateLecturebynum
}
