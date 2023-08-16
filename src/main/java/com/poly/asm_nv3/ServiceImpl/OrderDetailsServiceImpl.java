package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.OrderDetailDAO;
import com.poly.asm_nv3.Service.OrderDetailsService;
import com.poly.asm_nv3.entity.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {

    @Autowired
    OrderDetailDAO orderDetailDAO;


    @Override
    public List<OrderDetail> getOrderDetailsByOrderId(Long orderId) {
        return orderDetailDAO.getOrderDetailsByOrderId(orderId);
    }
}
