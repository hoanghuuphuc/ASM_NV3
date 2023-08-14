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
    public Account SavePassReset(Account account) {
        String encodedPassword = passwordEncoder.encode(account.getPassword());
        account.setPassword(encodedPassword);
        account.setReset_token(null);
        account=accountDAO.save(account);
        return account;
    }

    @Override
    public Account ChangePassword(Account acc) {
        System.out.println(acc.getPassword());
        String encodedPassword = passwordEncoder.encode(acc.getPassword());
        acc.setPassword(encodedPassword);
        acc=accountDAO.save(acc);

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

    @Override
    public Account SaveTokenReset(Account account) {
        account.generateResetToken();
        account=accountDAO.save(account);
        return account;
    }

    @Override
    public Account findResetToken(String token) {
        return accountDAO.findResetToken(token);
    }

    @Override
    public List<Account> getAdministrators() {
        return accountDAO.getAdministrators();
    }

    @Override
    public List<Account> findAll() {

        return accountDAO.findAll();
    }

    @Override
    public Account create(Account account) {

        String encodedPassword = passwordEncoder.encode(account.getPassword());
        account.setPassword(encodedPassword);

            // tạo vai trò khi tài khoản mới
                Authority authority = new Authority();

                authority.setAccount(account);

                Role role = new Role();
                role.setId("CUST");
                authority.setRole(role);

                authorityDAO.save(authority);
        return accountDAO.save(account);
    }

    @Override
    public Account update(Account account) {
        String encodedPassword = passwordEncoder.encode(account.getPassword());
        account.setPassword(encodedPassword);
        accountDAO.save(account);
        return account;
    }

}
