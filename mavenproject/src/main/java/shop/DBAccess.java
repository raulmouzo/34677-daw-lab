package shop;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBAccess {
    private static DBAccess instance = null;
    private Connection conn = null;
    
    private static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/daw";
    private static final String USER = "root";
    private static final String PASS = "t00r24";

    private DBAccess() {
        openConnection();
    }

    public static synchronized DBAccess getInstance() {
        if (instance == null) {
            instance = new DBAccess();
        }
        return instance;
    }

    public void openConnection() {
        if (conn == null) {
            try {
                Class.forName(JDBC_DRIVER);
                conn = DriverManager.getConnection(DB_URL, USER, PASS);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException("Error connecting to the database", e);
            }
        }
    }

    public boolean checkConnection() {
        openConnection();
        return conn != null;
    }

    public List<DBProduct> getProductsByCategory(int category) {
        openConnection();
        List<DBProduct> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE category_id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, category);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Get the images
                    String query_img = "SELECT * FROM product_images WHERE product_id = ?";
                    List<String> images = new ArrayList<>();
                    try (PreparedStatement stmt_img = conn.prepareStatement(query_img)) {
                        stmt_img.setInt(1, rs.getInt("id"));
                        try (ResultSet rs_img = stmt_img.executeQuery()) {
                            while (rs_img.next()) {
                                images.add(rs_img.getString("image_url"));
                            }
                        }
                    }

                    DBProduct product = new DBProduct();
                    product.setId(rs.getInt("id"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setBrand(rs.getString("brand"));
                    product.setCategoryId(rs.getInt("category_id"));
                    product.setImages(images);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            System.err.println("Error getting products by category: " + e.getMessage());
        }
        return products;
    }

    public List<DBVariant> getVariantsByProduct(int productId){
        openConnection();
        List<DBVariant> variants = new ArrayList<>();
        String query = "SELECT * FROM variants WHERE product_id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DBVariant variant = new DBVariant();
                    variant.setId(rs.getInt("id"));
                    variant.setProductId(rs.getInt("product_id"));
                    variant.setSizeLabel(rs.getString("size_label"));
                    variant.setStock(rs.getInt("stock"));
                    variants.add(variant);
                }
            }
        } catch (Exception e) {
            System.err.println("Error getting variants: " + e.getMessage());
        }
        return variants;
    }

    public int checkUserDB(String user, String pass) {
            openConnection();
            int userId = -1;
        
            try {
                String query = "SELECT id FROM users WHERE username=? AND password=?";
                PreparedStatement statement = conn.prepareStatement(query);
                statement.setString(1, user);
                statement.setString(2, pass);
        
                ResultSet resultSet = statement.executeQuery();
        
                if (resultSet.next()) {
                    userId = resultSet.getInt("id");
                }
            } catch (Exception e) {
                // Error while connecting to the database or executing the query
                System.err.println("Error checking username/password");
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        
            return userId;
        }
        
}
