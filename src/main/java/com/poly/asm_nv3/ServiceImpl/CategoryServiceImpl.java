package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.CategoryDAO;
import com.poly.asm_nv3.Service.CategoryService;
import com.poly.asm_nv3.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDAO categoryDAO;

    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }


    @Override
    public Category create(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public Category update(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public void delete(Integer id) {
        categoryDAO.deleteById(id);
    }
}
