package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AccountDAO extends JpaRepository<Account,String> {
    @Query("select p from Account p where p.username =?1")
    Account laytk(String username);

    @Query("select p from Account p where p.activation_token =?1")
    Account findToken(String token);

    @Query("select p from Account p where p.reset_token =?1")
    Account findResetToken(String token);
}
