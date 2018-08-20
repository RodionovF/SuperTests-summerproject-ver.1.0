package com.example.sweater.repos;

import com.example.sweater.domain.Category;
import com.example.sweater.domain.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepo extends CrudRepository<Test, Long> {

    List<Test> findByCategoryId(Category CategoryId);

}
