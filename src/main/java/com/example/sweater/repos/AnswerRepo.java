package com.example.sweater.repos;

import com.example.sweater.domain.Answer;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnswerRepo extends CrudRepository<Answer, Long> {

    List<Answer> findByAnswer(String answer);

}