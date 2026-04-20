import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/views/detailspage/banner_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerCarouselWidget extends StatelessWidget {
  final List<BannerItem> banners;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const BannerCarouselWidget({
    super.key,
    required this.banners,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: controller,
              itemCount: banners.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BannerDetailPage(banners: banners, initialIndex: i),
                    ),
                  );
                },
                child: _BannerCard(banner: banners[i]),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _PageDots(count: banners.length, current: currentIndex),
        ],
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final BannerItem banner;
  const _BannerCard({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: banner.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => ColoredBox(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (_, _, _) => ColoredBox(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image, color: Colors.red),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.15),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: banner.color,
                child: Center(
                  child: Text(
                    banner.brand,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  final int count;
  final int current;
  const _PageDots({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 10 : 8,
          height: isActive ? 10 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColors.primary : AppColors.divider,
          ),
        );
      }),
    );
  }
}
