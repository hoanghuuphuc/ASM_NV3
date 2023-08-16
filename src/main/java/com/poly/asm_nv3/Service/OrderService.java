package com.poly.asm_nv3.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.asm_nv3.entity.Order;

import java.util.List;

public interface OrderService {
    Order create(JsonNode orderData);

    Order findById(Long id);
    Order findId(Long id);

    List<Order> findByUsername(String username);
    Order findOrderByUsername(Long id,String username);
    Order SaveSatus(Order order);

    List<Order> findAll();

    Order save(Order existingOrder);
}
