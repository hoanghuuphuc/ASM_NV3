package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.RoleDAO;
import com.poly.asm_nv3.Service.RoleService;
import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDAO roleDAO;

    @Override
    public List<Role> findAll() {
        return roleDAO.findAll();
    }

    @Override
    public Role create(Role role) {
        return roleDAO.save(role);
    }

    @Override
    public Role update(Role role) {
        return roleDAO.save(role);
    }

    @Override
    public void delete(String id) {
        roleDAO.deleteById(id);
    }


}
