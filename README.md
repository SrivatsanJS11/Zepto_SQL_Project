# Zepto Inventory & Sales SQL Analysis

This project explores and analyzes a sample Zepto grocery dataset using SQL. It covers product-level insights, category-level performance, pricing trends, inventory metrics, and sales optimization.

---

## Business Questions Answered

1. Top 10 products by discount
2. High-MRP products out of stock
3. Revenue per product category
4. High-MRP, low-discount items
5. Top 5 discount-offering categories
6. Price per gram — best value items
7. Product grouping by weight (Low, Medium, Bulk)
8. Inventory weight per category

---

## Key Insights

### Best Value Products
- Waffy Wafers offer **the highest discount** (51%) — all priced at ₹45.
- Cheese and instant masalas are also commonly discounted by 50%.

### High MRP, Out of Stock
- Products like **Patanjali Ghee (₹565)** and **MamyPoko Diapers (₹399)** are high-MRP but currently out of stock, suggesting **missed revenue opportunities**.

###  Estimated Revenue by Category
- **Cooking Essentials** and **Munchies** dominate with ₹3.37 lakh each in estimated revenue.
- Other top performers: **Personal Care**, **Paan Corner**, and **Ice Cream & Desserts**.

### Highest Average Discounts
- **Fruits & Vegetables** lead with an average discount of **15.46%**.
- **Meats, Eggs**, and **Ice Cream** follow with moderate discounts (~8–11%).

### Inventory Weight Distribution
- **Munchies** and **Cooking Essentials** top inventory weight with over **1.4 million grams** each.
- Bulkier categories like **Packaged Food** and **Home & Cleaning** also contribute significantly.

---

## Tools Used

- PostgreSQL
- pgAdmin (for SQL execution)

---

## Summary

This analysis helps Zepto understand:
- Where it's losing sales due to stockouts
- Which categories need pricing or supply adjustments
- How discounts are distributed and impacting sales
- How to better manage heavy vs. lightweight inventory

