package ch19;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PReplyMgr {

	private DBConnectionMgr pool;
	
	public PReplyMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//PReply Insert
	public void insertPReply(PReplyBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblPReply(num,id,rdate,comment)values(?,?,now(),?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getComment());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	//PReply Delete
	public void deletePReply(int rnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblPReply where rnum=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public void deleteAllPReply(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblPReply where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//PReply List
	public Vector<PReplyBean> listPReply(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PReplyBean> vlist = new Vector<PReplyBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblPReply where num=? order by rnum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PReplyBean bean = new PReplyBean();
				bean.setRnum(rs.getInt(1));
				bean.setNum(rs.getInt(2));
				bean.setId(rs.getString(3));
				bean.setRdate(rs.getString(4));
				bean.setComment(rs.getString(5));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}