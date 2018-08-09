package com.example.sweater.repos;

import com.example.sweater.domain.Category;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepo extends CrudRepository<Category, Long> {

    List<Category> findByCategoryname(String categoryname);

}
