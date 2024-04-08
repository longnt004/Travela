package com.travela.util;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class TravelaUtil {
	public static String GenerateId(String entityId) {
		String splitEntityId[] = entityId.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");
		String strEntityId = splitEntityId[0];
		int numEntityId = Integer.parseInt(splitEntityId[1]);

		return strEntityId + String.format("%03d", numEntityId + 1);
	}
	
	public static String GenerateId(String entityId, int num) {
		String splitEntityId[] = entityId.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");
		String strEntityId = splitEntityId[0];
		int numEntityId = Integer.parseInt(splitEntityId[1]);

		return strEntityId + String.format("%03d", numEntityId + num);
	}

	public static boolean SendMail(String toEmail) {
		final String username = "nguyenhuycd123@gmail.com";
		final String password = "iznfxvtolgjxxmvs";
		try {
			Properties prop = new Properties();

			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", 587);
			prop.put("mail.debug", "true");

			Session s = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			javax.mail.Message msg = new MimeMessage(s);

			msg.setFrom(new InternetAddress(username));
			msg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(toEmail));
			msg.setSubject("Validation");

			MimeMultipart mimeMultipart = new MimeMultipart();
			MimeBodyPart mimeBodyPartMessage = new MimeBodyPart();
			mimeBodyPartMessage.setContent(
					"<a href=\"http://localhost:8080/Travela/forgotPassword?vc=isValidate\" role=\"button\" style='background-color: #EA4C89;\r\n"
							+ "  border-radius: 8px;\r\n" + "  border-style: none;\r\n"
							+ "  box-sizing: border-box;\r\n" + "  color: #FFFFFF;\r\n" + "  cursor: pointer;\r\n"
							+ "  display: inline-block;\r\n" + "  font-size: 14px;\r\n" + "  font-weight: 500;\r\n"
							+ "  height: 40px;\r\n" + "  line-height: 20px;\r\n" + "  list-style: none;\r\n"
							+ "  margin: 0;\r\n" + "  outline: none;\r\n" + "  padding: 10px 16px;\r\n"
							+ "  position: relative;\r\n" + "  text-align: center;\r\n" + "  text-decoration: none;\r\n"
							+ "  transition: color 100ms;\r\n" + "  vertical-align: baseline;\r\n"
							+ "  user-select: none;\r\n" + "  -webkit-user-select: none;\r\n"
							+ "  touch-action: manipulation;\r\n" + "'>Vetification</a>\r\n" + "",
					"text/html; charset=utf-8;");
			mimeMultipart.addBodyPart(mimeBodyPartMessage);
			// Set attachment file for the file
			msg.setContent(mimeMultipart);

			Transport.send(msg);

		} catch (Exception e) {
//			// TODO Auto-generated catch block
			return false;
		}
		return true;
	}

}
