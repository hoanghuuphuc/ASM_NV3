package com.poly.asm_nv3.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping("/auth/signin")
    public String dangnhap(Model m){
        return "account/login";
    }

    @RequestMapping("/login/thanhcong")
    public String logintc(Model m){
        m.addAttribute("message","đăng nhập thành công");
        return "account/login";
    }

    @RequestMapping("/login/error")
    public String loginer(Model m){
        m.addAttribute("message","Sai thông tin Đăng Nhập");
        return "account/login";
    }
    @RequestMapping("/login/unauthoried")
    public String unauthoried(Model m){
        m.addAttribute("message","Không Có Quyền Truy Xuất");
        return "account/login";
    }
    @RequestMapping("/looff/success")
    public String looff(Model m){
        m.addAttribute("message","Bạn Đã Đăng Xuất");
        return "account/login";
    }
}
