package com.example.sweater.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "answers")
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long answer_id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "question_id")
    private Question question_id;

    @NotBlank(message = "Please fill the answer")
    @Length(max = 255, message = "Answer too long (more than 255)")
    private String answer;

    private boolean corectness;

    public Answer() {

    }

    public Answer(String answer) {
        this.answer = answer;
    }

    public Long getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(Long answer_id) {
        this.answer_id = answer_id;
    }

    public Question getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Question question_id) {
        this.question_id = question_id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean isCorectness() {
        return corectness;
    }

    public void setCorectness(boolean corectness) {
        this.corectness = corectness;
    }
}
