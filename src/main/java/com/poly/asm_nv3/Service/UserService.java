package com.poly.asm_nv3.Service;

import com.poly.asm_nv3.DAO.AccountDAO;
import com.poly.asm_nv3.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    AccountDAO accountDAO;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            Account account = accountDAO.laytk(username);
            if (!account.getActive()) {
                throw new UsernameNotFoundException(username + " is not active!");
            }
            String storedPassword = account.getPassword();
            return User.withUsername(username)
                    .password(storedPassword)
                    .roles(account.getAuthorities().stream()
                            .map(au -> au.getRole().getId())
                            .collect(Collectors.toList())
                            .toArray(new String[0]))
                    .build();
        } catch (Exception e) {
            throw new UsernameNotFoundException(username + " not found!");
        }
    }


}
