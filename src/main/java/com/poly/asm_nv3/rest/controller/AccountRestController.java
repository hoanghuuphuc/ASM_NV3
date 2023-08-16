package com.poly.asm_nv3.rest.controller;

import com.poly.asm_nv3.DAO.AccountDAO;
import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/accounts")
public class AccountRestController {
    @Autowired
    AccountService accountService;

    @GetMapping
    public List<Account> getAccounts(@RequestParam("admin") Optional<Boolean> admin) {
        if (admin.orElse(false)) {
            return accountService.getAdministrators();
        }
        return accountService.findAll();
    }

    @PostMapping
    public Account create(@RequestBody Account account) {
        return accountService.create(account);
    }

    @PutMapping("{username}")
    public Account update(@PathVariable("username")String username,@RequestBody Account account){
        return accountService.update(account);
    }


}