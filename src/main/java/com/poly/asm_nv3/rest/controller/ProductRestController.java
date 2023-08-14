package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.ProductService;
import com.poly.asm_nv3.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/products")
public class ProductRestController {

    @Autowired
    ProductService productService;

    @GetMapping
    public List<Product> getAll(){
        return productService.findAll();
    }
    @GetMapping("{id}")
    public Product getone(@PathVariable("id")Integer id){
        return productService.findById(id);
    }

    @PostMapping
    public Product create(@RequestBody Product product) {
        return productService.create(product);
    }

    @PutMapping("/{id}")
    public Product update(@PathVariable("id") Integer id, @RequestBody Product product) {
        return productService.create(product);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        productService.delete(id);
    }
}
