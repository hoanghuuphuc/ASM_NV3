package com.poly.asm_nv3.Controller.User;

import com.poly.asm_nv3.DAO.ProductColorDAO;
import com.poly.asm_nv3.DAO.ProductDAO;
import com.poly.asm_nv3.Service.ProductService;
import com.poly.asm_nv3.entity.Product;
import com.poly.asm_nv3.entity.ProductColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    ProductService productService;

    @Autowired
    ProductColorDAO productColorDAO;

    @GetMapping
    public String home(Model m){
        List<Product> product = productService.findAll()
                .stream().filter(product1 -> product1.getAvailable()==true)//loc san pham = true
                .collect(Collectors.toList());
        m.addAttribute("product",product);
        return "index";
        }


    @GetMapping("product/{id}")
    public String details(Model m , @PathVariable("id")int id){
        Product product= productService.findid(id);
        m.addAttribute("product",product);

        if (product != null && product.getCategory() != null) {
            List<Product> productsSameCategory = productService.findByCategory(product.getCategory().getId());

            // Loại bỏ sản phẩm hiện tại
            productsSameCategory.removeIf(p -> p.getId() == id);

            // Lấy 3 sản phẩm có giá tiền cao nhất
            List<Product> top3HighestPriceProducts = productsSameCategory.stream().filter(product1 -> product1.getAvailable()==true)
                    .sorted(Comparator.comparing(Product::getPrice).reversed()) // Sắp xếp giảm dần theo giá tiền
                    .limit(3) // Giới hạn chỉ lấy 3 sản phẩm
                    .collect(Collectors.toList());
            List<ProductColor>productColors =productColorDAO.findProductColor(id);
            m.addAttribute("productColors",productColors);

            m.addAttribute("productsSameCategory", top3HighestPriceProducts);
        }


        return "product_details";
    }
}
