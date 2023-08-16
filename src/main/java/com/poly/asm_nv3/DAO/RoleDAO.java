package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoleDAO extends JpaRepository<Role,String> {


}
