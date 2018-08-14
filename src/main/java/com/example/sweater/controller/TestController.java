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
            Model model,
            @PathVariable Category category
    ) {
        model.addAttribute("category", category);

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
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2
    ) throws IOException {
        Test test = new Test(testname);
        test.setAuthor_id(user);
        test.setNum_of_questions(num_of_questions);
        test.setCategory_id(category);
        saveFile(test, image1, image2);

        testRepo.save(test);
        model.addAttribute("category", category);

        return "redirect:/categories/" + category.getCategory_id();
    }

    private void saveFile(
            @Valid Test test,
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2
    ) throws IOException {
        if (image2 != null && !image2.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + image2.getOriginalFilename();

            image2.transferTo(new File(uploadPath + "/" + resultFilename));

            test.setImage_path_start(resultFilename);
        }

        if (image1 != null && !image1.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + image1.getOriginalFilename();

            image1.transferTo(new File(uploadPath + "/" + resultFilename));

            test.setImage_path_end(resultFilename);
        }

    }


}