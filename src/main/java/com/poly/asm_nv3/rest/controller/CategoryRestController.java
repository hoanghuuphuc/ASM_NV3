package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.CategoryService;
import com.poly.asm_nv3.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/categories")
public class CategoryRestController {
    @Autowired
    CategoryService categoryService;

    @GetMapping
    public List<Category> getAll(){
        return categoryService.findAll();

    }

    @PostMapping
    public Category create(@RequestBody Category category) {
        return categoryService.create(category);
    }

    @PutMapping("/{id}")
    public Category update(@PathVariable("id") Integer id, @RequestBody Category category) {
        return categoryService.update(category);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        System.out.println("xoa");
        categoryService.delete(id);
    }

}
