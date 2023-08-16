package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.entity.OrderDetail;

import java.util.List;

public interface OrderDetailsService {
    List<OrderDetail> getOrderDetailsByOrderId(Long orderId);
}
