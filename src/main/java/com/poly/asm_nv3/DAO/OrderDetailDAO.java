package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailDAO extends JpaRepository<OrderDetail,Long> {
}
