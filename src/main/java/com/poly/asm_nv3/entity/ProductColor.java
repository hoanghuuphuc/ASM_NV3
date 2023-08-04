package com.poly.asm_nv3.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "ProductsColor")
public class ProductColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    @JoinColumn(name = "Productsize")
    ProductSize productSize;

    String Color;

    String Quantity;
}
