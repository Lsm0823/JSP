package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {

	private DBConnectionMgr pool;
    public static final String SAVEFOLDER = "C:/Jsp/myapp2/src/main/webapp/ch15/fileupload/";
    public static final String ENCODING = "UTF-8";
    public static final int MAXSIZE = 1024*1024*20; // 20MB
    
    public ProductMgr() {
    	pool = DBConnectionMgr.getInstance();
    }
    
  //Product List
  	public Vector<ProductBean> getProductList(){
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		String sql = null;
  		Vector<ProductBean> vlist = new Vector<ProductBean>();
  		try {
  			con = pool.getConnection();
  			sql = "select no, name, price, date, stock from tblProduct "
  					+ "order by no desc";
  			pstmt = con.prepareStatement(sql);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				ProductBean bean = new ProductBean();
  				bean.setNo(rs.getInt(1));
  				bean.setName(rs.getString(2));
  				bean.setPrice(rs.getInt(3));
  				bean.setDate(rs.getString(4));
  				bean.setStock(rs.getInt(5));
  				vlist.addElement(bean);
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			pool.freeConnection(con, pstmt, rs);
  		}
  		return vlist;
  	}
    
  //Product Detail
  	public ProductBean getProduct(int no/*상품번호*/) {
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		String sql = null;
  		ProductBean bean = new ProductBean();
  		try {
  			con = pool.getConnection();
  			sql = "select no, name, price, detail, date, stock, image "
  					+ "from tblProduct where no=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setInt(1, no);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				bean.setNo(rs.getInt(1));
  				bean.setName(rs.getString(2));
  				bean.setPrice(rs.getInt(3));
  				bean.setDetail(rs.getString(4));
  				bean.setDate(rs.getString(5));
  				bean.setStock(rs.getInt(6));
  				bean.setImage(rs.getString(7));
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			pool.freeConnection(con, pstmt, rs);
  		}
  		return bean;
  	}
    
  //Product Stock Reduce (구매 -> 재고 수정)
  	public void reduceProduct(OrderBean order) {
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		String sql = null;
  		try {
  			con = pool.getConnection();
  			sql = "update tblProduct set stock = stock-? where no=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setInt(1, order.getQuantity());//주문수량
  			pstmt.setInt(2, order.getProductNo());//상품번호
  			pstmt.executeUpdate();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			pool.freeConnection(con, pstmt);
  		}
  	}
    
    //admin mode
    
    //Product Insert : 상품 저장
  	public boolean insertProduct(HttpServletRequest req) {
  		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCODING, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert tblProduct(name,price,detail,date,stock,image)"
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setInt(2, UtilMgr.parseInt(multi, "price"));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, UtilMgr.getDay());
			pstmt.setInt(5, UtilMgr.parseInt(multi, "stock"));
			if(multi.getFilesystemName("image")!=null)
				pstmt.setString(6, multi.getFilesystemName("image"));
			else {
				pstmt.setString(6, "ready.gif");
			if(pstmt.executeUpdate()==1) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
  	}
    
    //Product update : 상품 저장
  	public boolean updateProduct(HttpServletRequest req) {
  		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCODING, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			if(multi.getFilesystemName("image")!=null) {
				//이미지 수정
				sql = "update tblProduct set name=?, price=?, "
						+ "detail=?, stock=?, image=? where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, UtilMgr.parseInt(multi, "price"));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, UtilMgr.parseInt(multi, "stock"));
				pstmt.setString(5, multi.getFilesystemName("image"));
				pstmt.setInt(6, UtilMgr.parseInt(multi, "no"));
			}else {
				//이미지 수정 아님
				sql = "update tblProduct set name=?, price=?, "
						+ "detail=?, stock=?, image=? where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, UtilMgr.parseInt(multi, "price"));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, UtilMgr.parseInt(multi, "stock"));
				pstmt.setInt(5, UtilMgr.parseInt(multi, "no"));
			}
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
  	}
  	
  	//Product Delete : 상품이미지는 삭제하지 않음
  	public boolean deleteProduc(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from tblProduct where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			//no가 pk이기 때문에 적용되는 레코드 개수가 0,1
			if(pstmt.executeUpdate()==1) flag = true;		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
