package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail,Long> {
    @Query("select p from OrderDetail p where p.order.id =?1")
    List<OrderDetail> getOrderDetailsByOrderId(Long orderId);
}
