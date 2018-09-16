package com.example.supertests.repos;

import com.example.supertests.domain.Category;
import com.example.supertests.domain.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepo extends CrudRepository<Test, Long> {

    List<Test> findByCategoryId(Category CategoryId);

}
