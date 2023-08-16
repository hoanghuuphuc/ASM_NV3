package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.OrderService;
import com.poly.asm_nv3.Service.OrderStatusService;
import com.poly.asm_nv3.entity.Order;
import com.poly.asm_nv3.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/orders")
public class OrderRestControllerAdmin {

    @Autowired
    OrderService orderService;
    @Autowired
    OrderStatusService orderStatusService;

    @GetMapping
    public List<Order> findAll(){
        return orderService.findAll();
    }
    @PutMapping("/{orderId}")
    public Order updateStatus(
            @PathVariable("orderId") Long orderId,
            @RequestBody Order updatedData
    ) {
        try {
            Order existingOrder = orderService.findId(orderId);
            existingOrder.setOrderStatus(updatedData.getOrderStatus());

            Order updatedOrderResult = orderService.save(existingOrder);
            return updatedOrderResult;
        } catch (Exception e) {
            // Xử lý lỗi
            return null;
        }
    }



}
