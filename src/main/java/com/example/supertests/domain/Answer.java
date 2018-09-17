package com.example.supertests.domain;

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
    @JoinColumn(name = "questionId")
    private Question questionId;

    @NotBlank(message = "Please, fill the answer")
    @Length(max = 255, message = "Answer too long (more than 255)")
    private String answer;

    private boolean corectness;

    public Answer() {

    }

    public Answer(String answer) {
        this.answer = answer;
    }

    public Answer(Long answer_id) {
        this.answer_id = answer_id;
    }

    public Long getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(Long answer_id) {
        this.answer_id = answer_id;
    }

    public Question getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Question questionId) {
        this.questionId = questionId;
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
