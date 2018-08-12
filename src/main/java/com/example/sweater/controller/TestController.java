package com.example.sweater.controller;

import com.example.sweater.domain.Category;
import com.example.sweater.domain.Message;
import com.example.sweater.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Set;

@Controller
public class TestController {

    @GetMapping("/categories/{category}")
    public String testsMain(
//            @AuthenticationPrincipal User currentUser,
            Model model,
            @PathVariable Category category
            //@RequestParam(name = "category") Category categorys
            //@RequestParam(required = false) Message message
    ) {
//        Set<Message> messages = user.getMessages();
//
//        model.addAttribute("userChannel", user);
//        model.addAttribute("subscriptionsCount", user.getSubscriptions().size());
//        model.addAttribute("subscribersCount", user.getSubscribers().size());
//        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
//        model.addAttribute("messages", messages);
        model.addAttribute("category", category);
//        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "tests";
    }

    @GetMapping("categories/{category}/create-mode")
    public String testsView(

    ) {
        return  "testsCreating";
    }

    @PostMapping("categories/{category}/create-mode")
    public String testsCreating(
            @PathVariable Category category
    ) {
        return  "redirect:/categories/" + category.getCategory_id();
    }




}
