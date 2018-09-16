package com.example.supertests.repos;

import com.example.supertests.domain.StatOfQuestion;
import org.springframework.data.repository.CrudRepository;

public interface QuestionStatRepo extends CrudRepository<StatOfQuestion, Long> {

    //List<Answer> findByQuestionId(Question questionId);

}
