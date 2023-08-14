package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.Authority;

import java.util.List;

public interface AuthorityService {
    List<Authority> findAuthoritiesOfAdministrators();

    List<Authority> findAll();

    Authority create(Authority auth);

    void delete(Integer id);
}
