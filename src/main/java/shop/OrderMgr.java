package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrderMgr {

	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Order Insert
	//접수중(1),접수(2),입금확인(3),배송준비(4),배송중(5),완료(6)
	public void insertOrder(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblOrder(id,productNo,quantity,date,state)"
					+ "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order.getId());//누가
			pstmt.setInt(2, order.getProductNo());//어떤 상품
			pstmt.setInt(3, order.getQuantity());//몇개
			pstmt.setString(4, UtilMgr.getDay());//언제
			pstmt.setString(5, "1");//상태 -> 접수중
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Order List
	public Vector<OrderBean> getOrderList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder where id = ? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setNo(rs.getInt("no"));//주문번호
				order.setId(rs.getString("id"));//주문한 id
				order.setProductNo(rs.getInt("productNo"));//상품번호
				order.setQuantity(rs.getInt("quantity"));//주문수량
				order.setDate(rs.getString("date"));//주문날짜
				order.setState(rs.getString("state"));//주문상태
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//admin mode
	
	//Order All List
	public Vector<OrderBean> getAllOrderList(){}
	
	//Order Detail
	public OrderBean getOrderDetail() {}
	
	//Order Update
	public boolean updateOrder(int no, String state) {}
	
	//Order Delete
	public boolean deleteOrder(int no/*주문번호*/) {}
	
}
