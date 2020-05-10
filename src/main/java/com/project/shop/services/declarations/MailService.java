package com.project.shop.services.declarations;

import com.project.shop.models.Order;
import com.project.shop.models.User;

public interface MailService {
    void send(Order order, User user);
}
