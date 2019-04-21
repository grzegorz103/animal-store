package com.project.shop.controllers;

import com.project.shop.models.*;
import com.project.shop.repositories.UserRepository;
import com.project.shop.services.declarations.AddressService;
import com.project.shop.services.declarations.ShoppingService;
import com.project.shop.services.declarations.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/user")
public class UserController
{
        private final ShoppingService shoppingService;

        private final UserService userService;

        private final AddressService addressService;

        @Autowired
        public UserController ( ShoppingService shoppingService, UserService userService, AddressService addressService )
        {
                this.shoppingService = shoppingService;
                this.userService = userService;
                this.addressService = addressService;
        }


        @GetMapping ("/cart")
        public String getShoppingCart ( Model model )
        {
                model.addAttribute( "cart_items", shoppingService.getCart() );
                return "cartPage";
        }


        @GetMapping ("/orders")
        public String getOrders ( Model model )
        {
                model.addAttribute( "orders", shoppingService.getUserOrders() );
                return "ordersPage";
        }

        //------ Panel admina

        @GetMapping ("/summary")
        @Secured ("ROLE_ADMIN")
        public String getSummary ( Model model,
                                   Pageable pageable )
        {
                model.addAttribute( "orders", shoppingService.getAllOrders() );
                model.addAttribute( "animal", new Pet() );
                model.addAttribute( "feed", new Feed() );
                model.addAttribute( "accessory", new Accessory() );
                return "adminPage";
        }


        @Secured ("ROLE_ADMIN")
        @GetMapping ("/list")
        public String getUserList ( Model model,
                                    Pageable pageable )
        {
                model.addAttribute( "list", userService.findAllUsers( pageable ) );
                return "userListPage";
        }


        @Secured ("ROLE_ADMIN")
        @GetMapping ("/edit/{id}")
        public String editUserState ( @PathVariable ("id") User user )
        {
                userService.editUserLock( user );
                return "redirect:/user/list";
        }

        //------ PANEL USERA

        @GetMapping ("/details")
        public String changeUserDetails ( Model model )
        {
                User user = ( User ) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal();
                User userFromDb = userService.find( user.getId() );
                model.addAttribute( "user", userFromDb.getAddress() );
                return "userPage";
        }


        @PostMapping ("/update")
        public String updateUser ( @Valid @ModelAttribute ("userForm") Address address,
                                   BindingResult bindingResult )
        {
                if ( bindingResult.hasErrors() )
                        return "userPage";
                addressService.update( address );
                return "redirect:/";
        }
}
