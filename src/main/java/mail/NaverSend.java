package mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

class MyAuthentication extends Authenticator{
    PasswordAuthentication pa;
    public MyAuthentication(){
         
        String id = "네이버아이디";  //네이버 이메일 아이디
        String pw = "네이버비번"; //네이버 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}

public class NaverSend {
	
	public static void send(String subject, String content, String toEmail) {
		 Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
	        p.put("mail.smtp.ssl.protocols", "TLSv1.2");
	        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
	        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
	        p.put("mail.smtp.port", "587");                 // 네이버 포트
	        p.put("mail.smtp.port", "587");                 // 네이버 포트
	           
	        Authenticator auth = new MyAuthentication();
	        //session 생성 및  MimeMessage생성
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	            InternetAddress from = new InternetAddress() ;
	            from = new InternetAddress("네이버아이디@naver.com"); //발신자 아이디
	            // 이메일 발신자
	            msg.setFrom(from);
	            // 이메일 수신자
	            InternetAddress to = new InternetAddress(toEmail);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            // 이메일 제목
	            msg.setSubject(subject, "UTF-8");
	            // 이메일 내용
	            msg.setText(content, "UTF-8");
	            // 이메일 헤더
	            msg.setHeader("content-Type", "text/html");
	            //메일보내기
	            javax.mail.Transport.send(msg, msg.getAllRecipients());
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		String subject = "제목 테스트222";
		String content = "내용 테스트2";
		//받는 이메일
		String toEmail = "OOOOOO@gmail.com";
		NaverSend.send(subject, content, toEmail);
		System.out.println("성공~~~~~~");
	}
}