package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
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

    @GetMapping
    public String signup(Model m){
        m.addAttribute("account",new Account());
        return "account/sign-up";

    }
    @PostMapping
    public String signupaccount(Model m , @ModelAttribute("account") Account acc){
        //222
        accountService.saveAccount(acc);
        return "account/sign-up";
    }

}
