package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderStatusDAO extends JpaRepository<OrderStatus,Integer> {
}
