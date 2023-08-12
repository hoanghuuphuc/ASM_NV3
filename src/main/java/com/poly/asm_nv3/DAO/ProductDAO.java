package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product,Integer> {
    @Query("select p from Product p where p.category.id=?1")
    List<Product> findByCategory(int id);

}
