package com.example.sweater.controller;

import com.example.sweater.domain.*;
import com.example.sweater.repos.AnswerRepo;
import com.example.sweater.repos.QuestionRepo;
import com.example.sweater.repos.TestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class TestController {

    @Autowired
    private TestRepo testRepo;

    @Autowired
    private QuestionRepo questionRepo;

    @Autowired
    private AnswerRepo answerRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/categories/{category}")
    public String testsMain(
            Model model,
            @PathVariable Category category
    ) {
        Iterable<Test> tests = testRepo.findAll();

        model.addAttribute("tests", tests);
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
            @RequestParam("image2") MultipartFile image2,
            @RequestParam("question") List<String> listQuestion,
            @RequestParam("questionimage") List<MultipartFile> listQuestionImage,
            @RequestParam("answer") List<String> listAnswer,
            @RequestParam("counter") List<Long> counter,
            @RequestParam List<String> active
    ) throws IOException {
        Test test = new Test(testname);
        test.setAuthor_id(user);
        test.setNum_of_questions(num_of_questions);
        test.setCategory_id(category);
        saveTestsFile(test, image1, image2);
        testRepo.save(test);

        int k = 0;
        int p = 0;
        int count = 0;
        for (int i = 0; i < listQuestion.size(); i++) {
            Question question = new Question(listQuestion.get(i));
            question.setTestid(test);
            saveQuestionFile(question, listQuestionImage.get(i));
            questionRepo.save(question);


            count += counter.get(i);


            for (int j = p; j < count; j++, k++, p++) {
                Answer answer = new Answer(listAnswer.get(j));
                answer.setQuestion_id(question);

                String isActive = active.get(k);
                if (isActive.equals("1")) {
                    answer.setCorectness(true);
                    k++;
                } else
                    answer.setCorectness(false);

                answerRepo.save(answer);
            }


        }

        model.addAttribute("test", test);
        model.addAttribute("category", category);
        return "redirect:/categories/" + category.getCategory_id();
    }

    private void saveTestsFile(
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

            test.setImage_path_end(resultFilename);
        }

        if (image1 != null && !image1.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + image1.getOriginalFilename();

            image1.transferTo(new File(uploadPath + "/" + resultFilename));

            test.setImage_path_start(resultFilename);
        }
    }

    private void saveQuestionFile(
            @Valid Question question,
            @RequestParam("questionimage") MultipartFile questionimage
    ) throws IOException {

        if (questionimage != null && !questionimage.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + questionimage.getOriginalFilename();

            questionimage.transferTo(new File(uploadPath + "/" + resultFilename));

            question.setImage_path(resultFilename);
        }
    }

    @GetMapping("categories/{category}/{test}")
    public String passTest(
            Model model,
            @PathVariable Category category,
            @PathVariable Test test
    ) throws IOException {
        Iterable<Question> questions = questionRepo.findByTestid(test);
        Iterable<Answer> answers = null;

//        for (Question question : questions) {
//            answers = answerRepo.findByQuestion_id(question);
////        }

        model.addAttribute("test", test);
        model.addAttribute("category", category);
        model.addAttribute("questions", questions);
        //       model.addAttribute("answers", answers);
        return "testsPassing";
    }


}