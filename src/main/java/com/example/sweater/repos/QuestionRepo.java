package com.example.sweater.repos;

import com.example.sweater.domain.Question;
import org.springframework.data.repository.CrudRepository;

import javax.management.Query;
import java.util.List;

public interface QuestionRepo extends CrudRepository<Question, Long> {

    List<Question> findByQuestion(String testname);

}
