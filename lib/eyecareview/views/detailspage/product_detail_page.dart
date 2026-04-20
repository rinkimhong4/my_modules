import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/circle_iconbox_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductItem product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final PageController _pageController;
  int _currentImage = 0;
  bool _showAllStores = false;

  ProductItem get product => widget.product;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onThumbnailTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 380,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleIconBox(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _ImageCarousel(
                images: product.urlImage,
                currentPage: _currentImage,
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentImage = i),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ThumbnailRow(
                    images: product.urlImage,
                    selected: _currentImage,
                    onTap: _onThumbnailTap,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.brand,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ColorDot(color: product.color, isSelected: true),
                  const SizedBox(height: 20),
                  _SpecChips(specs: product.specs),
                  const SizedBox(height: 28),
                  if (product.availableAt.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Available At',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (product.availableAt.length > 2)
                          GestureDetector(
                            onTap: () => setState(
                              () => _showAllStores = !_showAllStores,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _showAllStores
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  _showAllStores
                                      ? 'View Less'
                                      : 'View All (${product.availableAt.length})',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...(_showAllStores
                            ? product.availableAt
                            : product.availableAt.take(2))
                        .map((store) => _StoreAvailabilityCard(store: store)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.send, size: 20),
                        label: const Text(
                          'Ask via Telegram',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0088CC),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Image Carousel ──────────────────────────────────────────────────────

class _ImageCarousel extends StatelessWidget {
  final List<String> images;
  final int currentPage;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const _ImageCarousel({
    required this.images,
    required this.currentPage,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: images.length,
          onPageChanged: onPageChanged,
          itemBuilder: (_, i) => ColoredBox(
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: images[i],
              fit: BoxFit.contain,
              placeholder: (_, __) => const ColoredBox(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (_, __, ___) => const ColoredBox(
                color: Colors.white,
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.red),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: _DotIndicator(current: currentPage, total: images.length),
        ),
      ],
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int current;
  final int total;
  const _DotIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < total; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: current == i ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: current == i ? AppColors.textPrimary : AppColors.divider,
            ),
          ),
      ],
    );
  }
}

// ── Thumbnail Row ───────────────────────────────────────────────────────

class _ThumbnailRow extends StatelessWidget {
  final List<String> images;
  final int selected;
  final ValueChanged<int> onTap;

  const _ThumbnailRow({
    required this.images,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final isActive = selected == i;
          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive ? AppColors.primary : AppColors.divider,
                  width: isActive ? 2 : 1,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),

                child: CachedNetworkImage(
                  imageUrl: images[i],
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const ColoredBox(color: Colors.white),
                  errorWidget: (_, _, _) =>
                      const Icon(Icons.broken_image, size: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Color Dot ───────────────────────────────────────────────────────────

class _ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorDot({required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.divider,
          width: 2,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 18)
          : null,
    );
  }
}

// ── Spec Chips ──────────────────────────────────────────────────────────

class _SpecChips extends StatelessWidget {
  final Map<String, String> specs;
  const _SpecChips({required this.specs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: specs.entries.map((e) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.divider),
          ),
          child: Text(
            '${e.key}: ${e.value}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Store Availability Card ─────────────────────────────────────────────

class _StoreAvailabilityCard extends StatelessWidget {
  final AvailableStore store;
  const _StoreAvailabilityCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/google_maps.png',
                  width: 32,
                  height: 32,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    store.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.near_me, size: 18),
                label: const Text(
                  'Open in Google Maps',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
