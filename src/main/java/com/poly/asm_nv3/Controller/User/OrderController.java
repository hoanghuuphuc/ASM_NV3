package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.OrderService;
import com.poly.asm_nv3.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping("order/checkout")
    public String checkout(){
        return "checkout";
    }
    @RequestMapping("/order/list")
    public String list(Model m, HttpServletRequest request){
        String username=request.getRemoteUser();
        m.addAttribute("orders",orderService.findByUsername(username));
        return "list";
    }

    @RequestMapping("/order/detail/{id}")
    public String detail(@PathVariable("id")Long id, Model m){
        Order order =orderService.findId(id);
        m.addAttribute("order",orderService.findById(id));
        return "bill";

    }
    @RequestMapping("bill")
    public String bill(){
        return "bill";
    }
}
