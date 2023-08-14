package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.AccountDAO;
import com.poly.asm_nv3.DAO.AuthorityDAO;
import com.poly.asm_nv3.Service.AuthorityService;
import com.poly.asm_nv3.entity.Account;
import com.poly.asm_nv3.entity.Authority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorityServiceImpl implements AuthorityService {
    @Autowired
    AccountDAO accountDAO;
    @Autowired
    AuthorityDAO authorityDAO;
    @Override
    public List<Authority> findAuthoritiesOfAdministrators() {
        List<Account>accounts=accountDAO.getAdministrators();
        return authorityDAO.authoritiesOf(accounts);
    }

    @Override
    public List<Authority> findAll() {
        return authorityDAO.findAll();
    }

    @Override
    public Authority create(Authority auth) {
        return authorityDAO.save(auth);
    }

    @Override
    public void delete(Integer id) {
        authorityDAO.deleteById(id);
    }
}
