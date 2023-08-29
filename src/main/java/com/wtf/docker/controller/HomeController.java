package com.wtf.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wtf
 * @date 2022/2/22 11:12
 */
@RestController
@RequestMapping("/")
public class HomeController {
    @GetMapping
    public String index() {
        return "欢迎访问";
    }
}
