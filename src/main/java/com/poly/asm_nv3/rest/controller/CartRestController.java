package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.ProductService;
import com.poly.asm_nv3.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class CartRestController {
    @Autowired
    ProductService productService;

    @GetMapping("/{id}")
    public Product getone(@PathVariable("id")Integer id){
        return productService.findById(id);
    }
}
