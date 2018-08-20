package com.example.sweater.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "tests")
public class Test {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long test_id;

    @NotBlank(message = "Please fill the testname")
    @Length(max = 2048, message = "Testname too long (more than 255)")
    private String testname;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "author_id")
    private User author_id;

    private Long num_of_questions;

    private String image_path_start;

    private String image_path_end;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "categoryId")
    private Category categoryId;

    public Test() {

    }

    public Test(String testname) {
        this.testname = testname;
    }

    public Long getTest_id() {
        return test_id;
    }

    public void setTest_id(Long test_id) {
        this.test_id = test_id;
    }

    public String getTestname() {
        return testname;
    }

    public void setTestname(String testname) {
        this.testname = testname;
    }

    public User getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(User author_id) {
        this.author_id = author_id;
    }

    public Long getNum_of_questions() {
        return num_of_questions;
    }

    public void setNum_of_questions(Long num_of_questions) {
        this.num_of_questions = num_of_questions;
    }

    public String getImage_path_start() {
        return image_path_start;
    }

    public void setImage_path_start(String image_path_start) {
        this.image_path_start = image_path_start;
    }

    public String getImage_path_end() {
        return image_path_end;
    }

    public void setImage_path_end(String image_path_end) {
        this.image_path_end = image_path_end;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }
}
