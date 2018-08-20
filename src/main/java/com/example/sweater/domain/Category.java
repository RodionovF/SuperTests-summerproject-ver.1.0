package com.example.sweater.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@Entity
@Table(name = "preference_categories")
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long categoryId;

    @Length(max = 255, message = "Message too long (more than 255)")
    private String categoryname;

    //@ManyToOne(fetch = FetchType.EAGER)
    //@JoinColumn(name = "user_id")
    //private User author;

    private String filename;

    public Category() {

    }

    public Category(String category) {
        this.categoryname = category ;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
