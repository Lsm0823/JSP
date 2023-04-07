package shop;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSend {

	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("netflix720222", "xvzemudatpvugort");
		}
	}
	public static void send(String title, String content, String toEmail) {
		Properties p = new Properties();

		p.put("mail.smtp.starttls.enable", "true");
		// 이메일 발송을 처리해줄 SMTP서버
		p.put("mail.smtp.host", "smtp.gmail.com");
		// SMTP 서버의 인증을 사용한다는 의미
		p.put("mail.smtp.auth", "true");
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		p.put("mail.smtp.port", "587");
		// soket문제와 protocol문제 해결
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); 
			MimeMessage msg = new MimeMessage(session);
			String message = content;
			msg.setSubject(title);
			Address fromAddr = new InternetAddress("netflix720222@gmail.com"); 
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/html;charset=KSC5601");
			Transport.send(msg);
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
}
