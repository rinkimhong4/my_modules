import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoreCardWidget extends StatefulWidget {
  final Store store;

  const StoreCardWidget({super.key, required this.store});

  @override
  State<StoreCardWidget> createState() => _StoreCardWidgetState();
}

final PageController _controller = PageController();
int currentIndex = 0;

class _StoreCardWidgetState extends State<StoreCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // IMAGE SLIDER
                PageView.builder(
                  controller: _controller,
                  itemCount: widget.store.images.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: widget.store.images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.broken_image, color: Colors.red),
                      ),
                    );
                  },
                ),

                // DOT INDICATOR
                Positioned(
                  bottom: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.store.images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: currentIndex == index ? 8 : 6,
                        height: currentIndex == index ? 8 : 6,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.store.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),

                _InfoRow(icon: Icons.near_me, text: widget.store.distance),
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  text: widget.store.address,
                ),
                _InfoRow(icon: Icons.phone_outlined, text: widget.store.phone),
                _InfoRow(icon: Icons.access_time, text: widget.store.hours),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // print index of store
                    onPressed: () =>
                        debugPrint("Get Start ${widget.store.name}"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Directions',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
