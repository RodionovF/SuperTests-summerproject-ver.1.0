package com.example.sweater.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "stat_of_tests")
public class StatOfTest {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long stat_test_id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User userId;

    private Long final_time;

    private Date date;

    private Long result;

    public Long getStat_test_id() {
        return stat_test_id;
    }

    public void setStat_test_id(Long stat_test_id) {
        this.stat_test_id = stat_test_id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Long getFinal_time() {
        return final_time;
    }

    public void setFinal_time(Long final_time) {
        this.final_time = final_time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getResult() {
        return result;
    }

    public void setResult(Long result) {
        this.result = result;
    }
}
