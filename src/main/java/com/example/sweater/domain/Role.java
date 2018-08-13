package com.example.sweater.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthoritiesContainer;

public enum Role implements GrantedAuthority {
    USER, ADMIN, CREATER;

    @Override
    public String getAuthority() {
        return name();
    }
}
