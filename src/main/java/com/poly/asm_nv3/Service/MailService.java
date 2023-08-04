package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.MailModel;
import org.springframework.scheduling.annotation.Async;

import javax.mail.MessagingException;


public interface MailService {
    /**
     * Gửi email
     * @param mail thông tin email
     * @throws MessagingException lỗi gửi email
     */
    void send(MailModel mail) throws MessagingException;
    /**
     * Gửi email đơn giản
     * @param to email người nhận
     * @param subject tiêu đề email
     * @param body nội dung email
     * @throws MessagingException lỗi gửi email
     */
    @Async
    void send(String to, String subject, String body) throws MessagingException;
}
