<%@page import="java.io.File"%>
<%@page import="ch13.FileloadMgr"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page contentType="application; charset=UTF-8"%>
<%
	try {
		String filename = request.getParameter("upFile");
		File file = new File(FileloadMgr.SAVEFOLDER + File.separator + filename);
		byte b[] = new byte[(int) file.length()];

		response.setHeader("Accept-Ranges", "bytes");
		String strClient = request.getHeader("User-Agent");
		if (strClient.indexOf("Trident") > 0 || strClient.indexOf("MSIE") > 0) {
			response.setContentType("application/smnet;charset=EUC-KR");
			response.setHeader("Content-Disposition",
					"filename=" + new String(filename.getBytes("EUC-KR"), "8859_1") + ";");
		} else {
			response.setContentType("application/smnet;charset=EUC-KR");
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(filename.getBytes("EUC-KR"), "ISO-8859-1") + ";");
		}
		out.clear();
		if (file.isFile()) {
			BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
			int read = 0;
			while ((read = fin.read(b)) != -1) {
				outs.write(b, 0, read);
			}
			outs.close();
			fin.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>