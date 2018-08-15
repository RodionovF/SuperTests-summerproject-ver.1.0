package com.example.sweater.repos;

import com.example.sweater.domain.Question;
import com.example.sweater.domain.Test;
import org.springframework.data.repository.CrudRepository;

import javax.management.Query;
import java.util.List;

public interface QuestionRepo extends CrudRepository<Question, Long> {

    List<Question> findByTestid(Test testid);

}
