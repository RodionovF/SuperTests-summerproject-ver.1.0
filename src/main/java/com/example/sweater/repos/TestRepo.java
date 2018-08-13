package com.example.sweater.repos;

import com.example.sweater.domain.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepo extends CrudRepository<Test, Long> {

    List<Test> findByTestname(String testname);

}
