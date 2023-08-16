package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.OrderStatus;

import java.util.List;

public interface OrderStatusService {
    List<OrderStatus> findAll();

    OrderStatus create(OrderStatus orderStatus);

    OrderStatus update(OrderStatus orderStatus);

    void delete(Integer id);
}
