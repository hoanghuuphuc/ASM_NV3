package com.poly.asm_nv3.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "ProductsSize")
public class ProductSize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    @JoinColumn(name = "Productid")
    Product product;

    int size;


    @OneToMany(mappedBy = "productSize")
    List<ProductColor> productColors;

}
