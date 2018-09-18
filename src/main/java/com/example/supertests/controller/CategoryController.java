package com.example.supertests.controller;

import com.example.supertests.domain.Category;
import com.example.supertests.domain.User;
import com.example.supertests.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class CategoryController {
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
        Iterable<Category> target = categoryRepo.findAll();
        List<Category> categories = new ArrayList<>();

        target.forEach(categories::add);

        if (filter != null && !filter.isEmpty()) {
            categories.add(categoryRepo.findByCategoryname(filter));
        }

        model.addAttribute("categories", categories);
        model.addAttribute("filter", filter);

        return "categories";
    }

    @PostMapping("/categories")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam("file") MultipartFile file,
            @Valid Category category,
            BindingResult bindingResult,
            Model model
    ) throws IOException {

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
        } else {
            Category categoryFromDb = categoryRepo.findByCategoryname(category.getCategoryname());

            if (categoryFromDb != null) {
                model.addAttribute("categorynameError", "Category exists!");
            } else {
                saveFile(category, file);

                model.addAttribute("category", category);

                categoryRepo.save(category);
            }
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

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/edit-category/{category}")
    public String editCategorys(
            @AuthenticationPrincipal User currentUser,
            Model model,
            @PathVariable Category category
    ) {
        Iterable<Category> categories = categoryRepo.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);

        return "categoryEditor";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/edit-category/{category}")
    public String updateCategory(
            @RequestParam("categoryname") String categoryname,
            @RequestParam("file") MultipartFile file,
            Model model,
            @PathVariable Category category
    ) throws IOException {

        boolean isCategoryEmpty = StringUtils.isEmpty(categoryname);

        if (isCategoryEmpty) {
            model.addAttribute("categorynameError", "Categoryname cannot be empty");
        } else {
            Category categoryFromDb = categoryRepo.findByCategoryname(categoryname);

            if (categoryFromDb != null) {
                model.addAttribute("categorynameError", "Category exists!");
            } else {
                category.setCategoryname(categoryname);
                saveFile(category, file);
                categoryRepo.save(category);
            }
        }

        Iterable<Category> categories = categoryRepo.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);
        return "categoryEditor";
    }
}