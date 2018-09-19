package com.example.supertests.repos;

import com.example.supertests.domain.Question;
import com.example.supertests.domain.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuestionRepo extends CrudRepository<Question, Long> {

    List<Question> findByTestId(Test testId);
}
