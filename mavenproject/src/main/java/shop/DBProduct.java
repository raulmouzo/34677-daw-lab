package shop;

import java.util.List;

public class DBProduct {
    private int id;
    private String description;
    private double price;
    private String brand;
    private int categoryId;
    private List<String> images;
    private List<DBVariant> variants;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public List<String> getImages() {
        return images;
    }
    public void setImages(List<String> images) {
        this.images = images;
    }

    public List<DBVariant> getVariants() {
        return variants;
    }
    public void setVariants(List<DBVariant> variants) {
        this.variants = variants;
    }
}