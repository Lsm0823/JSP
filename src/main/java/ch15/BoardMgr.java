package ch15;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	
	private DBConnectionMgr pool;
	
	public static final String SAVEFOLDER = "C:/Jsp/myapp2/src/main/webapp/ch15/fileupload/";
	
	public static final String ENCODING = "UTF-8";
		
	public static final int MAXSIZE = 1024*1024*20; // 20MB

	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// Board Insert
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			File dir = new File(SAVEFOLDER);
			// 존재하지 않으면 = exists 
			if(!dir.exists()) {
				dir.mkdirs();
				// mkdir : 상위폴더가 없으면 생성불가
				// mkdirs : 상위폴더가 없어도 생성 가능
			}
			MultipartRequest multi = 
					new MultipartRequest(
					req ,SAVEFOLDER, MAXSIZE, ENCODING
					,new DefaultFileRenamePolicy());
			
			String filename = null;
			
			int filesize = 0;
			
			if(multi.getFilesystemName("filename")!=null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			
			String content = multi.getParameter("content");
			String contentType = multi.getParameter("contentType");
			
			if(contentType.equals("TEXT")) {
				// replace : 바꾸따 -> content에서 < 를 &lt;로 바꾸어 달라
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			
			int ref = getMaxNum() + 1; // 답변을 위한 ref 설정
			//////////////////////////////////////////////////////////////
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,";
			sql += "regdate,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	// Board Max Num : num의 현재 최대값
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	// Board Total Count : 총 게시물 수
	public int getTotalCount(String keyFiled, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")|| keyWord == null) {
				// 검색이 아닌 경우
				sql = "select count(*) from tblBoard";
				pstmt = con.prepareStatement(sql);
			}else {
				// 검색한 경우
				sql = "select count(*) from tblBoard where"
						+ keyFiled + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// Board List : 검색기능, 페이징 및 블럭
	// limit 시작번호, 가져올 함수
	// SELECT * FROM tblboard
	// ORDER BY num DESC LIMIT 10, 10;
	   public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int cnt){
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      Vector<BoardBean> vlist = new Vector<BoardBean>();
		      try {
		         con = pool.getConnection();
		         if(keyWord.trim().equals("")||keyWord==null) {
		            //검색이 아닌 경우
		            sql = "select * from tblBoard order by ref desc, pos limit ?, ?";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, start);
		            pstmt.setInt(2, cnt);
		         }else {
		            sql = "select * from tblBoard where "
		                  + keyField + " like ? order by ref desc, pos limit ?, ?";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setString(1, "%" + keyWord + "%");
		            pstmt.setInt(2, start);
		            pstmt.setInt(3, cnt);
		         }
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            BoardBean bean = new BoardBean();
		            bean.setNum(rs.getInt("num"));
		            bean.setName(rs.getString("name"));
		            bean.setSubject(rs.getString("subject"));
		            bean.setPos(rs.getInt("pos"));
		            bean.setRef(rs.getInt("ref"));
		            bean.setDepth(rs.getInt("depth"));
		            bean.setRegdate(rs.getString("regdate"));
		            bean.setCount(rs.getInt("count"));
		            bean.setFilename(rs.getString("filename"));
		            vlist.addElement(bean);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return vlist;
		   }
	
	// Board Get : 게시물 한개 읽어오기(13개의 컬럼 전체 리턴)
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
	            bean.setNum(rs.getInt("num"));
	            bean.setName(rs.getString("name"));
	            bean.setSubject(rs.getString("subject"));
	            bean.setContent(rs.getString("content"));
	            bean.setPos(rs.getInt("pos"));
	            bean.setRef(rs.getInt("ref"));
	            bean.setDepth(rs.getInt("depth"));
	            bean.setRegdate(rs.getString("regdate"));
	            bean.setPass(rs.getString("pass"));
	            bean.setIp(rs.getString("ip"));
	            bean.setCount(rs.getInt("count"));
	            bean.setFilename(rs.getString("filename"));
	            bean.setFilesize(rs.getInt("filesize"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	// Count Up : 조회수 증가
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set count = count + 1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	// Board Delete : 파일업로드 파일 까지 삭제 기능 추가
	// 파일이 업로드 파일 삭제(UtilMgr.delete 메소드 사용)
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			BoardBean bean = getBoard(num);
			String filename = bean.getFilename();
			if(filename!= null &&
					!filename.equals("")) {
				File f = new File(SAVEFOLDER + filename);
				if(f.exists()) {
					UtilMgr.delete(SAVEFOLDER + filename);
				}
			}
			
			con = pool.getConnection();
			sql = "delete from tblBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	// Board Update : 파일업로드 수정
	// 파일이 없로드 수정이 되면 기존에 파일은 삭제가 되어야 한다.
	// 기존에 파일이 있지만 파일 업로드 수정이 없으면 그냥 다른 컬럼들만 수정
	
	// 파일이 없는것을 수정 (1.파일업로드를 실행 2. 파일업로드를 실행 하지 않는경우)
	// 파일이 있는것 중 (1. 수정할경우 2. 수정안할경우 )
	public void updateBoard(MultipartRequest mulit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			int num = Integer.parseInt(mulit.getParameter("num"));
			String name = mulit.getParameter("name");
			String subject = mulit.getParameter("subject");
			String content = mulit.getParameter("content");
			String filename = mulit.getFilesystemName("filename");
			if(filename != null && !filename.equals("")) {
				// 파일 업로드 수정 선택
				BoardBean bean = getBoard(num);
				String tempfile = bean.getFilename();
				if(tempfile!=null&&!tempfile.equals("")) {
					File f = new File(SAVEFOLDER + tempfile);
					if(f.exists()) {
						UtilMgr.delete(SAVEFOLDER + tempfile);
					}
				}
				int filesize = (int)mulit.getFile("filename").length();
				sql = "update tblBoard set name=?, subject=?, content=?,"
						+ "filename=?, filesize=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, num);
			}else {
				// 파일 업로드를 선택하지 않았을 때
				sql = "update tblBoard set name=?, subject=?, content=?"
						+ " where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, num);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	// Board Reply : 답변글 입력
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,"
					+ "pass,count,ip)values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			//----------------------------------------------------
			// 				<그룹화> : 4 ~ 6
			//원글과 동일한 ref값
			pstmt.setInt(4, bean.getRef());
			// 원글 pos + 1
			pstmt.setInt(5, bean.getPos() + 1);
			//depth크기만큼 for문 실행 -> 답글 공간 확보 위해 
			// -> 원글의 +1
			pstmt.setInt(6, bean.getDepth() + 1);
			//----------------------------------------------------
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// Board ReplyUp : 답변글 위치값 수정 (답변의 답변을 표시하기 위해)
	public void replyUpBoard(int num, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos = pos + 1 "
					+ "where ref = ? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	
	// 게시물 1000개 입력
	public void post1000() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1234',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	
	public static void main(String[] args) {
		BoardMgr mgr = new BoardMgr();
		mgr.post1000();
		System.out.println("입력성공");
	}
}
