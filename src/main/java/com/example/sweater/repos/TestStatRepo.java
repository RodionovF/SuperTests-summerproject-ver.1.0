package com.example.sweater.repos;

import com.example.sweater.domain.StatOfTest;
import com.example.sweater.domain.StatOfQuestion;
import com.example.sweater.domain.Answer;
import com.example.sweater.domain.Question;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestStatRepo extends CrudRepository<StatOfTest, Long> {

   ////StatOfTest findOne(ID stat_test_id);
    //StatOfTest findByStat_test_id(Long stat_test_id);
}

