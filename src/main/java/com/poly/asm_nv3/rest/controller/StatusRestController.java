package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.OrderStatusService;
import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Order;
import com.poly.asm_nv3.entity.OrderStatus;
import com.poly.asm_nv3.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/status")
public class StatusRestController {
    @Autowired
    OrderStatusService statusService;


    @GetMapping
    public List<OrderStatus> findAll(){
        return statusService.findAll();

    }
    @PostMapping
    public OrderStatus create(@RequestBody OrderStatus orderStatus) {
        return statusService.create(orderStatus);
    }
    @PutMapping("/{id}")
    public OrderStatus update(@PathVariable("id") Integer id, @RequestBody OrderStatus orderStatus) {
        return statusService.update(orderStatus);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        statusService.delete(id);
    }

}
