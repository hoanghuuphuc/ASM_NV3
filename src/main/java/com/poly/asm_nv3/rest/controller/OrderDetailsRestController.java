package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.OrderDetailsService;
import com.poly.asm_nv3.entity.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class OrderDetailsRestController {
    @Autowired
    private OrderDetailsService orderDetailsService; // Đảm bảo bạn có một service để xử lý logic liên quan đến order details

    @GetMapping("/order-details/{orderId}")
    public ResponseEntity<List<OrderDetail>> getOrderDetailsByOrderId(@PathVariable Long orderId) {
        List<OrderDetail> orderDetails = orderDetailsService.getOrderDetailsByOrderId(orderId);
        return ResponseEntity.ok(orderDetails);
    }
}
