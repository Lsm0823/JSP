package guestbook;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	//매개변수가 숫자이면 true, 숫자가 아니면 false
	public static boolean isNumeric(String s) {
		  try {
		      Integer.parseInt(s);
		      return true;
		  } catch(NumberFormatException e) {
		      return false;
		  }
	}
	
	public static int parseInt(HttpServletRequest request, 
			String name) {
		return Integer.parseInt(request.getParameter(name));
	}
}
