package ch19;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RandomMgr {

		private DBConnectionMgr pool;
		String id[] = {"a100","a101","a102","a103","a104","a105","a106","a107","a108","a109"};
		String pwd = "1234";
		String name[] = {"유재석","이광수","하동훈","김종국","전소민","지석진","강개리","양세찬","송지효","양세형"};

		public RandomMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//회원 10명 입력
		public void postPMember() {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert tblPMember(id,pwd,name,profile)values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < id.length; i++) {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id[i]);
					pstmt.setString(2, pwd);
					pstmt.setString(3, name[i]);
					pstmt.setString(4, "profile"+(i+1)+".jpg");
					pstmt.executeUpdate();
				}
				System.out.println("회원 10개 입력 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//회원 1명당 10개 PhotoBlog 입력
		public void postPBlog() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "select id from tblPMember limit 0, 10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				sql = "insert tblPBlog(id,message,pdate,photo)values(?,?,now(),?)";
				int cnt = 1;
				while(rs.next()) {
					String id = rs.getString(1);
					for (int i = 0; i < 10; i++) {
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, id + " " + (i+1)+" 메세지입니다.");
						pstmt.setString(3, "photo"+cnt+".jpg");
						pstmt.executeUpdate();
						cnt++;
					}
				}
				System.out.println("회원 1명당 10개 PhotoBlog 입력 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		public static void main(String[] args) {
			RandomMgr mgr = new RandomMgr();
			mgr.postPMember();
			mgr.postPBlog();
		}
}


