package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.Service.OrderService;
import com.poly.asm_nv3.entity.Account;
import com.poly.asm_nv3.entity.Order;
import com.poly.asm_nv3.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    AccountService accountService;

    @RequestMapping("order/checkout")
    public String checkout(HttpServletRequest request,Model m){
        Account acc=accountService.findUsername(request.getRemoteUser());
        m.addAttribute("acc",acc);
        return "checkout";
    }
    @RequestMapping("/order/list")
    public String list(Model m, HttpServletRequest request) {
        String username = request.getRemoteUser();
        List<Order> orders = orderService.findByUsername(username);

        // Sắp xếp danh sách đơn hàng theo thời gian createDate
        orders.sort(Comparator.comparing(Order::getCreateDate, Collections.reverseOrder()));

        m.addAttribute("orders", orders);
        return "list";
    }

    @RequestMapping("/order/detail/{id}")
    public String detail(@PathVariable("id")Long id, Model m){
        Order order =orderService.findId(id);
        m.addAttribute("order",orderService.findById(id));
        return "bill";

    }
    @RequestMapping("/order/cancel/{id}")
    public String cancelOrder(Model m,@PathVariable("id")Long id,HttpServletRequest request){
        String username=request.getRemoteUser();
        Order order =orderService.findOrderByUsername(id,username);
        if(username.equals(order.getAccount().getUsername())){

            orderService.SaveSatus(order);
            return "redirect:/order/list";

        }else{
            return "redirect:/order/list";
        }

    }
    @RequestMapping("bill")
    public String bill(){
        return "bill";
    }
}
