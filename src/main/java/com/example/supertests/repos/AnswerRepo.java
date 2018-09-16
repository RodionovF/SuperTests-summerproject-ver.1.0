package com.example.supertests.repos;

import com.example.supertests.domain.Answer;
import com.example.supertests.domain.Question;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnswerRepo extends CrudRepository<Answer, Long> {

    List<Answer> findByQuestionId(Question questionId);

    Answer findOneByAnswer(String answer);

}