package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.ProductColor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductColorDAO extends JpaRepository<ProductColor,Integer> {
    @Query("select u from ProductColor  u where u.product.id =?1")
    List<ProductColor> findProductColor(int id);

}
