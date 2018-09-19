package com.example.supertests.repos;

import com.example.supertests.domain.Category;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepo extends CrudRepository<Category, Long> {

    Category findByCategoryname(String categoryname);
}
