package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account/update")
public class AccountController {

    @Autowired
    AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping()
    public String account(HttpServletRequest request, Model m){
        String username=request.getRemoteUser();
        Account account=accountService.findUsername(username);


        return "account/update_account";
    }
    @PostMapping()
    public String changepass(Model m,HttpServletRequest request,
                             @RequestParam("password")String password,
                             @RequestParam("passwordnew")String passwordnew){
        String username=request.getRemoteUser();
        Account acc =accountService.findUsername(username);
        if(passwordEncoder.matches(password,acc.getPassword())){
             acc.setPassword(passwordnew);
             accountService.ChangePassword(acc);
             m.addAttribute("message","đổi mật khẩu thành công");
             return "account/update_account";

        }else{
            m.addAttribute("message","Mật khẩu không khớp");
            return "account/update_account";
        }



    }
}
