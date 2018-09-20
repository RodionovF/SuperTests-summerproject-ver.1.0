package com.example.supertests.repos;

import com.example.supertests.domain.StatOfTest;
import com.example.supertests.domain.Test;
import org.springframework.data.repository.CrudRepository;


import java.util.List;


public interface TestStatRepo extends CrudRepository<StatOfTest, Long> {

    List<StatOfTest> findByTestId(Test testId);
}

