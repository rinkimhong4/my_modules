import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/views/detailspage/product_detail_page.dart';
import 'package:app_demo/eyecareview/widgets/circle_iconbox_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  final String? brandName;
  final List<ProductItem> products;
  final List<ProductItem> allProducts;
  const ProductListPage({
    super.key,
    this.brandName,
    required this.products,
    required this.allProducts,
  });

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _selectedFilter = 0;
  String? _activeBrand;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  static const _filters = [
    'All',
    'Sunglasses',
    'Optical Glasses',
    'Other',
    'Frame',
    'Special',
  ];

  @override
  void initState() {
    super.initState();
    _activeBrand = widget.brandName;
  }

  List<ProductItem> get _filtered {
    var results = widget.allProducts;

    // brand filter — null means show all
    if (_activeBrand != null) {
      results = results.where((p) => p.brand == _activeBrand).toList();
    }

    // search
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      results = results
          .where((p) => p.name.toLowerCase().contains(query))
          .toList();
    }

    return results;
  }

  // In _ProductListPageState, add this method:

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FilterBottomSheet(
        brands: widget.allProducts.map((p) => p.brand).toSet().toList()..sort(),
        activeBrand: _activeBrand,
        selectedFilter: _selectedFilter,
        filters: _filters,
        onBrandSelected: (brand) {
          setState(() => _activeBrand = brand);
          Navigator.pop(context);
        },
        onCategorySelected: (i) {
          setState(() => _selectedFilter = i);
          Navigator.pop(context);
        },
        onReset: () {
          setState(() {
            _activeBrand = null;
            _selectedFilter = 0;
            _searchController.clear();
            _searchQuery = '';
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Products'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconBox(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _SearchRow(
          //   controller: _searchController,
          //   onChanged: (q) => setState(() => _searchQuery = q),
          // ),

          // In the build method, pass the callback:
          _SearchRow(
            controller: _searchController,
            onChanged: (q) => setState(() => _searchQuery = q),
            onFilterTap: _showFilterSheet,
          ),
          const SizedBox(height: 12),
          _FilterChips(
            filters: _filters,
            selected: _selectedFilter,
            onSelected: (i) => setState(() {
              _selectedFilter = _selectedFilter == i ? 0 : i;
            }),
          ),
          const SizedBox(height: 12),
          _BrandFilterRow(
            brandName: _activeBrand,
            onClear: () => setState(() => _activeBrand = null),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: _filtered.isEmpty
                ? const _EmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.58,
                        ),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) {
                      final product = _filtered[i];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: product),
                          ),
                        ),
                        child: _ProductCard(product: product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Search Row

class _SearchRow extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  const _SearchRow({
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      decoration: const InputDecoration(
                        hintText: 'Search products...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onFilterTap, // ← no parentheses
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(
                Icons.tune,
                color: AppColors.textSecondary,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Filter Chips ────────────────────────────────────────────────────────

class _FilterChips extends StatelessWidget {
  final List<String> filters;
  final int selected;
  final ValueChanged<int> onSelected;

  const _FilterChips({
    required this.filters,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isActive = selected == i;
          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isActive ? AppColors.primary : AppColors.divider,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    if (isActive)
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(Icons.check, color: Colors.white, size: 16),
                      ),
                    Text(
                      filters[i],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? Colors.white
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Brand Filter Row ────────────────────────────────────────────────────

class _BrandFilterRow extends StatelessWidget {
  final String? brandName;
  final VoidCallback onClear;

  const _BrandFilterRow({required this.brandName, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const Text(
            'Filter:',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 10),
          if (brandName != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    brandName!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: onClear,
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          else
            Text(
              'No brand selected',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Product Card ────────────────────────────────────────────────────────

class _ProductCard extends StatelessWidget {
  final ProductItem product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final tint = product.color.withValues(alpha: 0.1);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.urlImage.first,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (_, _) => ColoredBox(
                color: tint,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (_, _, _) => ColoredBox(
                color: tint,
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: product.color,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.divider),
              ),
              child: const SizedBox(width: 22, height: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton.icon(
              onPressed: () {
                print("go to Telegram");
              },
              icon: const Icon(Icons.send, size: 14),
              label: const Text(
                'Ask via Telegram',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 32),
                backgroundColor: const Color(0xFF0088CC),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Empty State ─────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 120,
            color: AppColors.primary.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 8),
          const Text(
            'No products found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  final List<String> brands;
  final String? activeBrand;
  final int selectedFilter;
  final List<String> filters;
  final ValueChanged<String?> onBrandSelected;
  final ValueChanged<int> onCategorySelected;
  final VoidCallback onReset;

  const _FilterBottomSheet({
    required this.brands,
    required this.activeBrand,
    required this.selectedFilter,
    required this.filters,
    required this.onBrandSelected,
    required this.onCategorySelected,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onReset,
                  child: const Text(
                    'Reset All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // input price
          Row(children: [Text("data"), Text("data")]),

          const SizedBox(height: 20),

          // Brand section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Brand',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _FilterChip(
                  label: 'All Brands',
                  isActive: activeBrand == null,
                  onTap: () => onBrandSelected(null),
                ),
                ...brands.map(
                  (b) => _FilterChip(
                    label: b,
                    isActive: activeBrand == b,
                    onTap: () => onBrandSelected(b),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Category section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 0; i < filters.length; i++)
                  _FilterChip(
                    label: filters[i],
                    isActive: selectedFilter == i,
                    onTap: () => onCategorySelected(i),
                  ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.divider,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
