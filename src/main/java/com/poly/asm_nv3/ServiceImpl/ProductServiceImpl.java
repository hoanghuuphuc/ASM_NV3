package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.ProductDAO;
import com.poly.asm_nv3.Service.ProductService;
import com.poly.asm_nv3.entity.Category;
import com.poly.asm_nv3.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDAO productDAO;

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }



    @Override
    public Product findid(int id) {
        return productDAO.getById(id);
    }

    @Override
    public List<Product> findByCategory(int id) {
        return productDAO.findByCategory(id);
    }

    @Override
    public Product findById(Integer id) {
        return productDAO.findById(id).get();
    }

    @Override
    public Product create(Product product) {
        return productDAO.save(product);
    }

    @Override
    public void delete(Integer id) {
        productDAO.deleteById(id);
    }





}
