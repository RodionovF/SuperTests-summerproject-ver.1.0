package com.example.sweater.controller;

import com.example.sweater.domain.Category;
import com.example.sweater.domain.User;
import com.example.sweater.repos.CategoryRepo;
import com.example.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
public class CategoryController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private CategoryRepo categoryRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/categories")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        Iterable<Category> categories = categoryRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            categories = categoryRepo.findByCategoryname(filter);
        } else {
            categories = categoryRepo.findAll();
        }

        model.addAttribute("categories", categories);
        model.addAttribute("filter", filter);

        return "categories";
    }

    @PostMapping("/categories")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Category category,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        //message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("category", category);
        } else {
            saveFile(category, file);

            model.addAttribute("category", null);

            categoryRepo.save(category);
        }

        Iterable<Category> categories = categoryRepo.findAll();

        model.addAttribute("categories", categories);

        return "categories";
    }

    private void saveFile(
            @Valid Category category,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            category.setFilename(resultFilename);
        }
    }

    @GetMapping("/edit-category/{category}")
    public String editCategorys(
            @AuthenticationPrincipal User currentUser,
            Model model,
            @PathVariable Category category
    ) {
        Iterable<Category> categories = categoryRepo.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);


        return "userMessages";
    }

    @PostMapping("/edit-category/{category}")
    public String updateCategory(
            @PathVariable Category category,
            @RequestParam("categoryname") String categoryname,
            @RequestParam("file") MultipartFile file
    ) throws IOException {

        if (!StringUtils.isEmpty(categoryname)) {
            category.setCategoryname(categoryname);
        }


        saveFile(category, file);

        categoryRepo.save(category);


        return "redirect:/edit-category/" + category.getCategoryId();
    }
}