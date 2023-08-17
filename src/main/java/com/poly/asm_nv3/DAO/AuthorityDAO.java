package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Account;
import com.poly.asm_nv3.entity.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AuthorityDAO extends JpaRepository<Authority,Integer> {

    @Query("SELECT DISTINCT au FROM Authority au WHERE au.account IN ?1")
    List<Authority> authoritiesOf( List<Account> accounts);
}
