package com.bankops.transaction;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/transactions")
public class TransactionController {

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
            "service", "transaction-service",
            "status", "UP"
        );
    }
}
