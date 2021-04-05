package myPkg.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private Connection conn = null;
	
	private static BoardDAO instance;
	
	private BoardDAO() throws Exception {
		System.out.println("BoardDAO() 积己磊");
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
		conn = ds.getConnection();
		//System.out.println("BoardDAO conn:" + conn);
	} // 积己磊
	
	public static BoardDAO getInstance() throws Exception {
		if(instance == null) {
			instance = new BoardDAO();
		}
		
		return instance;
	} // 寇何狼 按眉 茄锅 积己
	
	public int insertBoard(String s, String c, String d, String i) throws SQLException{
		int cnt = -1;
		
		String sql = "insert into edu_board(num,subject,content,reg_date,bfile) values(board_seq.nextval,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, s);
		ps.setString(2, c);
		ps.setString(3, d);
		ps.setString(4, i);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // insertBoard
	
	public ArrayList<BoardDTO> getAllBoard(int start, int end) throws SQLException {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "select num, writer, subject, bfile, content, reg_date, count, re_reg_date, re_writer, re_content "
				+ "from (select rownum as rank, num, writer, subject, bfile, content, reg_date, count, re_reg_date, re_writer, re_content "
				+ "from (select * "
				+ "from edu_board order by num desc)) "
				+ "where rank between ? and ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			BoardDTO bd = setBoard(rs);
			
			list.add(bd);
		}
		//System.out.println(list.size());
		return list;
	} // getAllBoard
	
	public BoardDTO getBoardByNum(String num) throws SQLException {
		BoardDTO bd = null;
		
		String sql = "update edu_board set count=count+1 where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.executeUpdate();
		
		sql = "select * from edu_board where num="+num;
		ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			bd = setBoard(rs);
		}
		
		return bd;
	} // getBoardByNum
	
	private BoardDTO setBoard(ResultSet rs) throws SQLException {
		int num = rs.getInt("num");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String bfile = rs.getString("bfile");
		String content = rs.getString("content");
		String reg_date = rs.getString("reg_date");
		int count = rs.getInt("count");
		String re_reg_date = rs.getString("re_reg_date");
		String re_writer = rs.getString("re_writer");
		String re_content = rs.getString("re_content");
		
		BoardDTO bd = new BoardDTO();
		
		bd.setNum(num);
		bd.setWriter(writer);
		bd.setSubject(subject);
		bd.setBfile(bfile);
		bd.setContent(content);
		bd.setReg_date(reg_date);
		bd.setCount(count);
		bd.setRe_reg_date(re_reg_date);
		bd.setRe_writer(re_writer);
		bd.setRe_content(re_content);		
		
		return bd;
	} // setBoard
	
	public int getListCount() throws SQLException {
		int cnt = 0;
		
		String sql = "select count(*) cnt from edu_board";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) cnt = rs.getInt("cnt");
		
		return cnt;
	} // getListCount
	
	public int updateReview(String w, String c, String d, String n) throws SQLException {
		int cnt = -1;
		//System.out.println(w + c + d);
		String sql =  "select re_writer, re_content, re_reg_date from edu_board where num="+n;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			String writer = w+"/", content = c+"/", reg_date = d+"/";
			if(rs.getString("re_writer") != null) {
				writer = rs.getString("re_writer")+writer;
				content = rs.getString("re_content")+content;
				reg_date = rs.getString("re_reg_date")+reg_date;
			}
			System.out.println(writer);
			System.out.println(content);
			System.out.println(reg_date);
			sql = "update edu_board set re_writer=?, re_content=?, re_reg_date=? where num=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, content);
			ps.setString(3, reg_date);
			ps.setString(4, n);
			
			cnt = ps.executeUpdate();
			
			sql = "select * from edu_board where num="+n;
		}
		
		System.out.println("update review: "+cnt);
		return cnt;
	} // updateReview
	
	public int updateBoard(String sbj, String con, String img, String num) throws SQLException {
		int cnt = -1;
		
		String sql = "update edu_board set subject=?, content=?, bfile=? where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, sbj);
		ps.setString(2, con);
		ps.setString(3, img);
		ps.setString(4, num);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public int deleteLecture(String num) throws SQLException {
		int cnt = -1;
		
		String sql = "delete edu_board where num="+num;
		PreparedStatement ps = conn.prepareStatement(sql);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	} // deleteLecture
}
