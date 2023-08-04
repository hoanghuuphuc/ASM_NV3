package com.poly.asm_nv3.Service;


import com.poly.asm_nv3.entity.Account;
import org.springframework.stereotype.Service;


public interface AccountService {
    Account saveAccount(Account account);
    Account findUsername(String TaiKhoan);


}
