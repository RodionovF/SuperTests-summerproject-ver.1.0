package com.example.supertests.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, CREATER;

    @Override
    public String getAuthority() {
        return name();
    }
}
