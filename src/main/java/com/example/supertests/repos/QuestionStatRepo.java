package com.example.supertests.repos;

import com.example.supertests.domain.StatOfQuestion;
import com.example.supertests.domain.StatOfTest;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuestionStatRepo extends CrudRepository<StatOfQuestion, Long> {

    List<StatOfQuestion> findByStatTestId(StatOfTest statOfTest);
}

