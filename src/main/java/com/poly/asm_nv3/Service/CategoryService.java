package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Product;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();



    Category create(Category category);

    Category update(Category category);

    void delete(Integer id);

}
