package com.example.sweater.controller;

import com.example.sweater.domain.Category;
import com.example.sweater.domain.Test;
import com.example.sweater.domain.User;
import com.example.sweater.repos.TestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class TestController {

    @Autowired
    private TestRepo testRepo;

    @Value("${upload.path}")
    private String uploadPath;

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
    public String viewTest(

    ) {
        return "testsCreating";
    }

    @PostMapping("categories/{category}/create-mode")
    public String addTest(
            @AuthenticationPrincipal User user,
            @PathVariable Category category,
            Model model,
            @RequestParam("testname") String testname,
            @RequestParam("num_of_questions") Long num_of_questions,
            @RequestParam("file") MultipartFile file
            //@RequestParam("file") MultipartFile file,
            //@RequestParam("file") MultipartFile file
    ) throws IOException {
//        if (bindingResult.hasErrors()) {
//            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
//
//            model.mergeAttributes(errorsMap);
//        } else {
        Test test = new Test(testname);
        test.setAuthor_id(user);
        test.setNum_of_questions(num_of_questions);
        test.setCategory_id(category);
        saveFile(test, file);

        testRepo.save(test);
//        }
        model.addAttribute("category", category);
        return "redirect:/categories/"+ category.getCategory_id();
        //return "redirect:/categories/" + category.getCategory_id()+"/create-mode";
    }

    private void saveFile(
            @Valid Test test,
            //@RequestParam("file") MultipartFile file,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
//        if (file != null && !file.getOriginalFilename().isEmpty()) {
//            File uploadDir = new File(uploadPath);
//
//            if (!uploadDir.exists()) {
//                uploadDir.mkdir();
//            }
//
//            String uuidFile = UUID.randomUUID().toString();
//            String resultFilename = uuidFile + "." + file.getOriginalFilename();
//
//            file.transferTo(new File(uploadPath + "/" + resultFilename));
//
//            test.setImage_path_start(resultFilename);
//        }

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            test.setImage_path_end(resultFilename);
        }

    }


//    @PostMapping("/main")
//    public String add(
//            @AuthenticationPrincipal User user,
//            @Valid Message message,
//            BindingResult bindingResult,
//            Model model,
//            @RequestParam("file") MultipartFile file
//    ) throws IOException {
//        message.setAuthor(user);
//
//        if (bindingResult.hasErrors()) {
//            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
//
//            model.mergeAttributes(errorsMap);
//            model.addAttribute("message", message);
//        } else {
//            saveFile(message, file);
//
//            model.addAttribute("message", null);
//
//            messageRepo.save(message);
//        }
//
//        Iterable<Message> messages = messageRepo.findAll();
//
//        model.addAttribute("messages", messages);
//
//        return "main";
//    }


}