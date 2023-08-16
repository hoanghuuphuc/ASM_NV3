package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Role;

import java.util.List;

public interface RoleService {

    List<Role> findAll();

    Role create(Role role);

    Role update(Role role);


    void delete(String id);
}
