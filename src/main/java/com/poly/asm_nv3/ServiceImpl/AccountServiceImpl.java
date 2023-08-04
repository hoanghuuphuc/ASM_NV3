package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.AccountDAO;
import com.poly.asm_nv3.DAO.AuthorityDAO;
import com.poly.asm_nv3.Service.AccountService;
import com.poly.asm_nv3.entity.Account;
import com.poly.asm_nv3.entity.Authority;
import com.poly.asm_nv3.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    AuthorityDAO authorityDAO;



    @Override
    public Account saveAccount(Account acc) {
        acc.setFullname("1");
        acc.setPhoto("1");
        acc.setActive(true);
        acc.setUsername(acc.getUsername());
        String encodedPassword = passwordEncoder.encode(acc.getPassword());
        System.out.println(encodedPassword);
        acc.setPassword(encodedPassword);
//        Authority authority = new Authority();
//        authority.setAccount(acc);
//        Role role = new Role();
//        role.setId("CUST");
//        authority.setRole(role);
//        authorityDAO.save(authority);
        return accountDAO.save(acc);
    }

    @Override
    public Account findUsername(String TaiKhoan) {
        return accountDAO.getById(TaiKhoan);
    }
}
