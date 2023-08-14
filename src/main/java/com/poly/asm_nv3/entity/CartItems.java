package com.poly.asm_nv3.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItems {
    private String key;
    Integer productId;
    String productName;
    double price;
    int quantity = 1;
    String image;
    String color;
}
