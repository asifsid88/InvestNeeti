package com.investneeti.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by mhussaa on 3/14/17.
 */
@Controller
public class StockController {

    @GetMapping("/stock")
    public String hello() {
        return "hello";
    }
}
