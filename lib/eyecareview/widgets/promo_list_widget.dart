// ─── Promo List ───

import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PromoList extends StatelessWidget {
  final List<PromoItem> promos;
  const PromoList({super.key, required this.promos});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: promos.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, i) => _PromoCard(promo: promos[i]),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final PromoItem promo;
  const _PromoCard({required this.promo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: promo.imageUrl,
          fit: BoxFit.cover,

          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),

          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.broken_image, color: Colors.red)),
        ),
      ),
    );
  }
}
