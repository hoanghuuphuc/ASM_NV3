package com.poly.asm_nv3.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping({"/admin","/admin/home/index"})
    public String admin(){
        return "admin/index";
    }
}
