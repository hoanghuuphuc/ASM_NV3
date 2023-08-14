package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.ServiceImpl.MailerServiceImpl;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class forgotpassController {

    @Autowired
    AccountService accountService;
    @Autowired
    MailerServiceImpl mailer;

    @RequestMapping("/forgotpass")
    public String forgotpass(Model m){
        return "account/forgotpass";

    }
    @PostMapping("/account/quen-mat-khau")
    public String guimail(Model m, @RequestParam("email")String email){
        Account acc = accountService.findUsername(email);
        if(acc != null){
            if(!acc.getActive()){
                m.addAttribute("message","tài khoản không tồn tại");
            }else{
                acc=accountService.SaveTokenReset(acc);
                String token=acc.getReset_token();
                String activationUrl = "http://localhost:8080/quenmk?token=" +token;
                mailer.send( acc.getUsername(),"Quên Mật Khẩu Từ NVA3","Xin Chào  Chúng tôi đã nhận được yêu cầu Quên Mật Khẩu vào NV3 bằng địa chỉ email này. Nếu bạn muốn Thay Đổi Mật Khẩu bằng tài khoản "+acc.getUsername()+" của mình, hãy nhấp vào liên kết:"+"<a href='" + activationUrl + "'>tại đây</a>");
                m.addAttribute("message","Quên Mật Khẩu Thành Công, Vui lòng kiểm tra email");
                return "account/forgotpass";
            }
        }
        m.addAttribute("message","Tài khoản không tồn tại");
        return "account/forgotpass";
    }
    @RequestMapping("quenmk")
    public String quenmkac(Model m, @RequestParam("token") String token){

        m.addAttribute("token", token);
        return "account/formreset";
    }

    @PostMapping("/thay-doi-mat-khau")
    public String quenmk(Model m, @RequestParam("token") String token, @RequestParam("password") String password) {
        Account acc = accountService.findResetToken(token);
        if (acc == null) {
            String script = "<script>alert('Mã Token Đã Hết Hạn');</script>";
            m.addAttribute("script", script);
            return "account/formreset";
        } else {
            acc.setPassword(password);
            accountService.SavePassReset(acc);
            String script = "<script>alert('mật khẩu đã được thay đổi');</script>";
            m.addAttribute("script", script);
            return "account/formreset";
        }
    }


}
