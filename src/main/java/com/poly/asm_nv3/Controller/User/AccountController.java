package com.poly.asm_nv3.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

    @RequestMapping("/account")
    public String account(){
        return "account/update_account";
    }
}
