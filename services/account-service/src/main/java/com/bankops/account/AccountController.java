package com.bankops.account;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/accounts")
public class AccountController {

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
            "service", "account-service",
            "status", "UP"
        );
    }
}
