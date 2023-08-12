package com.poly.asm_nv3.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "Productcolor")
public class ProductColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    @JoinColumn(name = "Productid")
    Product product;
   @Column(name = "Color")
    String color;

    String Quantity;
}
