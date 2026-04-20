import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerDetailPage extends StatefulWidget {
  final List<BannerItem> banners;
  final int initialIndex;

  const BannerDetailPage({
    super.key,
    required this.banners,
    this.initialIndex = 0,
  });

  @override
  State<BannerDetailPage> createState() => _BannerDetailPageState();
}

class _BannerDetailPageState extends State<BannerDetailPage> {
  late final PageController _controller;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) => _BannerPage(banner: widget.banners[i]),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomPadding + 16,
            child: Center(
              child: _DotIndicator(
                current: _currentPage,
                total: widget.banners.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Single Banner Page ──────────────────────────────────────────────────

class _BannerPage extends StatelessWidget {
  final BannerItem banner;

  const _BannerPage({required this.banner});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          backgroundColor: banner.color,
          leading: const _BackButton(),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: banner.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => ColoredBox(color: banner.color),
                  errorWidget: (_, __, ___) => ColoredBox(
                    color: banner.color,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.white54,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        banner.color.withValues(alpha: 0.7),
                        Colors.transparent,
                        banner.color.withValues(alpha: 0.4),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 16,
                  child: Text(
                    banner.brand,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
          sliver: SliverToBoxAdapter(
            child: Text(
              banner.description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Dot Indicator ───────────────────────────────────────────────────────

class _DotIndicator extends StatelessWidget {
  final int current;
  final int total;
  const _DotIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < total; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: current == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: current == i
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.4),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Back Button ─────────────────────────────────────────────────────────

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.black.withValues(alpha: 0.3),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
