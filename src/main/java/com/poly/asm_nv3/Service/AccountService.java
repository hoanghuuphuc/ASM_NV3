package com.poly.asm_nv3.Service;


import com.poly.asm_nv3.entity.Account;

import java.util.List;


public interface AccountService {
    Account saveAccount(Account account,String RoleId);
    Account SavePassReset(Account account);
    Account ChangePassword(Account acc);
    Account findUsername(String TaiKhoan);

    Account findToken(String token);
    Account SaveAccountActive(Account account);
    Account SaveTokenReset(Account account);

    Account findResetToken(String token);

    List<Account> getAdministrators();
    List<Account >findAll();

    Account create(Account account);

    Account update(Account account);
}
