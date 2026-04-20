// ── brand_list.dart ─────────────────────────────────────────────────────

import 'package:app_demo/eyecareview/core/data/data.dart';
import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/views/product_list_page.dart';
import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  final List<BrandItem> brands;
  final Map<String, List<ProductItem>> productsByBrand;

  const BrandList({
    super.key,
    required this.brands,
    required this.productsByBrand,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final brand = brands[i];
          return _BrandChip(
            brand: brand,
            onTap: () => _openProducts(context, brand),
          );
        },
      ),
    );
  }

  void _openProducts(BuildContext context, BrandItem brand) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductListPage(
          brandName: brand.name, // sets the filter pill
          allProducts: Data.allProducts,
          products: [], // pass everything
        ),
      ),
    );
  }
}

class _BrandChip extends StatelessWidget {
  final BrandItem brand;
  final VoidCallback onTap;
  const _BrandChip({required this.brand, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                brand.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: 1,
                ),
              ),
              if (brand.subtitle != null)
                Text(
                  brand.subtitle!,
                  style: const TextStyle(
                    fontSize: 9,
                    letterSpacing: 3,
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
