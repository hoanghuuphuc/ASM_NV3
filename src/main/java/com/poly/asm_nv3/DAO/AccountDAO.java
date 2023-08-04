package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDAO extends JpaRepository<Account,String> {
}
