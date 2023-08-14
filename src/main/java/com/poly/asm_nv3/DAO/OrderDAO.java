package com.poly.asm_nv3.DAO;

import com.poly.asm_nv3.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDAO extends JpaRepository<Order, Long> {
    @Query("select p from Order p where p.id=?1")
    Order findId(Long id);
    @Query("select p from Order p where p.account.username=?1")
    List<Order> findByUsername(String username);

    @Query("select p from Order p where p.id=?1 and p.account.username =?2")
    Order findOrderByUsername(Long id,String username);
}
