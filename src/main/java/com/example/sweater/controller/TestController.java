package com.example.sweater.controller;

import com.example.sweater.domain.*;
import com.example.sweater.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import java.util.UUID;

@Controller
public class TestController {
    private static final int twoTrueAns = 4;

    @Autowired
    private TestRepo testRepo;

    @Autowired
    private QuestionRepo questionRepo;

    @Autowired
    private AnswerRepo answerRepo;

    @Autowired
    private QuestionStatRepo questionStatRepo;

    @Autowired
    private TestStatRepo testStatRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/categories/{category}")
    public String testsMain(
            Model model,
            @PathVariable Category category
    ) {
        Iterable<Test> tests = testRepo.findByCategoryId(category);

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
            @RequestParam("active") List<String> active
    ) throws IOException {
        Test test = new Test(testname);
        test.setAuthor_id(user);
        test.setNum_of_questions(num_of_questions);
        test.setCategoryId(category);
        saveTestsFile(test, image1, image2);
        testRepo.save(test);

        int k = 0;
        int p = 0;
        int count = 0;
        for (int i = 0; i < listQuestion.size(); i++) {
            Question question = new Question(listQuestion.get(i));
            question.setTestId(test);
            saveQuestionFile(question, listQuestionImage.get(i));
            questionRepo.save(question);


            count += counter.get(i);


            for (int j = p; j < count; j++, k++, p++) {
                Answer answer = new Answer(listAnswer.get(j));
                answer.setQuestionId(question);

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
        return "redirect:/categories/" + category.getCategoryId();
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
            @RequestParam(value="checkboxes[]", required=false) String[] checkboxes,
            @RequestParam(required = false, defaultValue = "") String currentQuestion,
            Model model,
            @PathVariable Category category,
            @PathVariable Test test
    ) throws IOException {
        List<Question> questions = questionRepo.findByTestId(test);
        List<Answer> answers = null;
        List<ButtonTypes> buttonTypes = new ArrayList<ButtonTypes>();
        List<Answer> answersOnOneQuestion = null;

        for (Question question : questions) {
            answersOnOneQuestion =  answerRepo.findByQuestionId(question);

            int numberOfTrueAns = 1;
            for (int i = 0; i < answersOnOneQuestion.size(); i++) {
                numberOfTrueAns = numberOfTrueAns * ((answersOnOneQuestion.get(i).isCorectness() == false) ? 1 : 2);
            }

            if (numberOfTrueAns >= twoTrueAns) {
                ButtonTypes newElement = new ButtonTypes(false, question.getQuestion_id());
                buttonTypes.add(newElement);
            } else {
                ButtonTypes newElement = new ButtonTypes(true, question.getQuestion_id());
                buttonTypes.add(newElement);
            }

            if (answers == null)
                answers = answersOnOneQuestion;
            else {
                answers.addAll(answersOnOneQuestion);
            }
        }

        if (!("").equals(currentQuestion)) {
            StatOfQuestion statOfQuestion = new StatOfQuestion();
            statOfQuestion.setStatTestId(test);
            Question helpQuestion = questionRepo.findByQuestion(currentQuestion);
            statOfQuestion.setQuestionId(helpQuestion);
        }
//        Answer helpAnswer = answerRepo.findByAnswerId(Long.valueOf(checkboxes[0]));
//        statOfQuestion.setSelectedAnswer(helpAnswer);



        model.addAttribute("test", test);
        model.addAttribute("category", category);
        model.addAttribute("questions", questions);
        model.addAttribute("answers", answers);
        model.addAttribute("buttonTypes", buttonTypes);
        return "testsPassing";
    }

}


