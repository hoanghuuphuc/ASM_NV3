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

import java.util.Arrays;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    AuthorityDAO authorityDAO;



    @Override
    public Account saveAccount(Account acc,String RoleId) {
        acc.setFullname(acc.getFullname());
        acc.setPhoto("1");
        acc.setActive(false);
        acc.generateActivationToken();
        acc.setUsername(acc.getUsername());
        String encodedPassword = passwordEncoder.encode(acc.getPassword());
        System.out.println(encodedPassword);
        acc.setPassword(encodedPassword);
        acc = accountDAO.save(acc);

        if (acc.getAuthorities() == null || acc.getAuthorities().isEmpty()) {
            // tạo vai trò khi tài khoản mới
            if (RoleId != null) {
                Authority authority = new Authority();
                authority.setAccount(acc);

                Role role = new Role();
                role.setId(RoleId);
                authority.setRole(role);

                authorityDAO.save(authority);
            }
        }

        return acc;
    }

    @Override
    public Account findUsername(String TaiKhoan) {
        return accountDAO.laytk(TaiKhoan);
    }

    @Override
    public Account findToken(String token) {
        return accountDAO.findToken(token);
    }

    @Override
    public Account SaveAccountActive(Account account) {
        account.setActive(true);
        account.setActivation_token(null);
        account =accountDAO.save(account);
        return account;
    }
}
