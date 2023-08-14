package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDAO extends JpaRepository<Category,Integer> {
}
