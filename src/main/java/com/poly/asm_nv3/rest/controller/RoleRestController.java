package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.RoleService;
import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/roles")
public class RoleRestController {

    @Autowired
    RoleService roleService;


    @GetMapping
    public List<Role> getAll() {
        return roleService.findAll();
    }

    @PostMapping
    public Role create(@RequestBody Role role) {
        return roleService.create(role);
    }

    @PutMapping("/{id}")
    public Role update(@PathVariable("id") String id, @RequestBody Role role) {

        return roleService.update(role);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {

        roleService.delete(id);
    }

}
