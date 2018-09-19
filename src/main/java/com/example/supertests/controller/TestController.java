package com.example.supertests.controller;

import com.example.supertests.domain.*;
import com.example.supertests.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
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
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("categories/{category}/create-mode")
    public String viewTest(
            Model model,
            @PathVariable Category category
    ) {
        model.addAttribute("category", category);

        return "testsCreating";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("categories/{category}/create-mode")
    public String addTest(
            @AuthenticationPrincipal User user,
            @PathVariable Category category,
            @Valid Test test,
            BindingResult bindingResult,
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
        model.addAttribute("category", category);

        boolean error = false;

        for (String emptyString : listQuestion) {
            if (("").equals(emptyString)) {
                model.addAttribute("questionError", "Please, fill the question");
                error = true;
            }
        }

        for (String emptyString : listAnswer) {
            if (("").equals(emptyString)) {
                model.addAttribute("answerError", "Please, fill the answer");
                error = true;
            }
        }

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            error = true;
        }

        if (error) {
            return "testsCreating";
        }

        test.setAuthor_id(user);
        test.setNum_of_questions(num_of_questions);
        test.setCategoryId(category);
        saveTestsFile(test, image1, image2);
        testRepo.save(test);

        int curentCheckBox = 0;
        int currentAns = 0;
        int countAnsInQue = 0;

        for (int i = 0; i < listQuestion.size(); i++) {
            Question question = new Question(listQuestion.get(i));
            question.setTestId(test);
            saveQuestionFile(question, listQuestionImage.get(i));
            questionRepo.save(question);

            countAnsInQue += counter.get(i);

            for (int j = currentAns; j < countAnsInQue; j++, curentCheckBox++, currentAns++) {
                Answer answer = new Answer(listAnswer.get(j));
                answer.setQuestionId(question);

                String isActive = active.get(curentCheckBox);
                if (isActive.equals("1")) {
                    answer.setCorectness(true);
                    curentCheckBox++;
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
            @AuthenticationPrincipal User user,
            @RequestParam(value = "checks[]", required = false) String[] checks,
            @RequestParam(required = false, defaultValue = "") String currentQuestion,
            @RequestParam(required = false, defaultValue = "") String currentStat,
            @RequestParam(required = false, defaultValue = "0") String numOfRightAnswers,
            @RequestParam(required = false, defaultValue = "0") String numAnswers,
            @RequestParam(required = false, defaultValue = "") String sSecs,
            Model model,
            @PathVariable Category category,
            @PathVariable Test test
    ) throws IOException {
        List<Question> questions = questionRepo.findByTestId(test);
        List<Answer> answers = null;
        List<Answer> checkedAnswers = new ArrayList<Answer>();
        List<ButtonTypes> buttonTypes = new ArrayList<ButtonTypes>();
        List<Answer> answersOnOneQuestion = null;
        List<Answer> answersOnOneQuestionCheck = null;
        Long numRight = Long.valueOf(numOfRightAnswers);
        Long numAns = Long.valueOf(numAnswers);
        int trueAns = 0;
        int selectedTrueAns = 0;

        for (Question question : questions) {
            answersOnOneQuestion = answerRepo.findByQuestionId(question);

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

            StatOfTest statOfTest;

            if (("").equals(currentStat)) {
                statOfTest = new StatOfTest();
                statOfTest.setUserId(user);
                statOfTest.setTestId(test);
                LocalDate todayLocalDate = LocalDate.now(ZoneId.of("America/Montreal"));
                java.sql.Date sqlDate = java.sql.Date.valueOf(todayLocalDate);
                statOfTest.setDate(sqlDate);
                testStatRepo.save(statOfTest);
            } else {
                statOfTest = testStatRepo.findById(Long.valueOf(currentStat)).get();
            }


            StatOfQuestion statOfQuestion = new StatOfQuestion();
            statOfQuestion.setStatTestId(statOfTest);
            statOfQuestion.setQuestionId(questionRepo.findById(Long.valueOf(currentQuestion)).get());

            Question currentQue = questionRepo.findById(Long.valueOf(currentQuestion)).get();
            answersOnOneQuestionCheck = answerRepo.findByQuestionId(currentQue);

            for (Answer ans : answersOnOneQuestionCheck) {
                if (ans.isCorectness())
                    trueAns++;
            }

            for (int i = 0; i < checks.length; i++) {
                Answer selectedAnswer = answerRepo.findById(Long.valueOf(checks[i])).get();
                if (!selectedAnswer.isCorectness())
                    checkedAnswers.add(selectedAnswer);
                else
                    selectedTrueAns++;

                statOfQuestion.setSelectedAnswer(selectedAnswer);
                questionStatRepo.save(statOfQuestion);
            }

            numAns++;

            if ((selectedTrueAns == trueAns) && (trueAns > 0))
                numRight++;

            if (numAns.equals(test.getNum_of_questions())) {
                statOfTest.setResult(numRight);
                statOfTest.setFinal_time(Long.valueOf(sSecs));
            }

            model.addAttribute("statOfTest", statOfTest.getStat_test_id());
        } else {
            model.addAttribute("statOfTest", "");
        }

        model.addAttribute("numOfRightAnswers", numRight);
        model.addAttribute("test", test);
        model.addAttribute("category", category);
        model.addAttribute("questions", questions);
        model.addAttribute("answers", answers);
        model.addAttribute("buttonTypes", buttonTypes);
        model.addAttribute("checkedAnswers", checkedAnswers);
        model.addAttribute("numOfRightAnswers", numRight);
        model.addAttribute("numAnswers", numAns);

        return "testsPassing";
    }

    @PostMapping("categories/{category}/{test}")
    public String endTest(
            @AuthenticationPrincipal User user,
            @RequestParam String statOfTest,
            @RequestParam String numOfRightAnswers,
            Model model,
            @PathVariable Category category,
            @PathVariable Test test
    ) throws IOException {
        Iterable<StatOfTest> target = testStatRepo.findByTestId(test);
        ArrayList<StatOfTest> statOfTests = new ArrayList<>();
        //StatOfTest currentStatOfTest = testStatRepo.findById(Long.valueOf(statOfTest)).get();
        Long betterThen = 0L;
        Long result = Long.valueOf(numOfRightAnswers);
        target.forEach(statOfTests::add);

        for(int i = 0; i <  statOfTests.size(); i++)
        {
            if(statOfTests.get(i).getResult() == null)
                betterThen++;
            else  if (result >= statOfTests.get(i).getResult())
                betterThen++;
        }

        double ans = betterThen*100/statOfTests.size();

        model.addAttribute("betterThen", ans);
        model.addAttribute("numOfTimesPass", statOfTests.size());
        model.addAttribute("numOfRightAnswers", numOfRightAnswers);
        model.addAttribute("test", test);
        model.addAttribute("category", category);

        return "testEnding";
    }
}


