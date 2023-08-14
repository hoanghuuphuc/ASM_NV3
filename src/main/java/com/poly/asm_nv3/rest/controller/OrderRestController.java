package com.poly.asm_nv3.rest.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.asm_nv3.Service.OrderService;
import com.poly.asm_nv3.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {

    @Autowired
    OrderService orderService;

    @PostMapping
    public Order create(@RequestBody JsonNode orderData){
        return orderService.create(orderData);
    }
}
