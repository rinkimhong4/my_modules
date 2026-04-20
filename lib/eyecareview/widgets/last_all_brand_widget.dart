import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LastAllBrandWidget extends StatelessWidget {
  const LastAllBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TwoGridViewWidget();
  }
}

class TwoGridViewWidget extends StatelessWidget {
  const TwoGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/500/500?random=$index',
            fit: BoxFit.cover,

            placeholder: (context, url) => Container(
              color: Colors.grey.shade200,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),

            // optional error UI
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.error, color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
