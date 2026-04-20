import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:flutter/material.dart';

class MemberCardWidget extends StatelessWidget {
  final MemberTier tier;
  final int points;
  final String barcode;

  const MemberCardWidget({
    super.key,
    required this.tier,
    required this.points,
    required this.barcode,
  });

  double get _progress => tier.pointsToNext > 0
      ? (points / tier.pointsToNext).clamp(0.0, 1.0)
      : 1.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 8,
      shadowColor: tier.shadowColor.withValues(alpha: 0.4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: tier.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 4),
            Text(
              '$points',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            _buildFooter(),
            if (tier.nextTier.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                '${tier.pointsToNext - points} more points to become ${tier.nextTier}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Available Points',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Icon(tier.badge, color: Colors.white, size: 18),
            const SizedBox(width: 4),
            Text(
              '${tier.name} MEMBER',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        _ProgressRing(value: _progress, label: '$points'),
        const SizedBox(width: 8),
        Icon(tier.badge, color: Colors.amber, size: 28),
        const Spacer(),
        _BarcodeTag(code: barcode),
      ],
    );
  }
}

class _ProgressRing extends StatelessWidget {
  final double value;
  final String label;
  const _ProgressRing({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value,
            strokeWidth: 3,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BarcodeTag extends StatelessWidget {
  final String code;
  const _BarcodeTag({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: List.generate(
              15,
              (i) => Container(
                width: i % 3 == 0 ? 3 : 1.5,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 0.5),
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            code,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
