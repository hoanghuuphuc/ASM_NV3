package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.Service.MailService;
import com.poly.asm_nv3.ServiceImpl.MailerServiceImpl;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("signup")
public class SignupController {
    @Autowired
    AccountService accountService;

    @Autowired
    MailerServiceImpl mailerService;

    @GetMapping
    public String signup(Model m){
        m.addAttribute("account",new Account());
        return "account/sign-up";

    }
    @PostMapping
    public String signupaccount(Model m , @ModelAttribute("account") Account acc){
        System.out.println(acc.getUsername());
        Account account =accountService.findUsername(acc.getUsername());//kiem tra tai khoan da duoc su dung
        if(account!=null){
            if(account.getActive()){
                m.addAttribute("message","Tài Khoản đã được sử dụng");
                return "account/sign-up";
            }else{
                accountService.saveAccount(acc);
                String activationUrl = "http://localhost:8080/activate?token=" + acc.getActivation_token();
                mailerService.send(account.getUsername(),"Kích Hoạt Tài Khoản","Xin Chào  Chúng tôi đã nhận được yêu cầu đăng nhập vào CrouseOnline bằng địa chỉ email này. Nếu bạn muốn đăng nhập bằng tài khoản "+account.getUsername()+" của mình, hãy nhấp vào liên kết:"+"<a href='" + activationUrl + "'>tại đây</a>");
                m.addAttribute("message","Vui Lòng Kiểm Tra Mail Để kích hoạt tài khoản");
            }
        }
        accountService.saveAccount(acc);
        String activationUrl = "http://localhost:8080/activate?token=" + acc.getActivation_token();
        mailerService.send(account.getUsername(),"Kích Hoạt Tài Khoản","Xin Chào  Chúng tôi đã nhận được yêu cầu đăng nhập vào CrouseOnline bằng địa chỉ email này. Nếu bạn muốn đăng nhập bằng tài khoản "+account.getUsername()+" của mình, hãy nhấp vào liên kết:"+"<a href='" + activationUrl + "'>tại đây</a>");
        m.addAttribute("message","Vui Lòng Kiểm Tra Mail Để kích hoạt tài khoản");

        return "account/sign-up";
    }


}
