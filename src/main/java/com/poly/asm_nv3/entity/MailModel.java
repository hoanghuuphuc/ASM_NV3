package com.poly.asm_nv3.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailModel {
    String from;
    String to;
    String[] cc;
    String[] bcc;
    String subject;
    String body;
    String[] attachments;

    public MailModel(String to, String subject, String body) {
        this.from = "NV3 <hoanghuuphuc8@gmail.com>";
        this.to = to;
        this.subject = subject;
        this.body = body;
    }
}
