package com.example.supertests.domain;

public class ButtonTypes {
    private boolean type;
    private Long question_id;

    public ButtonTypes(boolean type, Long numberQuestion) {
        this.type = type; // true == radio; false == checkbox
        this.question_id = numberQuestion;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public Long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Long question_id) {
        this.question_id = question_id;
    }
}
