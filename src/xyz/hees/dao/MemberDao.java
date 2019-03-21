package xyz.hees.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import xyz.hees.util.DBManager;
import xyz.hees.vo.BoardVo;
import xyz.hees.vo.MemberVo;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	/*public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		
		return conn;
	}*/
	
	public int userCheck(String id, String pw) { // 
		int result = -1;
		String sql = "select pw from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw") != null && rs.getString("pw").equals(pw)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
		
	}
	
	public MemberVo getMember(String id) { //
		MemberVo mVo = null;
		String sql = "select * from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mVo = new MemberVo();
				mVo.setEmail(rs.getString("email"));
				mVo.setId(rs.getString("id"));
				mVo.setPw(rs.getString("pw"));
				mVo.setName(rs.getString("name"));
				mVo.setBirth(rs.getString("birth"));
				mVo.setGender(rs.getString("gender"));
				mVo.setReg(rs.getTimestamp("reg"));
				mVo.setAdmin(rs.getInt("admin"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVo;
	}
	
	public int confirmEmail(String email) {
		int result = -1;
		String sql = "select email from member where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int confirmId(String id) {
		int result = -1;
		String sql = "select id from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int insertMember(MemberVo mVo) {
		int result = -1;
		String sql = "insert into member values(?, ?, ?, ?, ?, sysdate, ?, 0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println(mVo.toString());
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getEmail());
			pstmt.setString(2, mVo.getPw());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getBirth());
			pstmt.setString(5, mVo.getGender());
			pstmt.setString(6, mVo.getId());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public int updateMember(MemberVo mVo) { //
		int result = -1;
		String sql = "update member set email=?, pw=?, name=?, birth=?, gender=? where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getEmail());
			pstmt.setString(2, mVo.getPw());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getBirth());
			pstmt.setString(5, mVo.getGender());
			pstmt.setString(6, mVo.getId());
			//pstmt.setString(6, mVo.getReg());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public void deleteMember(String id){
		System.out.println("dao id : " + id);
		String sql = "delete from member where id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public MemberVo checkPassword(String id, String pw) {
		String sql = "select * from member where id=? and pw=?";
		
		MemberVo bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new MemberVo();
				
				bVo.setId(id);
				bVo.setPw(pw);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
}
