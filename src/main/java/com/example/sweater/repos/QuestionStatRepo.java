package com.example.sweater.repos;

import com.example.sweater.domain.StatOfQuestion;
import com.example.sweater.domain.Answer;
import com.example.sweater.domain.Question;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuestionStatRepo extends CrudRepository<StatOfQuestion, Long> {

    //List<Answer> findByQuestionId(Question questionId);

}
