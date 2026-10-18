package com.bankops.customer;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
            "service", "customer-service",
            "status", "UP"
        );
    }
}
