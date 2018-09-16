package com.example.supertests.controller;

import com.example.supertests.domain.User;
import com.example.supertests.domain.dto.CaptchaResponseDto;
import com.example.supertests.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    private static final int WEAK_STREGTH = 1;
    private static final int MID_STREGTH = 5;
    private static final int STRONG_STREGTH = 8;

    private static final String BLACK_COLOR = "#000000";
    private static final String WEAK_COLOR = "#FF0000";
    private static final String MID_COLOR = "#FF9900";
    private static final String STRONG_COLOR = "#0099CC";

    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;


    @GetMapping("/registration")
    public String registration(
            @RequestParam(required = false, defaultValue = "") String password,
            Model model
    ) {
        model.addAttribute("strength", "");
        model.addAttribute("color", BLACK_COLOR);
        if (password.length() >= WEAK_STREGTH & password.length() < MID_STREGTH) {
            model.addAttribute("strength", "Слабый");
            model.addAttribute("color", WEAK_COLOR);
        } else if (password.length() >= MID_STREGTH & password.length() < STRONG_STREGTH) {
            model.addAttribute("strength", "Cредний");
            model.addAttribute("color", MID_COLOR);
        } else if (password.length() >= STRONG_STREGTH) {
            model.addAttribute("strength", "Сильный");
            model.addAttribute("color", STRONG_COLOR);
        }
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirm,
            @RequestParam("g-recaptcha-response") String captchaResponse,
            @Valid User user,
            BindingResult bindingResult,
            Model model
    )
       {
            String url = String.format(CAPTCHA_URL, secret, captchaResponse);
            CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

            if (!response.isSuccess()) {
                model.addAttribute("captchaError", "Fill captcha");
            }

            boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

            if (isConfirmEmpty) {
                model.addAttribute("password2Error", "Password confirmation cannot be empty");
            }

            if (user.getPassword() != null && !user.getPassword().equals(passwordConfirm)) {
                model.addAttribute("passwordError", "Passwords are different!");
            }

            if (!("1111").equals(user.getEmail())) {
                model.addAttribute("emailError","ERROR");
            }

            if (isConfirmEmpty || bindingResult.hasErrors() || !response.isSuccess()) {
                Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

                model.mergeAttributes(errors);

                return "registration";
            }

            if (!userService.addUser(user)) {
                model.addAttribute("usernameError", "User exists!");
                return "registration";
            }


        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(
            Model model,
            @PathVariable String code
    ) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }

//    @RequestMapping(value = "/checkStrength", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
//    public @ResponseBody
//    String checkStrength(
//            @RequestParam(required = false, defaultValue = "") String password2
//    ) {
//        if (password2.length() >= WEAK_STREGTH & password2.length() < MID_STREGTH) {
//            return "Слабый";
//        } else if (password2.length() >= MID_STREGTH & password2.length() < STRONG_STREGTH) {
//            return "Средний";
//        } else if (password2.length() >= STRONG_STREGTH) {
//            return "Сильный";
//        }
//        return "";
//    }
}