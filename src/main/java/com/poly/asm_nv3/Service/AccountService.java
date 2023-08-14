package com.poly.asm_nv3.Service;


import com.poly.asm_nv3.entity.Account;
import org.springframework.stereotype.Service;


public interface AccountService {
    Account saveAccount(Account account,String RoleId);
    Account SavePassReset(Account account);
    Account ChangePassword(Account acc);
    Account findUsername(String TaiKhoan);

    Account findToken(String token);
    Account SaveAccountActive(Account account);
    Account SaveTokenReset(Account account);

    Account findResetToken(String token);
}
