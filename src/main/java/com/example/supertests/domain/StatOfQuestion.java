package com.example.supertests.domain;

import javax.persistence.*;

@Entity
@Table(name = "stat_of_questions")
public class StatOfQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long stat_question_id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "stat_test_id")
    private StatOfTest statTestId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "question_id")
    private Question questionId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "selected_answer")
    private Answer selectedAnswer;

    public StatOfQuestion() {

    }

    public Long getStat_question_id() {
        return stat_question_id;
    }

    public void setStat_question_id(Long stat_question_id) {
        this.stat_question_id = stat_question_id;
    }

    public StatOfTest getStatTestId() {
        return statTestId;
    }

    public void setStatTestId(StatOfTest statTestId) {
        this.statTestId = statTestId;
    }

    public Question getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Question questionId) {
        this.questionId = questionId;
    }

    public Answer getSelectedAnswer() {
        return selectedAnswer;
    }

    public void setSelectedAnswer(Answer selectedAnswer) {
        this.selectedAnswer = selectedAnswer;
    }
}
