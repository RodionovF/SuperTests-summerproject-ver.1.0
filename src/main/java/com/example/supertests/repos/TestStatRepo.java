package com.example.supertests.repos;

import com.example.supertests.domain.StatOfTest;
import org.springframework.data.repository.CrudRepository;

public interface TestStatRepo extends CrudRepository<StatOfTest, Long> {

   ////StatOfTest findOne(ID stat_test_id);
    //StatOfTest findByStat_test_id(Long stat_test_id);
}

