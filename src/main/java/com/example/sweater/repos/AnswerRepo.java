package com.example.sweater.repos;

import com.example.sweater.domain.Answer;
import com.example.sweater.domain.Question;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnswerRepo extends CrudRepository<Answer, Long> {

    List<Answer> findByQuestionId(Question questionId);


}