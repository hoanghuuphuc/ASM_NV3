package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findid(int id);
    List<Product> findByCategory(int id);
    Product findById(Integer id);

    Product create(Product product);

    void delete(Integer id);

    Product update(Product product);
}
