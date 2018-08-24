package com.example.sweater.domain;

public class ButtonTypes {
    private boolean type;
    private Long numberQuestion;

    public ButtonTypes(boolean type, Long numberQuestion) {
        this.type = type;
        this.numberQuestion = numberQuestion;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public Long getNumberQuestion() {
        return numberQuestion;
    }

    public void setNumberQuestion(Long numberQuestion) {
        this.numberQuestion = numberQuestion;
    }
}
