package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.Service.AuthorityService;
import com.poly.asm_nv3.entity.Authority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/authorities")
public class AuthorityRestController {
    @Autowired
    private AuthorityService authorityService;
    @GetMapping
    public List<Authority> findAll(@RequestParam("admin") Optional<Boolean> admin) {
        if (admin.orElse(false)) {
            List<Authority> authorities = authorityService.findAuthoritiesOfAdministrators();

            return authorities;
        }
        return authorityService.findAll();
    }


    @PostMapping
    public Authority post(@RequestBody Authority auth) {
        return authorityService.create(auth);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        authorityService.delete(id);
    }

}
