package ch15;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BCommentMgr {

	private DBConnectionMgr pool;
	
	public BCommentMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Comment Insert (read.jsp)
	public void insertBComment(BCommentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBComment(name,comment,regdate,num) "
					+ "values(?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getComment());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment List (read.jsp)
	public Vector<BCommentBean> getBComment(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		 Vector<BCommentBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblBComment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BCommentBean bean = new BCommentBean();
				bean.setCnum(rs.getInt("cnum"));
				bean.setName(rs.getString("name"));
				bean.setComment(rs.getString("comment"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setNum(rs.getInt("num"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Comment Count (list.jsp)
	public int getBCommentCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count  = 0;
		try {
			con = pool.getConnection();
			sql = "select count(num) from tblBComment where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	//Comment Delete (read.jsp)
	public void deleteBComment(int cnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblBComment where cnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment All Delete 
	//(게시물 원글 삭제시 - BoardDeleteServlet)
	public void deleteAllBComment(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblBComment where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}


