package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.DAO.OrderStatusDAO;
import com.poly.asm_nv3.Service.OrderStatusService;
import com.poly.asm_nv3.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {

    @Autowired
    OrderStatusDAO orderStatusDAO;

    @Override
    public List<OrderStatus> findAll() {
        return orderStatusDAO.findAll();
    }

    @Override
    public OrderStatus create(OrderStatus orderStatus) {
        return orderStatusDAO.save(orderStatus);
    }

    @Override
    public OrderStatus update(OrderStatus orderStatus) {
        return orderStatusDAO.save(orderStatus);
    }

    @Override
    public void delete(Integer id) {
        orderStatusDAO.deleteById(id);
    }
}
