package com.demo.mvc.service;

import com.demo.mvc.entity.Product;
import com.demo.mvc.repository.ProductRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductService {

    private final ProductRepository repo;

    public ProductService(ProductRepository repo) {
        this.repo = repo;
    }

    public List<Product> findAll() {
        return repo.findAll();
    }

    public Product save(Product p) {
        return repo.save(p);
    }

    public List<Object[]> getAllByLang(String lang) {
        return repo.findProductsByLanguage(lang);
    }

    public List<Object[]> searchProducts(String keyword, String lang) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return repo.findProductsByLanguage(lang);
        }
        return repo.searchProductsByKeywordAndLanguage(keyword, lang);
    }
}
