<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	//업로드 파일 저장 위치
	final String SAVEFOLDER = "C:/Jsp/myapp2/src/main/webapp/ch13/storage/";
	
	//업로드 파일명 인코딩
	final String ENCODING = "UTF-8";
	
	// 업로드 파일 크기
	final int MAXSIZE = 1024*1024*20; // 20MB
	try{
		//파일 업로드시 같은이름이 사용되면 
		//덮어쓰기 안되게 자동으로 인덱스가 붙도혹 하는 변수 = new DefaultFileRenamePolicy()
		// aa.jsp 파일에 aa.jsp파일이 다시 업로드 되면 aa1.jsp로 자동 저장
		MultipartRequest multi = new MultipartRequest(request,SAVEFOLDER,
				MAXSIZE, ENCODING, new DefaultFileRenamePolicy());
		String user = multi.getParameter("user");
		String title = multi.getParameter("title");
		String fileName = multi.getFilesystemName("myfile");
		//파일에 대한 정보 : fileType
		String fileType = multi.getContentType("myfile");
		File f = multi.getFile("myfile");
		long len = 0;
		if(f!=null)
			len = f.length();
		
		out.println("user : " + user + "<br>");
		out.println("title : " + title + "<br>");
		out.println("파일명 : " + fileName + "<br>");
		out.println("파일타입 : " + fileType + "<br>");
		out.println("파일크기 : " + len + "byte" + "<br>");
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>