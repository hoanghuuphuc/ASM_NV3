package com.poly.asm_nv3.ServiceImpl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.asm_nv3.DAO.OrderDAO;
import com.poly.asm_nv3.DAO.OrderDetailDAO;
import com.poly.asm_nv3.Service.OrderService;
import com.poly.asm_nv3.entity.Order;
import com.poly.asm_nv3.entity.OrderDetail;
import com.poly.asm_nv3.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {

   @Autowired
   OrderDAO orderDAO;

   @Autowired
    OrderDetailDAO orderDetailDAO;


    @Override
    public Order create(JsonNode orderData) {
        ObjectMapper mapper=new ObjectMapper();
        Order order =mapper.convertValue(orderData,Order.class);
        OrderStatus orderStatus= new OrderStatus();
        orderStatus.setId(1);
        order.setOrderStatus(orderStatus);
        orderDAO.save(order);
        TypeReference<List<OrderDetail>> type =new TypeReference<List<OrderDetail>>(){};
        List<OrderDetail>details=mapper.convertValue(orderData.get("orderDetails"),type)
                .stream().peek(d->d.setOrder(order)).collect(Collectors.toList());
        orderDetailDAO.saveAll(details);

        return order;
    }

    @Override
    public Order findById(Long id) {
        return orderDAO.findById(id).get();
    }

    @Override
    public Order findId(Long id) {
        return orderDAO.findId(id);
    }

    @Override
    public List<Order> findByUsername(String username) {
        return orderDAO.findByUsername(username);
    }

    @Override
    public Order findOrderByUsername(Long id, String username) {
        return orderDAO.findOrderByUsername(id,username);
    }

    @Override
    public Order SaveSatus(Order order) {
        OrderStatus status=new OrderStatus();
        status.setId(5);
        order.setOrderStatus(status);
        return orderDAO.save(order);
    }

}
