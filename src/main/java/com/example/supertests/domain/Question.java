package com.example.supertests.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long question_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "testId")
    private Test testId;


    @NotBlank(message = "Please fill the question")
    @Length(max = 2048, message = "Question too long (more than 255)")
    private String question;

    private String image_path;

    public Question() {

    }

    public Question(String question){
        this.question = question;
    }

    public Long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Long question_id) {
        this.question_id = question_id;
    }

    public Test getTestId() {
        return testId;
    }

    public void setTestId(Test testId) {
        this.testId = testId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }
}
