package com.project.shop.repositories;

import com.project.shop.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long>
{
        boolean existsUserByEmail ( String email );

        boolean existsUserByUsername ( String username );

        User findUserByUsername ( String username );

        Page<User> findAll ( Pageable pageable );
}
