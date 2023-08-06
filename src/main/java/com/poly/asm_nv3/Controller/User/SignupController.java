package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.Service.MailService;
import com.poly.asm_nv3.ServiceImpl.MailerServiceImpl;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        Account account =accountService.findUsername(acc.getUsername());//kiem tra tai khoan da duoc su dung
        if(account!=null){
            if(account.getActive()){
                m.addAttribute("message","Tài Khoản đã được sử dụng");
                return "account/sign-up";
            }else{
                accountService.saveAccount(acc,null);
                String activationUrl = "http://localhost:8080/signup/activate?token=" + acc.getActivation_token();
                mailerService.send(account.getUsername(),"Kích Hoạt Tài Khoản","Xin Chào  Chúng tôi đã nhận được yêu cầu đăng nhập vào CrouseOnline bằng địa chỉ email này. Nếu bạn muốn đăng nhập bằng tài khoản "+account.getUsername()+" của mình, hãy nhấp vào liên kết:"+"<a href='" + activationUrl + "'>tại đây</a>");
                m.addAttribute("message","Vui Lòng Kiểm Tra Mail Để kích hoạt tài khoản");
                return "account/sign-up";
            }
        }
        accountService.saveAccount(acc,"CUST");
        String activationUrl = "http://localhost:8080/signup/activate?token=" + acc.getActivation_token();
        mailerService.send(account.getUsername(),"Kích Hoạt Tài Khoản","Xin Chào  Chúng tôi đã nhận được yêu cầu đăng nhập vào CrouseOnline bằng địa chỉ email này. Nếu bạn muốn đăng nhập bằng tài khoản "+account.getUsername()+" của mình, hãy nhấp vào liên kết:"+"<a href='" + activationUrl + "'>tại đây</a>");
        m.addAttribute("message","Vui Lòng Kiểm Tra Mail Để kích hoạt tài khoản");

        return "account/sign-up";
    }


    @GetMapping("/activate")
    public String activeaccount(Model m , @RequestParam("token")String token){
        Account acc =accountService.findToken(token);
        if(acc !=null){
          accountService.SaveAccountActive(acc);
          m.addAttribute("message","Kích Hoạt Tài Khoản Thành Công");
            return "account/sign-up";
        }else{
            m.addAttribute("message", "Mã Token kích hoạt không hợp lệ");
            return "account/sign-up";
        }

    }

}
