package com.demo.mvc.controller;

import com.demo.mvc.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class I18nProductController {

    private final ProductService productService;

    public I18nProductController(ProductService productService) {
        this.productService = productService;
    }

    // Trang hiển thị danh sách sản phẩm theo ngôn ngữ
    @GetMapping("/i18n-products")
    public String i18nProducts(@RequestParam(defaultValue = "VI") String lang, Model model) {
        List<Object[]> rows = productService.getAllByLang(lang);
        model.addAttribute("lang", lang);
        model.addAttribute("rows", rows);
        return "i18n_products";
    }

    // Tìm kiếm sản phẩm
    @GetMapping("/i18n-products/search")
    public String searchProducts(
            @RequestParam("keyword") String keyword,
            @RequestParam(defaultValue = "VI") String lang,
            Model model) {

        List<Object[]> rows = productService.searchProducts(keyword, lang);
        model.addAttribute("lang", lang);
        model.addAttribute("rows", rows);
        model.addAttribute("keyword", keyword);

        return "i18n_products";
    }
}
