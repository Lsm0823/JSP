package ch14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {

	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 로그인 : 성공 -> true
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 중복체크 메소드 (중복 -> true)
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			flag = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 주소 검색
	public Vector<ZipcodeBean> searchZipcode(String area3){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblzipcode where area3 like ?";
			// ?에는 '%강남대로%' 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
//				ZipcodeBean bean = new ZipcodeBean();
//				bean.setArea3(bean.getArea1());
//				bean.setArea3(bean.getArea2());
//				bean.setArea3(bean.getArea3());
//				vlist.addElement(bean);
				
				// 매개변수가 몇개 없을 때 사용할 경우도 있음 위의 경우와 결과는 같음!!
				ZipcodeBean bean = new ZipcodeBean(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 회원가입
//	sql = "insert tblMember(id,pwd,name,gender,"
//			+ "birthday,email,zipcode,address,hobby,job)"
//			+ "values(?,?,?,?,?,?,?,?,?,?)";
	   public boolean insertMember(MemberBean bean) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      
	      String sql = null;
	      boolean flag = false;
	      try {
	         con = pool.getConnection();
	         sql = "insert tblMember(id,pwd,name,gender,"
	               + "birthday,email,zipcode,address,hobby,job)"
	               + "values(?,?,?,?,?,?,?,?,?,?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, bean.getId());
	         pstmt.setString(2, bean.getPwd());
	         pstmt.setString(3, bean.getName());
	         pstmt.setString(4, bean.getGender());
	         pstmt.setString(5, bean.getBirthday());
	         pstmt.setString(6, bean.getEmail());
	         pstmt.setString(7, bean.getZipcode());
	         pstmt.setString(8, bean.getAddress());
	         ///////////////////////////////////////
	         String lists[] = {"인터넷","여행","게임","영화","운동"};
	         String hobby[] = bean.getHobby(); // {"인터넷,"운동"};
	         char hb[] = {'0','0','0','0','0'};
	         for (int i = 0; i < hobby.length; i++) {
	            for (int j = 0; j < lists.length; j++) {
	               if(hobby[i].equals(lists[j])) {
	                  hb[j] = '1';
	                  break;
	               }
	            }
	         }
	         // 10001
	         pstmt.setString(9, new String(hb));
	         ///////////////////////////////////////
	         pstmt.setString(10, bean.getJob());
	         if(pstmt.executeUpdate()==1)
	            flag = true;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt);
	      }
	      return flag;
	   }
	
	// 회원정보가져오기
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				String hobby = rs.getString("hobby");
				String hb[] = new String[hobby.length()];
				for(int i = 0; i < hb.length; i++) {
					hb[i] = hobby.substring(i, i+1);
				}// 01010 -> { "0","1","0","1","0" }
				bean.setHobby(hb);
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	// 회원수정
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			 con = pool.getConnection();
			 sql = "update tblMember set pwd=?,name=?,gender=?,"
						+ "birthday=?,email=?,zipcode=?,address=?,hobby=?"
						+ ",job=? where id=?";
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, bean.getPwd());
	         pstmt.setString(2, bean.getName());
	         pstmt.setString(3, bean.getGender());
	         pstmt.setString(4, bean.getBirthday());
	         pstmt.setString(5, bean.getEmail());
	         pstmt.setString(6, bean.getZipcode());
	         pstmt.setString(7, bean.getAddress());
	         ///////////////////////////////////////
	         String lists[] = {"인터넷","여행","게임","영화","운동"};
	         String hobby[] = bean.getHobby(); // {"인터넷,"운동"};
	         char hb[] = {'0','0','0','0','0'};
	         for (int i = 0; i < hobby.length; i++) {
	            for (int j = 0; j < lists.length; j++) {
	               if(hobby[i].equals(lists[j])) {
	                  hb[j] = '1';
	                  break;
	               }
	            }
	         }
	         // 10001
	         pstmt.setString(8, new String(hb));
	         ///////////////////////////////////////
	         pstmt.setString(9, bean.getJob());
	         pstmt.setString(10, bean.getId());
	         
	         if(pstmt.executeUpdate()==1)
	            flag = true;
	         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
}
