package com.project.shop.services;

import com.project.shop.models.Order;
import com.project.shop.models.User;
import com.project.shop.services.declarations.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender mailSender;

    public void send(Order order, User user) {
        try {
            MimeMessage message = mailSender.createMimeMessage();

            message.setSubject("Kakadu");
            MimeMessageHelper helper;
            helper = new MimeMessageHelper(message, true);
            helper.setFrom("test46114@gmail.com");
            helper.setTo(user.getEmail());
            String stringBuilder = "<html><body>" + "Zamówienie " +
                    order.getId() +
                    "<hr>" +
                    order.getDate() +
                    "<hr>" +
                    order.getItem().getName() +
                    "</body></html>";
            helper.setText(stringBuilder, true);
            mailSender.send(message);
        } catch (MessagingException ex) {
            System.out.println("Błąd wysłania maila");
        }
    }
}
