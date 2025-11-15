package qlviec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import qlviec.service.SinhVienService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private SinhVienService sinhVienService;

    @GetMapping("/basic")
    public String showBasicSearchForm() {
        return "searchBasic";
    }

    @GetMapping("/basic-result")
    public String searchBasic(@RequestParam(value = "keyword", required = false) String keyword,
                              Model model) {
        List result = sinhVienService.searchBasic(keyword);
        model.addAttribute("sinhvienList", result);
        model.addAttribute("keyword", keyword);
        return "searchBasic";
    }

    @GetMapping("/grad-work")
    public String showGradWorkSearchForm() {
        return "searchGradWork";
    }

    @GetMapping("/grad-work-result")
    public String searchGradWork(@RequestParam(value = "keyword", required = false) String keyword,
                                 Model model) {
        List<Map<String, Object>> result = sinhVienService.searchGradWork(keyword);
        model.addAttribute("resultList", result);
        model.addAttribute("keyword", keyword);
        return "searchGradWork";
    }
}