package com.poly.asm_nv3.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "Orderstatus")
public class OrderStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name="Status")
    String status;
    @Column(name="Note")
    String note;
    @JsonIgnore
    @OneToMany(mappedBy = "orderStatus")
    List<Order> orderList;


}
