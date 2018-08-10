package com.example.sweater.controller;

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
    public String userMessges(
//            @AuthenticationPrincipal User currentUser,
//            @PathVariable User user,
//            Model model,
//            @RequestParam(required = false) Message message
    ) {
//        Set<Message> messages = user.getMessages();
//
//        model.addAttribute("userChannel", user);
//        model.addAttribute("subscriptionsCount", user.getSubscriptions().size());
//        model.addAttribute("subscribersCount", user.getSubscribers().size());
//        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
//        model.addAttribute("messages", messages);
//        model.addAttribute("message", message);
//        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "tests";
    }

    @PostMapping("/categories/{category}")
    public String updateMessage(
//            @AuthenticationPrincipal User currentUser,
//            @PathVariable Long user,
//            @RequestParam("id") Message message,
//            @RequestParam("text") String text,
//            @RequestParam("tag") String tag,
//            @RequestParam("file") MultipartFile file
    ) throws IOException {
//        if (message.getAuthor().equals(currentUser)) {
//            if (!StringUtils.isEmpty(text)) {
//                message.setText(text);
//            }
//
//            if (!StringUtils.isEmpty(tag)) {
//                message.setTag(tag);
//            }
//
////            saveFile(message, file);
//
//
//        }

        return "redirect:/categories/{category}";
    }
}
